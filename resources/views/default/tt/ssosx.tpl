<!DOCTYPE html>
<html lang="zh-ch">
<head>
	<title>MAC电脑SS使用教程
	</title>
	<meta charset="utf-8">
	<style type="text/css">
		div{
			width: 768px;
			margin: 0 auto;
		}
		h2{
			color: #666;
		}
		p{
			font-size: 25px;
		}
		a {
			padding: 0px 10px;
		}
	</style>
</head>
<body>
<div>
<h1>Mac系统SS使用教程<a href="/tt">返回教程列表</a></h1>
<h2>一、准备</h2>
<p>1）系统要求Mac OS X 10.11+</p>
<p>2）ShadowsocksX-NG软件（推荐下载最新1.8.2版本）：</p> 
<p>1.8.2版：<a href="{$config['dlUrl1']}/downloads/dl/osx/ShadowsocksX-NG.app.1.8.2.zip">下载链接1</a><a href="{$config['dlUrl2']}/downloads/dl/osx/ShadowsocksX-NG.app.1.8.2.zip">下载链接2</a></p>
<!--
<p>1.5.1版：<a href="http://dl1.netxyz.me/dl/osx/ShadowsocksX-NG.1.5.1.zip">下载链接1</a><a href="http://dl2.netxyz.me/dl/osx/ShadowsocksX-NG.1.5.1.zip">下载链接2</a></p>
<p>1.4版：<a href="http://dl1.netxyz.me/dl/osx/ShadowsocksX-NG-1.4.zip">下载链接1</a><a href="http://dl2.netxyz.me/dl/osx/ShadowsocksX-NG-1.4.zip">下载链接2</a></p>
-->
<p>如果Mac系统提示文件包损坏，说明您的当前Mac系统不支持该版本，请使用ShadowsocksX-2.6.3版本：<a href="{$config['dlUrl1']}/downloads/dl/osx/ShadowsocksX-2.6.3.dmg" target="_blank">下载链接1</a> <a href="{$config['dlUrl2']}/downloads/dl/osx/ShadowsocksX-2.6.3.dmg" target="_blank">下载链接2</a></p>

<p>3）ss账号和二维码信息（如何获取？下单后，使用充值码到管理后台注册账户。登录管理后台—节点列表—点击您想使用的线路进去，即可查看到ss账号和二维码信息）</p>
<h2>二、配置</h2>
<p>1）打开下载好的ShadowsocksX-NG-1.4.zip</p><img src="/assets/public/img/tt/ss/osx/2.png">
<p>2）运行ShadowsocksX-NG，右上角任务栏出现小飞机图标，表示已经运行成功，不要运行出很多个小飞机，1个就够。</p>
<p>3）鼠标右键点击小飞机图标，选择【服务器】--【服务器设置】，单击打开。</p>
<img src="/assets/public/img/tt/ss/osx/3.jpg">
<p>4）点击+号新增服务器（可以添加多个服务器）。</p>
<img src="/assets/public/img/tt/ss/osx/4.jpg">
<p>5）如图依次填入ss账号信息：【地址栏前面填服务器、冒号后面填端口】，【加密方法对应加密模式（选择rc4-md5）】，【密码栏填密码】，备注随便填只是一个标识（我这里就使用“Q422”这个名字），不勾选OTA和Enable over kcptun。最后点击确定</p>
<img src="/assets/public/img/tt/ss/osx/5.jpg">
<p>6）再次鼠标右键点击小飞机图标：勾选【全局模式】，确定我们刚才添加的“Q422”已经勾选上。</p>
<img src="/assets/public/img/tt/ss/osx/6.jpg">
<h2>三、使用</h2>
<p>1）验证是否成功？用浏览器（不管自带的是Safari，还是安装的chrome、firefox只要配置正确均可），这里我就用自带浏览器Safari访问www.google.com 和www.youtube.com，能打开就代表成功。</p>
<p>2)如果按上述步骤配置后仍然不成功，请仔细检查服务器、端口、密码、加密模式是否填写正确。请尝试退出软件，关闭浏览器；然后再运行软件，打开浏览器。</p>
<p>3）【可选】您还可以在【偏好设置】下面，勾选【登录时自动启动】，这样软件在Mac开机后就能自动运行。勾选【在任务栏显示运行模式】，任务栏小飞机图标旁边会出现G和A标识，G表示当前运行与Global全局模式下，A表示当前运行于Auto自动模式下，您可以用ctrl+command+p快捷键进行切换（什么是全局模式和自动模式？）。</p>
<p>4）平时使用自动模式即可，全局模式下，访问国内网站会变慢。</p>
<h2>四、常见问题</h2>
<p>有的windows和mac用户反映，使用ss软件后，有时候重启电脑开机不能正常打开网页。这是因为ss软件在正常情况下，开启时会自动修改系统代理设置，退出时会再改回来。因为ss软件异常退出，没能将系统代理设置改回来，所以导致了不在正常上网。这时运行一次软件即可。或手动将系统代理设置取消，windows在控制面板-Internet选项-连接-局域网设置，取消勾选；Mac在系统偏好设置—网络—高级—代理，取消勾选。</p>

</div>
</body>
</html>