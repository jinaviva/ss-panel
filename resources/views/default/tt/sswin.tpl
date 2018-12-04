<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
	<title>Windows下SS安装使用教程</title>
	<style type="text/css">
		p,h2{
			
		}
		body{
			
		}
		div#main{
			width: 1280px;
			margin:0px auto;
		}
		a {
			padding: 0px 10px;
		}
	</style>
</head>
<body>
<div id="main">
<h1>Windows下SS安装使用教程<a href="/tt">返回教程列表</a></h1>
<h2>一、准备</h2>
<p>1）下载Shadowsocks软件（简称ss软件）。建议：XP、Win7用户使用2.58版本，Win8、10用户使用4.1.2版本（最新），Win7 SP1用户可以升级.net组件到4.62后，使用4.1.2版。<span style="color: red;">注意：2.58版需系统.net组件在4.0以上；4.1.2版需系统.net组件在4.62以上。若软件不能正常运行，请下载.net升级包升级，安装完成后需重启电脑一次。</span>
<h3 style="color: red;">若需解压密码，统一为：91xyzss</h3>
<p>4.12版本:<a href="{$config['dlUrl1']}/downloads/dl/win/ss-4.1.2.zip" target="_blank">下载链接1</a><a href="{$config['dlUrl2']}/downloads/dl/win/ss-4.1.2.zip" target="_blank">下载链接2</a></p>
<p>2.58版本:<a href="{$config['dlUrl1']}/downloads/dl/win/ss-2.5.8.zip" target="_blank">下载链接1</a><a href="{$config['dlUrl2']}/downloads/dl/win/vps-2.5.8.7z" target="_blank">下载链接2</a></p>
<!--
<p>2.31版本:<a href="http://dl1.netxyz.me/dl/win/ss-2.3.1.zip" target="_blank">下载链接1</a><a href="http://dl3.netxyz.me/dl/win/vps-2.3.1.7z" target="_blank">下载链接2</a></p>
<p>4.04版本:<a href="http://dl1.netxyz.me/dl/win/ss-4.0.4.zip" target="_blank">下载链接1</a><a href="http://dl3.netxyz.me/dl/win/vps-4.0.4.7z" target="_blank">下载链接2</a></p>
</p>
-->
<p>.net4.0升级包下载:<a href="{$config['dlUrl1']}/downloads/dl/win/dotNetFx40_Full_x86_x64.zip" target="_blank">下载1</a><a href="{$config['dlUrl2']}/downloads/dl/win/dotNetFx40_Full_x86_x64.zip" target="_blank">下载2</a></p>
<p>.net4.62升级包下载:<a href="{$config['dlUrl1']}/downloads/dl/win/NDP462-KB3151802-Web.zip" target="_blank">下载1</a><a href="{$config['dlUrl2']}/downloads/dl/win/dotNetFx40_Full_x86_x64.zip" target="_blank">下载2</a></p>

<p>2）ss账号或二维码。（如何获取？下单后，使用充值码到管理后台注册账户。登录管理后台—节点列表—点击您想使用的线路进去，即可查看到ss账号和二维码信息）</p>
<h2>二、配置</h2>
<h4>（您实际使用的软件版本，可能与教程中演示的图片略有差异）</h4>
<p>1）运行软件。解压运行ss软件<img src="/assets/public/img/tt/ss/win/1.png">，如遇电脑防火墙、杀软之类的提醒，一律点击允许。（建议卸载电脑上“卫士、管家”之类的所有国产“全家桶大礼包”软件，Win7以上系统开启自带Windows defender即可，并使用火狐或谷歌Chrome浏览器）</p>
<p>2）导入ss账号。以下介绍最简单快捷、不易出错的扫描二维码的方式（如果您的浏览器上显示不出账号二维码或扫码识别不成功，则请手动添加ss账号，方法见后常见问题第4项）：</p>

<p>2-a）软件运行后，点击【取消】软件运行后弹出的手动编辑服务器页面。</p>
<img src="/assets/public/img/tt/ss/win/2.jpg">
<hr>
<p>2-b）登录91xyzss网站后台，点节点列表——选择您欲使用的线路，点击进入，让账号二维码显示在电脑屏幕上。然后，鼠标右键点击电脑桌面右下任务栏小飞机图标，选择服务器—点击【扫描屏幕上的二维码】</p>
<img src="/assets/public/img/tt/ss/win/3.png">
<hr>
<img src="/assets/public/img/tt/ss/win/4.png">
<hr>
<p>2-c）扫码成功后，点击【确定】</p>
<p>2-d）如遇360卫士等软件提醒，要选择【允许程序所有操作】</p>
<img src="/assets/public/img/tt/ss/win/6.jpg">
<hr>
<p>2-e）再次通过鼠标右键打开软件菜单：a.勾选【启动系统代理】；b.确认刚才导入的【账号配置已勾选】；c.系统代理模式选择【PAC模式】</p>
<img src="/assets/public/img/tt/ss/win/5.jpg">
<hr>
<p>3）连接。打开浏览器访问 www.google.com 和 www.youtube.com。能显示，则表示代理连接成功。鼠标右键打开软件菜单—选择PAC—点击【从GFWlist更新本地PAC】。将系统代理模式切换为【PAC模式】，实现智能分流。目前，部分网站如Pinterest、或者小众网站，因pac文件未收录，则不能通过Pac模式智能识别，请用全局模式访问。（不推荐一直使用全局模式，原因见后）</p>
<p>4）连接不成功？请按以下步骤排查：1、检查同一ss账号在手机或其他电脑上是否正常，如果正常，说明ss账号没问题，问题在系统配置上。2、仔细检查ss软件是否正确配置，服务器、端口、密码、加密模式4个信息完全正确，并已启动系统代理。尝试退出软件，关闭浏览器；然后再运行软件，再打开浏览器。
3、检查ss软件是否成功设置了系统代理（杀毒软件会阻挡）。当ss软件开启并调为PAC模式时，控制面板—Internet选项—连接—局域网设置，【使用自动配置脚本】将会被勾选激活，并设置有地址信息。当ss软件开启并调为全局模式时，控制面板—Internet选项—连接—局域网设置，【为Lan使用代理服务器】将会被勾选激活，并设置有地址和端口。这些设置是软件自动会修改的，如果不能修改，说明您电脑上有关程序阻挡了软件的IE代理设置操作。
4、检查浏览器设置。使用插件的用户，请禁用浏览器的同类插件，如：去广告、unblockyouku、V/P/n之类插件。浏览器的代理设置应调为：使用系统代理设置。
5、公司、学校网络、长城宽带部分地区，网络供应商还可能设置有内部防火墙屏蔽了部分端口。如果同一ss账号用4G正常使用，而wifi网络不行，90%可能是网络管理员设置了防火墙。</p>
<p>5）连接还是不成功？可尝试使用火狐浏览器+手动配置代理的解决方案。步骤：a、下载安装firefox火狐浏览器最新版。b、运行ss软件，正确配置服务器线路，并启动系统代理。c、运行火狐浏览器，打开菜单—选项—高级—网络—配置Firefox 如何连接至国际互联网【设置】——勾选【手动配置代理】，Socks主机填：127.0.0.1，端口填：1080（与ss软件服务器配置页面代理端口相同，默认都为1080），勾选下方使用SOCKS v5代理DNS，最后确定。d、尝试打开google.com</p>
<!--
<p>6）还可以尝试使用SocksCap64软件，方法见常见问题第3项。</p>
-->

<h3>三、使用
<p>7）【可选】根据实际需要，灵活地在【系统代理模式】-》PAC模式、全局模式之间切换。</p>
<p>8）【可选】勾选开机启动</p>
<h2>PAC模式和全局模式的区别？</h2>
<p>PAC模式：智能分流模式，访问国内网站走本地，访问国外走代理，可能会有些网站智能判定不准确上不了，这时强制切换到全局代理模式即可。</p>
<p>全局代理模式：访问所有网站都经过国外服务器，这样一来，访问国内正常的网站都要走国外去绕一圈回来，网速就感觉比原来变慢很多了。（推荐平时使用PAC模式即可）</p>
<h3>常见问题。</h3>
<p>1、有的windows用户反映，使用ss软件后，有时候重启电脑开机后不能正常打开网页。这是因为ss软件在正常情况下，开启时会自动修改系统代理设置，退出时会再改回来。如果因为ss软件异常退出，没能将系统代理设置改回来，就可能导致不能正常上网。这时运行一次软件即可。或手动将系统代理设置取消，windows在控制面板-Internet选项-连接-局域网设置，取消勾选。</p><p>2、请将软件解压到文件夹后，再运行，直接通过压缩包运行，会导致软件第二次运行时候没有保存上一次配置的账号。</p>
<!--
<p>3、如果shadowsocks软件在您电脑上不兼容，还可以下载使用SocksCap64软件。<a href="http://dl1.netxyz.me/dl/win/SocksCap64-Portable-4.1.zip" target="_blank">SocksCap64下载1</a><a href="http://dl3.netxyz.me/dl/win/SCap64.7z" target="_blank">SocksCap64下载2</a></p>
<p>SocksCap64简单使用说明：解压后运行SocksCap64_RunAsAdmin，系统提示添加本机安装的浏览器选择【是】，点击【代理】图标打开代理管理器，点击中间ss图标，点击选择【通过二维码添加shadowsocks服务器】，就像截图一样框选下单后收到的账号二维码，成功后会自动将账号添加进代理管理器，点击【保存】，回到软件主页面，【当前代理：】选择刚才添加的服务器，点击后面的【闪电】图标，测试连接有数据返回，则表示与代理服务器数据连接是通畅的，最后打开SocksCap64里面的浏览器访问google，能开就表示成功。</p>
-->
<p>3、手动添加ss账号方法：手动复制粘贴，将线路的服务器、端口、密码和加密方式4个信息填写到软件【服务器——编辑服务器】，注意加密选择：rc4-md5，不要选择默认的：aes-256-cfb。</p>
</div>
</body>
</html>