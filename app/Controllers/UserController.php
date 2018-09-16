<?php

namespace App\Controllers;

use App\Models\CheckInLog;
use App\Models\InviteCode;
use App\Models\Node;
use App\Models\TrafficLog;
use App\Models\ChargeCode;
use App\Models\PayLog;
use APP\Models\User;
use App\Services\Auth;
use App\Services\Config;
use App\Services\DbConfig;
use App\Utils\Hash;
use App\Utils\Tools;
use Illuminate\Database\Capsule\Manager as DB;
use Illuminate\Database\Eloquent\Model;
use App\Utils\V2URL;


/**
 *  HomeController
 */
class UserController extends BaseController
{

    private $user;

    public function __construct()
    {
        $this->user = Auth::getUser();
    }

    public function view()
    {
        $userFooter = DbConfig::get('user-footer');
        return parent::view()->assign('userFooter', $userFooter);
    }

    public function index($request, $response, $args)
    {
        $msg = DbConfig::get('user-index');
        if ($msg == null) {
            $msg = "在后台修改用户中心公告...";
        }
        //检查用户的uuid，如果没有，则创建。
        if ($this->user->v2ray_uuid == '') {           
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
            $this->user->v2ray_uuid = $this_uuid;
            $this->user->save();           
        }
        return $this->view()->assign('msg', $msg)->display('user/index.tpl');
    }
    
    public function getlink($request, $response, $args)
    {
        /*
        $type = "ss";
        if (isset($request->getQueryParams()["t"])) {
            $type = $request->getQueryParams()["t"];
        }
        if ($type == "v") {
            $v2ray_sub_token = LinkController::GenerateV2raySubCode($this->user->id, 0);
            echo $v2ray_sub_token;
            return;
        } */
        $ssr_sub_token = LinkController::GenerateSSRSubCode($this->user->id, 0);
        echo $ssr_sub_token;
    }
    
    public function node($request, $response, $args)
    {
        $msg = DbConfig::get('user-node');
        $user = Auth::getUser();
        $nodes = Node::where([['type', '=', 1], ['node_group', '=', $user->node_group]])->orderBy('name')->get();
        $v_nodes_count = Node::where([['type', '=', 1], ['sort', '=', 11],['node_group', '=', $user->node_group]])->count();
        $sub_token = LinkController::GenerateSSRSubCode($this->user->id, 0);
        $public_config = Config::getPublicConfig();
        $sub_url = $public_config['subUrl']."/s/";
        $ssr_sub = $sub_url.$sub_token."";
        $v_sub = $sub_url.$sub_token."/v";
        return $this->view()->assign('v_nodes_count', $v_nodes_count)->assign('nodes', $nodes)->assign('ssr_sub', $ssr_sub)->assign('v_sub', $v_sub)->assign('user', $user)->assign('msg', $msg)->display('user/node.tpl');
    }


    public function nodeInfo($request, $response, $args)
    {
        $id = $args['id'];
        $node = Node::find($id);

        if ($node == null or $node->node_group <> $this->user->node_group) {
            echo("请求错误");
            return;
        }
        if ($this->user->enable <> 1) {
            echo("账户已到期，请续费");
            return;
        }
        if ($node->sort == 11) {
            $v2url = "";
            $v2url = V2URL::getItemUrl(V2URL::getItem($this->user, $node));
            return $this->view()->assign('v2url', $v2url)->assign('node', $node)->display('user/nodeinfo_v2ray.tpl');
        }
        $ary['server'] = $node->server;
        $ary['server_port'] = $this->user->port;
        $ary['password'] = $this->user->passwd;
        $ary['method'] = $node->method;
        $ary['node_name'] = $node->name;
        //不允许自定义加密方法
        //if ($node->custom_method) {
            //$ary['method'] = $this->user->method;
        //} 
        $json = json_encode($ary);
        $json_show = json_encode($ary, JSON_PRETTY_PRINT);
        $ssurl = $ary['method'] . ":" . $ary['password'] . "@" . $ary['server'] . ":" . $ary['server_port'];
        $ssqr = "ss://" . base64_encode($ssurl);
        
        /*
        $surge_base = Config::get('baseUrl') . "/downloads/ProxyBase.conf";
        $surge_proxy = "#!PROXY-OVERRIDE:ProxyBase.conf\n";
        $surge_proxy .= "[Proxy]\n";
        $surge_proxy .= "Proxy = custom," . $ary['server'] . "," . $ary['server_port'] . "," . $ary['method'] . "," . $ary['password'] . "," . Config::get('baseUrl') . "/downloads/SSEncrypt.module";

        return $this->view()->assign('json', $json)->assign('json_show', $json_show)->assign('ssqr', $ssqr)->assign('surge_base', $surge_base)->assign('surge_proxy', $surge_proxy)->display('user/nodeinfo.tpl');
        */
        return $this->view()->assign('json', $json)->assign('json_show', $json_show)->assign('ssqr', $ssqr)->assign('ary', $ary)->display('user/nodeinfo.tpl');
    }

    public function profile($request, $response, $args)
    {
        return $this->view()->display('user/profile.tpl');
    }

    public function edit($request, $response, $args)
    {
        $method = Node::getCustomerMethod();
        return $this->view()->assign('method', $method)->display('user/edit.tpl');
    }


    public function invite($request, $response, $args)
    {
        $codes = $this->user->inviteCodes();
        return $this->view()->assign('codes', $codes)->display('user/invite.tpl');
    }

    public function doInvite($request, $response, $args)
    {
        $n = $request->getParam('num');
        if ($n < 1 || $n > $this->user->invite_num) {
            $res['ret'] = 0;
            return $response->getBody()->write(json_encode($res));
        }
        for ($i = 0; $i < $n; $i++) {
            $char = Tools::genRandomChar(32);
            $code = new InviteCode();
            $code->code = $char;
            $code->user_id = $this->user->id;
            $code->save();
        }
        $this->user->invite_num = $this->user->invite_num - $request->getParam('num');
        $this->user->save();
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }

    public function sys($request, $response, $args)
    {
        return $this->view()->assign('ana', "")->display('user/sys.tpl');
    }

    public function updatePassword($request, $response, $args)
    {
        $oldpwd = $request->getParam('oldpwd');
        $pwd = $request->getParam('pwd');
        $repwd = $request->getParam('repwd');
        $user = $this->user;
        if (!Hash::checkPassword($user->pass, $oldpwd)) {
            $res['ret'] = 0;
            $res['msg'] = "旧密码错误";
            return $response->getBody()->write(json_encode($res));
        }
        if ($pwd != $repwd) {
            $res['ret'] = 0;
            $res['msg'] = "两次输入不符合";
            return $response->getBody()->write(json_encode($res));
        }

        if (strlen($pwd) < 8) {
            $res['ret'] = 0;
            $res['msg'] = "密码太短啦（8位以上）";
            return $response->getBody()->write(json_encode($res));
        }
        $hashPwd = Hash::passwordHash($pwd);
        $user->pass = $hashPwd;
        $user->save();

        $res['ret'] = 1;
        $res['msg'] = "ok";
        return $this->echoJson($response, $res);
    }

    public function updateSsPwd($request, $response, $args)
    {
        $user = Auth::getUser();
        $pwd = $request->getParam('sspwd');
        if (strlen($pwd) == 0) {
            $pwd = Tools::genRandomChar(8);
        } elseif (strlen($pwd) < 5) {
            $res['ret'] = 0;
            $res['msg'] = "密码要大于4位或者留空生成随机密码";
            return $response->getBody()->write(json_encode($res));;
        }
        $user->updateSsPwd($pwd);
        $res['ret'] = 1;
        $res['msg'] = sprintf("新密码为: %s", $pwd);
        return $this->echoJson($response, $res);
    }

    public function updateMethod($request, $response, $args)
    {
        $user = Auth::getUser();
        $method = $request->getParam('method');
        $method = strtolower($method);
        $user->updateMethod($method);
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }

    public function logout($request, $response, $args)
    {
        Auth::logout();
        $newResponse = $response->withStatus(302)->withHeader('Location', '/auth/login');
        return $newResponse;
    }

    public function doCheckIn($request, $response, $args)
    {
        if (!$this->user->isAbleToCheckin()) {
            $res['msg'] = "您似乎已经签到过了...";
            $res['ret'] = 1;
            return $response->getBody()->write(json_encode($res));
        }
        $traffic = rand(Config::get('checkinMin'), Config::get('checkinMax'));
        $trafficToAdd = Tools::toMB($traffic);
        $this->user->transfer_enable = $this->user->transfer_enable + $trafficToAdd;
        $this->user->last_check_in_time = time();
        $this->user->save();
        // checkin log
        try {
            $log = new CheckInLog();
            $log->user_id = Auth::getUser()->id;
            $log->traffic = $trafficToAdd;
            $log->checkin_at = time();
            $log->save();
        } catch (\Exception $e) {
        }
        $res['msg'] = sprintf("获得了 %u MB流量.", $traffic);
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }
/*
    public function kill($request, $response, $args)
    {
        return $this->view()->display('user/kill.tpl');
    }

    public function handleKill($request, $response, $args)
    {
        $user = Auth::getUser();
        $passwd = $request->getParam('passwd');
        // check passwd
        $res = array();
        if (!Hash::checkPassword($user->pass, $passwd)) {
            $res['ret'] = 0;
            $res['msg'] = " 密码错误";
            return $this->echoJson($response, $res);
        }
        Auth::logout();
        $user->delete();
        $res['ret'] = 1;
        $res['msg'] = "GG!您的帐号已经从我们的系统中删除.";
        return $this->echoJson($response, $res);
    }
*/
    public function trafficLog($request, $response, $args)
    {
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
        $traffic = TrafficLog::where('user_id', $this->user->id)->orderBy('id', 'desc')->paginate(15, ['*'], 'page', $pageNum);
        $traffic->setPath('/user/trafficlog');
        return $this->view()->assign('logs', $traffic)->display('user/trafficlog.tpl');
    }
    
    public function charge($request, $response, $args)
    {
        return $this->view()->display('user/charge.tpl');
    }
    
    public function handleCharge($request, $response, $args)
    {
        $code = $request->getParam("code");
        $charge_code = ChargeCode::where('code', $code)->first();
        if ($charge_code == null) {
            $ret['ret'] = 0;
            $res['error_code'] = 501;
            $res['msg'] = "充值码无效或已被使用";
            return $this->echoJson($response, $res);
        }
        if ($charge_code->used <> 0 ){
            $ret['ret'] = 0;
            $res['error_code'] = 501;
            $res['msg'] = "充值码无效或已被使用";
            return $this->echoJson($response, $res);
        }
        $user = Auth::getUser();
        if ($user == null){
            $ret['ret'] = 0;
            $res['error_code'] = 501;
            $res['msg'] = "获取充值账户失败，请重新登录";
            return $this->echoJson($response, $res);
        }
        $charge_code->used = 1;
        $charge_code->used_user_email = $user->email;
        $charge_code->used_at = time();
        
        $user_exp_time = $user->expire_time;
        if ($user_exp_time >= time()) {
            $user->expire_time += $charge_code->charge_time * 86400;
        }
        else {
            $user->expire_time = time() + $charge_code->charge_time * 86400;
        }
        $user->enable = 1;
        //充值是否重置流量？
        
        //用户充值事务处理
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
            $res['msg'] = "充值失败";
            return $this->echoJson($response, $res);
        }
        $res['ret'] = 1;
        $res['msg'] = "充值成功！如果账户已停用，请耐心等待3-5分钟系统自动开通线路。";
        //$c->delete();
        return $this->echoJson($response, $res);
    }
    
    public function pay($request, $response, $args)
    {
        $user = Auth::getUser();
        $ary = $request->getQueryParams();
        $t = "";
        if (isset($ary['t'])) {
            $t = Tools::checkHtml($ary['t']);
        }
        $codepay_config = Config::getCodepayConfig();
        $codepay_id = $codepay_config['codepay_id']; //支付ID
        $codepay_token = $codepay_config['codepay_token'];
        $codepay_notify_url = $codepay_config['codepay_notify_url'];
        #$codepay_key = $codepay_config['codepay_key']; //通讯密钥
 
        $pay_id = $user->id;
        $price = 15;
        switch ($t)
        {
            case "m":
                $price = 15;
                break;
            case "s":
                $price = 45;
                break;
            case "y":
                $price = 158;
                break;
            default:
                $price=15;
        }
        $pay_url = "http://codepay.fateqq.com:52888/creat_order/?id=".$codepay_id."&token=".$codepay_token."&price=".$price."&pay_id=".$pay_id."&type=1&page=1";
        if($codepay_notify_url != ''){
            $pay_url = "http://codepay.fateqq.com:52888/creat_order/?id=".$codepay_id."&token=".$codepay_token."&price=".$price."&pay_id=".$pay_id."&type=1&page=1&notify_url=".$codepay_notify_url;
        }
        $pay_info['email'] = $user->email;
        $pay_info['price'] = $price;
        return $this->view()->assign('pay_url', $pay_url)->assign('pay_info', $pay_info)->display('user/pay.tpl');
    }
    
    public function handlePayNotify($request, $response, $args){
        ksort($_POST); //排序post参数
        reset($_POST); //内部指针指向数组中的第一个元素
        $sign = '';
        $codepay_config = Config::getCodepayConfig();
        $codepay_key = $codepay_config['codepay_key']; //通讯密钥
        foreach ($_POST AS $key => $val) {
            if ($val == '') continue; //跳过空值
            if ($key != 'sign') { //跳过sign
                $sign .= "$key=$val&"; //拼接为url参数形式
            }
        }
        if (!$_POST['pay_no']||md5(substr($sign, 0, -1) .  $codepay_key) != $_POST['sign']) { //KEY密钥为你的密钥
            //不合法的数据 不做处理
            exit('fail');
        }else{ //合法的数据
            //业务处理
            // $_POST['pay_id'] 这是付款人的唯一身份标识或订单ID
            // $_POST['pay_no'] 这是流水号 没有则表示没有付款成功 流水号不同则为不同订单
            // $_POST['money'] 这是付款金额
            //  $_POST['param'] 这是自定义的参数
            $user_id = $_POST['pay_id'];
            $money = $_POST['money'];
            $user = User::where('id', $user_id)->first();
            
            $charge_time = 30;
            if($money >= 15 && $money <= 16)
            {
                $charge_time = 30;
            }
            elseif($money >= 45 && $money <= 46)
            {
                $charge_time = 90;
            }
            elseif($money >= 158 && $money <= 159)
            {
                $charge_time = 365;
            }
            $user_exp_time = $user->expire_time;
            if ($user_exp_time >= time()) {
                $user->expire_time += $charge_time * 86400;
            }
            else {
                $user->expire_time = time() + $charge_time * 86400;
            }
            $user->enable = 1;
            
            $paylog = new PayLog();
            $paylog->pay_no = $_POST['pay_no'];
            $paylog->pay_id = $user_id;
            $paylog->price = $_POST['price'];
            $paylog->money = $_POST['money'];
            $paylog->pay_business_type = 'codepay';
            $paylog->type = $_POST['type'];
            $paylog->param = $_POST['param'];
            $paylog->pay_time = $_POST['pay_time'];
            $paylog->pay_tag = $_POST['pay_tag'];
            
            try
            {
                DB::beginTransaction();
                $user->save();
                $paylog->save();
                DB::commit();
            }
            catch (\Exception $e)
            {
                DB::rollBack();
                exit('fail');
            }
            exit('success');
        }
    }
    
}
