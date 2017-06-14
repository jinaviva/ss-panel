{include file='auth/header.tpl'}
<body class="login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="#"><b>{$config['appName']}</b></a>
    </div><!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录到用户中心</p>

        <form>
            <div class="form-group has-feedback">
                <input id="email" name="Email" type="text" class="form-control" placeholder="邮箱"/>
                <span  class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="passwd" name="Password" type="password" class="form-control" placeholder="密码"/>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
        </form>
        <div class="row">
            <div class="col-xs-8">
                <div class="checkbox icheck">
                    <label>
                        <input id="remember_me" value="week" type="checkbox"> 记住我
                    </label>
                </div>
            </div><!-- /.col -->
            <div class="col-xs-4">
                <button id="login" type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
            </div><!-- /.col -->
        </div>
        <div id="msg-success" class="alert alert-info alert-dismissable" style="display: none;">
            <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
            <h4><i class="icon fa fa-info"></i> 登录成功!</h4>
            <p id="msg-success-p"></p>
        </div>
        <div id="msg-error" class="alert alert-warning alert-dismissable" style="display: none;">
            <button type="button" class="close" id="error-close" aria-hidden="true">&times;</button>
            <h4><i class="icon fa fa-warning"></i> 出错了!</h4>
            <p id="msg-error-p"></p>
        </div>
        <a href="/password/reset">忘记密码</a><br>
        <a href="/auth/register" class="text-center">注册个帐号</a>

    </div><!-- /.login-box-body -->
</div><!-- /.login-box -->

<!-- jQuery 2.1.3 -->
<script src="/assets/public/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/assets/public/js/bootstrap.min.js" type="text/javascript"></script>
<!-- iCheck -->
<script src="/assets/public/js/icheck.min.js" type="text/javascript"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
    // $("#msg-error").hide(100);
    // $("#msg-success").hide(100);
</script>
<script type="text/javascript">
    var t = undefined;
    function loginLoading(){
        $("#msg-error").hide(10);
        $("#msg-success").hide(10);
        $("#login").attr("disabled","disabled");
        $("#login").html("登录中……");
        if (t != undefined){
            clearTimeout(t);
        }
        t = setTimeout("loginFailLoading1()",10000);
    }
    function loginFailLoading(){
        $("#login").removeAttr("disabled");
        $("#login").html("登录");
        if (t != undefined){
            clearTimeout(t);
        }
    }

    function loginFailLoading1(){
        $("#login").removeAttr("disabled");
        $("#login").html("登录");
    }

    function loginSuccessLoading(){
        //$("#login").removeAttr("disabled");
        $("#login").html("正在跳转……");
        if (t != undefined){
            clearTimeout(t);
        }
        t = setTimeout("loginFailLoading1()",10000);
    }
</script>
<script>
    $(document).ready(function(){
        function login(){
            $.ajax({
                type:"POST",
                url:"/auth/login",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                    passwd: $("#passwd").val(),
                    remember_me: $("#remember_me").val()
                },
                beforeSend:function(){
                    loginLoading();
                },
                success:function(data){
                    if(data.ret == 1){
                        //$("#msg-error").hide(10);
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        window.setTimeout("location.href='/user'", 2000);
                        loginSuccessLoading();
                    }else{
                        //$("#msg-success").hide(10);
                        $("#msg-error").show(100);
                        $("#msg-error-p").html(data.msg);
                        loginFailLoading();
                    }
                },
                error:function(jqXHR){
                    //$("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("发生错误："+jqXHR.status);
                    loginFailLoading();
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                login();
            }
        });
        $("#login").click(function(){
            login();
        });
        $("#ok-close").click(function(){
            $("#msg-success").hide(100);
        });
        $("#error-close").click(function(){
            $("#msg-error").hide(100);
        });
    })
</script>
<div style="display:none;">
    {$analyticsCode}
</div>
</body>
</html>