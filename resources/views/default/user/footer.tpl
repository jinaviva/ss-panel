<footer class="main-footer">
    <div align="center">
        {$userFooter}
    </div>
    <div class="pull-right hidden-xs">
       	<span style="margin-right:10px;color:red;">直接访问地址：<a href="{$config['bakUrl']}"  target="_blank">{$config['bakUrl']}</a> </span><span style="margin-right:10px">|</span><span style="color:red;">永久域名（需代理）：<a href="{$config['baseUrl']}" target="_blank">{$config['baseUrl']}</a></span>    	 
    </div>
    <strong>Copyright &copy; {date("Y")} <a href="#">{$config['appName']}</a> </strong>
    All rights reserved. | <a href="/tos" target="_blank">服务条款 </a>
</footer>
</div><!-- ./wrapper -->


<!-- Bootstrap 3.3.2 JS -->
<script src="/assets/public/js/bootstrap.min.js" type="text/javascript"></script>
<!-- SlimScroll -->
<script src="/assets/public/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='/assets/public/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/assets/public/js/app.min.js" type="text/javascript"></script>
<div style="display:none;">
    {$analyticsCode}
</div>
</body>
</html>
