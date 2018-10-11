<?php
namespace App\Utils;
use App\Models\User;
use App\Models\Node;
use App\Models\Relay;
use App\Services\Config;

class V2URL {
    public static function getAllUrl($user, $enter = 0) {
        $items = V2URL::getAllItems($user);
        $return_url = '';
        foreach($items as $item) {
            $return_url .= V2URL::getItemUrl($item).($enter == 0 ? ' ' : "\n");
        }
        //var_dump($items);
        //is_ss始终为否，enter1 使用换行分割，enter0 使用空格分割
        return $return_url;
    }

    public static function getAllItems($user) {
        $return_array = array();
        if ($user->is_admin) {
            $nodes=Node::where(
                function ($query) {
                    $query->where('sort', 11);
                }
            )->where("type", "1")->orderBy("display_order")->get();
            //var_dump($nodes);
        } else {
            $nodes=Node::where(
                function ($query) {
                    $query->where('sort', 11);
                }
            )->where(
                function ($query) use ($user){
                    $query->where("node_group", "=", $user->node_group)
                    ->orWhere("node_group", "=", 0);
                }
            )->where("type", "1")->where("node_class", "<=", $user->class)->orderBy("display_order")->get();
        }

        foreach ($nodes as $node) {
            $item = V2URL::getItem($user, $node);
            if($item != null) {
                array_push($return_array, $item);
            }
        }
        return $return_array;
    }

    public static function getItem($user, $node) {
        $node_name = $node->name;
        $return_array['v'] = "2";
        $return_array['address'] = $node->server;
        $return_array['port'] = $node->v2ray_port;
        $return_array['uuid'] = $user->v2ray_uuid;
        $return_array['aid'] = $user->v2ray_alter_id;
        $return_array['security'] = "auto";
        $return_array['network'] = $node->v2ray_network;
        $return_array['host'] = "";
        $return_array['type'] = $node->v2ray_type;
        $return_array['path'] = $node->v2ray_path;
        $return_array['tls'] = $node->v2ray_tls;
        $return_array['remark'] = $node_name;
        return $return_array;
    }

    public static function getItemUrl($item){
        $v2url = "";

        $item['ps'] = $item['remark'];
        $item['add'] = $item['address'];
        $item['port'] = $item['port'];
        $item['id'] = $item['uuid'];
        $item['aid'] = $item['aid'];
        $item['net'] = $item['network'];
        $item['type'] = $item['type'];
        $item['host'] = $item['host'];
        $item['path'] = $item['path'];
        $item['tls'] = $item['tls'];
        $arr = array('v'=>'2', 'ps'=>$item['ps'], 'add'=>$item['add'], 'port'=>$item['port'],
            'id'=>$item['id'], 'aid'=>$item['aid'], 'net'=>$item['network'], 'type'=>$item['type'], 'host'=>$item['host'],
            'path'=>$item['path'], 'tls'=>$item['tls']);
        $v2url = "vmess://".base64_encode((json_encode($arr, JSON_UNESCAPED_UNICODE)));
        //$v2url = "{"."\n  \"v\": \"2\",\n  \"ps\": \"".$item['ps']."\",\n  \"add\":  \"".$item['add']."\",\n  \"port\":  \"".$item['port']."\",\n  \"id\":  \"".$item['id']."\",\n  \"aid\":  \"".$item['aid']."\",\n  \"net\":  \"".$item['net']."\",\n  \"type\":  \"".$item['type']."\",\n  \"host\": \"\",\n  \"path\": \"\",\n  \"tls\": \"\"";
        return $v2url;
    }
}