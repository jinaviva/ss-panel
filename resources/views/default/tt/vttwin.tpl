<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <title>Windows下 V客户端使用教程</title>
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
    .red{
      color: red;
    }
  </style>
</head>
<body>
<div id="main">
  <h1>Windows下V客户端使用教程<a href="/tt">返回主页</a></h1>
  <h3>1、下载V客户端软件。（64位操作系统请下载64位版本，32位操作系统请下载32位版本。） </h3>
  <p>V客户端软件（64位）：<a href="http://dl1.netxyz.me/dl/v/win/v-2.14-win64.zip">点此下载64位版本</a> <a href="http://dl3.netxyz.me/dl/v/win/v-2.14-win64.zip">备用</a></p>
  <p>V客户端软件（32位）：<a href="http://dl1.netxyz.me/dl/v/win/v-2.14-win32.zip">点此下载32位版本</a> <a href="http://dl3.netxyz.me/dl/v/win/v-2.14-win32.zip">备用</a></p>
  <p class="red">软件运行需系统.net4.5版本以上。如遇软件无法运行？请下载以下升级包安装。安装完后须重启电脑！</p>
  <p>.net4.62升级包下载:<a href="http://dl1.netxyz.me/dl/win/NDP462-KB3151802-Web.zip" target="_blank">下载1</a><a href="http://dl3.netxyz.me/dl/win/dotNetFx40_Full_x86_x64.zip" target="_blank">下载2</a></p>
  <h3 class="red">特别注意：请确保运行V客户端软件的电脑系统时间与北京时间误差不超过2分钟，否则无法正常使用！可百度关键字“北京时间”校对时间。</h3>
  <h3>2、运行V客户端软件。</h3>  
  <p>解压下载好的V客户端软件压缩包，双击<img src="/assets/public/img/tt/v/win/1.png"> 运行V客户端软件。</p>
  <h3>3、添加节点订阅地址。</h3>
  <p>1）登录后台，点击【节点列表】，复制【V线路订阅地址】。</p>
  <img src="/assets/public/img/tt/v/win/2.png">
  <p>2）将订阅地址添加到V客户端软件。</p>
  <img src="/assets/public/img/tt/v/win/3.png">
  <h3>4、更新订阅节点并连接。</h3>
  <img src="/assets/public/img/tt/v/win/4.png">
  <h3>5、下载安装火狐浏览器。<a href="http://www.firefox.com.cn" target="_blank">火狐浏览器官网链接。</a> </h3>
  <h3>6、配置火狐浏览器本地代理。 </h3>
  <p>1）打开火狐浏览器，选择【打开菜单】-【选项】（或者直接在火狐浏览器地址栏输入 about:preferences ），在【选项】标签页下拉找到【网络代理】，点击旁边【设置】按钮。</p>
  <img src="/assets/public/img/tt/v/win/5.png">
  <p>2）如下图。点击【手动代理配置】，在【SOCKS主机】下填写【127.0.0.1】，端口填写【1081】，选择【SOCKS v5】，勾选【使用SOCKS v5时代理DNS查询】，最后点击【确定】保存设置。</p>
  <img src="/assets/public/img/tt/v/win/6.png">
  <h3>7、使用火狐浏览器，访问www.google.com，能正确打开就完成。建议每次运行软件后【更新订阅】节点，确保正常使用</h3>
  <p>如果不能访问，请重复上述第4和第6步骤，第6步骤中的端口需与V客户端软件【参数设置】-【本地监听端口（默认1081）】一致，必须勾选【使用SOCKS v5时代理DNS查询】。</p>
  <h3>8、无法正常使用？请按以下步骤排查：</h3>
  <p class="red">1、请确保电脑（手机）系统时间与北京时间误差在2分钟以内。</p>
  <p class="red">2、请【更新订阅】，更换其他节点（设置为活动服务器），再次尝试。</p>
  <p class="red">3、XP系统部分传输协议的节点无法使用。请确保电脑系统上的杀毒/管家等软件，没有阻挡客户端软件的正常运行。（卸载相关软件，或在其他电脑上测试）</p>
  <p class="red">4、请登录网站后台，确保账户状态为【正常】，流量使用未超出。</p>
  <p class="red">5、重启电脑。</p>
  <p class="red">6、请联系技术客服。</p>
  <p class="red">7、【启用Http代理设置】后，电脑重新开机后无法上网？这是因为关机时软件异常退出，没能将系统代理设置改回来，就可能导致不能正常上网。这时运行一次软件即可。或手动将系统代理设置取消：打开控制面板-Internet选项-连接-局域网设置，取消勾选。</p>
</div>
</body>
</html>