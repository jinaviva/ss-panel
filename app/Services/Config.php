<?php

namespace App\Services;

use Pongtan\Services\Config as PongtanConfig;


class Config extends PongtanConfig
{
    public static function getPublicConfig()
    {
        return [
            "appName" => self::getAppName(),
            "version" => self::get("version"),
            "baseUrl" => self::get("baseUrl"),
            "checkinTime" => self::get("checkinTime"),
            "checkinMin" => self::get("checkinMin"),
            "checkinMax" => self::get("checkinMax"),
            "subUrl" => self::get("subUrl"),
            "bakUrl" => self::get("bakUrl"),
            "dlUrl1" => self::get("dlUrl1"),
            "dlUrl2" => self::get("dlUrl2"),
            "buyCard" => self::getBuyCardAddr(),
            "serviceQq" => self::getServiceQq(),
        ];
    }

    public static function getAppName()
    {
        $appName = DbConfig::get('app-name');
        if ($appName == null || $appName == "") {
            return self::get("appName");
        }
        return $appName;
    }
    
    public static function getBuyCardAddr()
    {
        $buyCard = DbConfig::get('buy_card_addr');
        if ($buyCard == null || $buyCard == "") {
            return self::get("buyCard");
        }
        return $buyCard;
    }
    
    public static function getServiceQq()
    {
        $serviceQq = DbConfig::get('service_qq');
        if ($serviceQq == null || $serviceQq == "") {
            return self::get("serviceQq");
        }
        return $serviceQq;
    }

    public static function getDbConfig()
    {
        return [
            'driver' => self::get('db_driver'),
            'host' => self::get('db_host'),
            'port' => self::get('db_port'),
            'database' => self::get('db_database'),
            'username' => self::get('db_username'),
            'password' => self::get('db_password'),
            'charset' => self::get('db_charset'),
            'collation' => self::get('db_collation'),
            'prefix' => self::get('db_prefix')
        ];
    }
    
    public static function getCodepayConfig()  //读取码支付配置
    {
        return [
            'codepay_id' => self::get('codepay_id'),
            'codepay_token' => self::get('codepay_token'),
            'codepay_key' => self::get('codepay_key'),
            'codepay_notify_url' => self::get('codepay_notify_url')
        ];
    }
    
    public static function getSupportParam($type)
    {
        switch ($type) {
            case 'obfs':
                $list = array('plain', 'http_simple', 'http_simple_compatible', 'http_post', 'http_post_compatible',
                'tls1.2_ticket_auth', 'tls1.2_ticket_auth_compatible', 'tls1.2_ticket_fastauth', 'tls1.2_ticket_fastauth_compatible',
                'simple_obfs_http', 'simple_obfs_http_compatible', 'simple_obfs_tls', 'simple_obfs_tls_compatible');
                return $list;
            case 'protocol':
                $list = array('origin', 'verify_deflate',
                'auth_sha1_v4', 'auth_sha1_v4_compatible', 'auth_aes128_sha1', 'auth_aes128_md5', 'auth_chain_a', 'auth_chain_b','auth_chain_c','auth_chain_d','auth_chain_e','auth_chain_f');
                return $list;
            case 'allow_none_protocol':
                $list = array('auth_chain_a', 'auth_chain_b','auth_chain_c','auth_chain_d','auth_chain_e','auth_chain_f');
                return $list;
            case 'relay_able_protocol':
                $list = array('auth_aes128_md5', 'auth_aes128_sha1', 'auth_chain_a', 'auth_chain_b','auth_chain_c','auth_chain_d','auth_chain_e','auth_chain_f');
                return $list;
            case 'ss_aead_method':
                $list = array('aes-128-gcm', 'aes-192-gcm',
                'aes-256-gcm', 'chacha20-ietf-poly1305', 'xchacha20-ietf-poly1305');
                return $list;
            case 'ss_obfs':
                $list = array('simple_obfs_http', 'simple_obfs_http_compatible', 'simple_obfs_tls', 'simple_obfs_tls_compatible');
                return $list;
            default:
                $list = array('rc4-md5', 'rc4-md5-6', 'aes-128-cfb', 'aes-192-cfb', 'aes-256-cfb',
                'aes-128-ctr', 'aes-192-ctr', 'aes-256-ctr', 'camellia-128-cfb', 'camellia-192-cfb', 'camellia-256-cfb',
                'bf-cfb', 'cast5-cfb', 'des-cfb', 'des-ede3-cfb', 'idea-cfb',
                'rc2-cfb', 'seed-cfb', 'salsa20', 'chacha20', 'xsalsa20', 'chacha20-ietf', 'aes-128-gcm', 'aes-192-gcm', 'none',
                'aes-256-gcm', 'chacha20-ietf-poly1305', 'xchacha20-ietf-poly1305');
                return $list;
        }
    }
    
    public static function getStoragePath($dir)
    {
        return BASE_PATH . '/storage/' . $dir;
    }

}