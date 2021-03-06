<?php

namespace App\Controllers;

use App\Models\PasswordReset;
use App\Models\User;
use App\Services\Password;
use App\Utils\Hash;

/***
 * Class Password
 * @package App\Controllers
 * 密码重置
 */
class PasswordController extends BaseController
{
    public function reset()
    {
        return $this->view()->display('password/reset.tpl');
    }

    public function handleReset($request, $response, $args)
    {
        $email = $request->getParam('email');
        // check limit

        // send email
        $user = User::where('email', $email)->first();
        if ($user == null) {
            $rs['ret'] = 0;
            $rs['msg'] = '此邮箱不存在.';
            return $response->getBody()->write(json_encode($rs));
        }
        $sendRes = Password::sendResetEmail($email);
        if ($sendRes) {
            $rs['ret'] = 1;
            $rs['msg'] = '重置邮件已经发送,请检查邮箱.';
            return $response->getBody()->write(json_encode($rs));
        }
        else {
            $rs['ret'] = 0;
            $rs['msg'] = '发送失败,请重试.';
            return $response->getBody()->write(json_encode($rs));
        }
        
    }

    public function token($request, $response, $args)
    {
        $token = $args['token'];
        return $this->view()->assign('token', $token)->display('password/token.tpl');
    }

    public function handleToken($request, $response, $args)
    {
        $tokenStr = $args['token'];
        $password = $request->getParam('password');
        // check token
        $token = PasswordReset::where('token', $tokenStr)->first();
        if ($token == null || $token->expire_time < time()) {
            $rs['ret'] = 0;
            $rs['msg'] = '链接已经失效,请重新获取';
            return $response->getBody()->write(json_encode($rs));
        }

        $user = User::where('email', $token->email)->first();
        if ($user == null) {
            $rs['ret'] = 0;
            $rs['msg'] = '链接已经失效,请重新获取';
            return $response->getBody()->write(json_encode($rs));
        }
        
        if (strlen($password) < 8) {
            $rs['ret'] = 0;
            $rs['msg'] = "密码太短啦（8位以上）";
            return $response->getBody()->write(json_encode($rs));
        }

        // reset password
        $hashPassword = Hash::passwordHash($password);
        $user->pass = $hashPassword;
        if (!$user->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = '重置失败,请重试';
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = '重置成功';
        return $response->getBody()->write(json_encode($rs));
    }
}