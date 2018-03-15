<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>购买套餐</title>
	<meta charset="utf-8">
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="/assets/public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- Font Awesome Icons -->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Ionicons -->
    <link href="//cdn.bootcss.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet">
    <!-- Theme style -->
    <link href="/assets/public/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="/assets/public/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>

    <!-- jQuery 2.1.3 -->
    <script src="/assets/public/js/jquery.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="row">
  <div class="col-md-2" style="margin: 10px">
  	<ul class="list-group">
		<li class="list-group-item">充值账户：{$pay_info.email}</li>
		<li class="list-group-item">充值金额：{$pay_info.price}元 <span class="badge pull-right">支付宝</span></li>
		<!-- <li class="list-group-item">支付方式：支付宝！</li> -->
		<li class="list-group-item"><a class="btn btn-primary btn-lg" href="{$pay_url}">确认支付</a></li>
	</ul>
  </div>
</div>
<script src="/assets/public/js/bootstrap.min.js" type="text/javascript"></script>
<!-- SlimScroll -->
<script src="/assets/public/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='/assets/public/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/assets/public/js/app.min.js" type="text/javascript"></script>
</body>
</html>