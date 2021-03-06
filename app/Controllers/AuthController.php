<?php

namespace App\Controllers;

use App\Models\InviteCode;
use App\Models\ChargeCode;
use App\Models\ConfigModel;
use App\Models\User;
use App\Services\Auth;
use App\Services\Auth\EmailVerify;
use App\Services\Config;
use App\Services\Logger;
use App\Services\Mail;
use App\Utils\Check;
use App\Utils\Hash;
use App\Utils\Http;
use App\Utils\Tools;
use Illuminate\Database\Capsule\Manager as DB;


/**
 *  AuthController
 */
class AuthController extends BaseController
{
    // Register Error Code
    const WrongCode = 501;
    const IllegalEmail = 502;
    const PasswordTooShort = 511;
    const PasswordNotEqual = 512;
    const EmailUsed = 521;

    // Login Error Code
    const UserNotExist = 601;
    const UserPasswordWrong = 602;

    // Verify Email
    const VerifyEmailWrongEmail = 701;
    const VerifyEmailExist = 702;

    public function login($request, $response, $args)
    {
        return $this->view()->display('auth/login.tpl');
    }

    public function loginHandle($request, $response, $args)
    {
        // $data = $request->post('sdf');
        $email = $request->getParam('email');
        $email = strtolower($email);
        $passwd = $request->getParam('passwd');
        $rememberMe = $request->getParam('remember_me');

        // Handle Login
        $user = User::where('email', '=', $email)->first();

        if ($user == null) {
            $res['ret'] = 0;
            $res['error_code'] = self::UserNotExist;
            $res['msg'] = "邮箱或者密码错误";
            return $this->echoJson($response, $res);
        }

        if (!Hash::checkPassword($user->pass, $passwd)) {
            $res['ret'] = 0;
            $res['error_code'] = self::UserPasswordWrong;
            $res['msg'] = "邮箱或者密码错误";
            return $this->echoJson($response, $res);
        }
        // @todo
        $time = 3600 * 24;
        if ($rememberMe) {
            $time = 3600 * 24 * 7;
        }
        Logger::info("login user $user->id ");
        Auth::login($user->id, $time);

        $res['ret'] = 1;
        $res['msg'] = "欢迎回来";
        return $this->echoJson($response, $res);
    }

    public function register($request, $response, $args)
    {
        $ary = $request->getQueryParams();
        $code = "";
        if (isset($ary['code'])) {
            $code = Tools::checkHtml($ary['code']);
        }
        $requireEmailVerification = Config::get('emailVerifyEnabled');
        return $this->view()->assign('code', $code)->assign('requireEmailVerification', $requireEmailVerification)->display('auth/register.tpl');
    }

    public function registerHandle($request, $response, $args)
    {
        $name = $request->getParam('name');
        $email = $request->getParam('email');
        $email = strtolower($email);
        $passwd = $request->getParam('passwd');
        $repasswd = $request->getParam('repasswd');
        $code = $request->getParam('code');
        $verifycode = $request->getParam('verifycode');
        
        /*
        // check code
        $c = InviteCode::where('code', $code)->first();
        if ($c == null) {
            $res['ret'] = 0;
            $res['error_code'] = self::WrongCode;
            $res['msg'] = "邀请码无效";
            return $this->echoJson($response, $res);
        }
        */
        
        //check charge code
        $charge_code = ChargeCode::where('code', $code)->first();
        if ($charge_code == null) {
            $ret['ret'] = 0;
            $res['error_code'] = self::WrongCode;
            $res['msg'] = "激活码无效";
            return $this->echoJson($response, $res);
        }
        if ($charge_code->used <> 0 ){
            $ret['ret'] = 0;
            $res['error_code'] = self::WrongCode;
            $res['msg'] = "激活码无效";
            return $this->echoJson($response, $res);
        }
        
        // get current node group id
        $node_group = ConfigModel::where('key','cur_node_group')->first();
        if ($node_group != null) {
            $np_id = $node_group->value;
        }
        else {
            $np_id = 1; //使用默认np_id
            //throw_exception("获取数据库node_group失败，使用默认id值1");
        }
        
        // check email format
        if (!Check::isEmailLegal($email)) {
            $res['ret'] = 0;
            $res['error_code'] = self::IllegalEmail;
            $res['msg'] = "邮箱无效";
            return $this->echoJson($response, $res);
        }
        // check pwd length
        if (strlen($passwd) < 8) {
            $res['ret'] = 0;
            $res['error_code'] = self::PasswordTooShort;
            $res['msg'] = "密码太短啦（8位以上）";
            return $this->echoJson($response, $res);
        }

        // check pwd re
        if ($passwd != $repasswd) {
            $res['ret'] = 0;
            $res['error_code'] = self::PasswordNotEqual;
            $res['msg'] = "两次密码输入不符";
            return $this->echoJson($response, $res);
        }

        // check email
        $user = User::where('email', $email)->first();
        if ($user != null) {
            $res['ret'] = 0;
            $res['error_code'] = self::EmailUsed;
            $res['msg'] = "邮箱已经被注册了";
            return $this->echoJson($response, $res);
        }

        // verify email
        if (Config::get('emailVerifyEnabled') && !EmailVerify::checkVerifyCode($email, $verifycode)) {
            $res['ret'] = 0;
            $res['msg'] = '邮箱验证代码不正确';
            return $this->echoJson($response, $res);
        }

        // check ip limit
        $ip = Http::getClientIP();
        $ipRegCount = Check::getIpRegCount($ip);
        if ($ipRegCount >= Config::get('ipDayLimit')) {
            $res['ret'] = 0;
            $res['msg'] = '当前IP注册次数超过限制';
            return $this->echoJson($response, $res);
        }

        // do reg user
        $user = new User();
        $user->user_name = $name;
        $user->email = $email;
        $user->pass = Hash::passwordHash($passwd);
        $user->passwd = Tools::genRandomChar(6);
        $user->port = Tools::getLastPort() + 1;
        $user->t = 0;
        $user->u = 0;
        $user->d = 0;
        $user->transfer_enable = Tools::toGB(Config::get('defaultTraffic'));
        $user->invite_num = 0;//Config::get('inviteNum');
        $user->reg_ip = Http::getClientIP();
        $user->ref_by = 1;//$c->user_id;
        $user->node_group = $np_id;
        $user->expire_time = time() + $charge_code->charge_time * 86400;
        $user->v2ray_alter_id = 2;
        $user->v2ray_level = 2;
        
        $this_uuid =  Tools::genUUID();
        $i = 0;
        while (User::where('v2ray_uuid', '=', $this_uuid)->count() > 0 )
        {
            if ($i > 10 ){
                $this_uuid = '';
                break;
            }
            $this_uuid = Tools::genUUID();
            $i++;
        }
        $user->v2ray_uuid = $this_uuid;
        
        
        $charge_code->used = 1;
        $charge_code->used_user_email = $email;
        $charge_code->used_at = time();
        
        //用户创建和充值事务处理。
        try
        {
            DB::beginTransaction();
            $user->save();
            $charge_code->save();
            DB::commit();
        }
        catch (\Exception $e)
        {
            DB::rollBack();
            $res['ret'] = 0;
            $res['msg'] = $e;//"未知错误";
            return $this->echoJson($response, $res);
        }
        $res['ret'] = 1;
        $res['msg'] = "注册成功";
        //$c->delete();
        return $this->echoJson($response, $res);
        
        /*
        if ($user->save()) {
            $res['ret'] = 1;
            $res['msg'] = "注册成功";
            $c->delete();
            return $this->echoJson($response, $res);
        }
        */
    }

    public function sendVerifyEmail($request, $response, $args)
    {
        $res = [];
        $email = $request->getParam('email');

        if (!Check::isEmailLegal($email)) {
            $res['ret'] = 0;
            $res['error_code'] = self::VerifyEmailWrongEmail;
            $res['msg'] = '邮箱无效';
            return $this->echoJson($response, $res);
        }

        // check email
        $user = User::where('email', $email)->first();
        if ($user != null) {
            $res['ret'] = 0;
            $res['error_code'] = self::VerifyEmailExist;
            $res['msg'] = "邮箱已经被注册了";
            return $this->echoJson($response, $res);
        }

        if (EmailVerify::sendVerification($email)) {
            $res['ret'] = 1;
            $res['msg'] = '验证代码已发送至您的邮箱，请在登录邮箱后将验证码填到相应位置.';
            return $this->echoJson($response, $res);
        }
        $res['ret'] = 0;
        $res['msg'] = '邮件发送失败，请联系管理员';
        return $this->echoJson($response, $res);
    }

    public function logout($request, $response, $args)
    {
        Auth::logout();
        return $this->redirect($response, '/auth/login');
    }

}
