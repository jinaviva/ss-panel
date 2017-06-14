{include file='user/main.tpl'}

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            修改资料
            <small>Profile Edit</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div id="msg-error" class="alert alert-warning alert-dismissable" style="display:none">
                    <button type="button" class="close" aria-hidden="true" id="error-close">&times;</button>
                    <h4><i class="icon fa fa-warning"></i> 出错了!</h4>

                    <p id="msg-error-p"></p>
                </div>
                <div id="ss-msg-success" class="alert alert-success alert-dismissable" style="display:none">
                    <button type="button" class="close" aria-hidden="true" id="ss-ok-close">&times;</button>
                    <h4><i class="icon fa fa-info"></i> 修改成功!</h4>

                    <p id="ss-msg-success-p"></p>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- left column -->
            <div class="col-md-6">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-key"></i>

                        <h3 class="box-title">网站登录密码修改</h3>
                    </div>
                    <!-- /.box-header --><!-- form start -->

                    <div class="box-body">
                        <div class="form-horizontal">

                            <div id="msg-success" class="alert alert-info alert-dismissable" style="display:none">
                                <button type="button" class="close" data-dismiss="alert"
                                        aria-hidden="true">&times;</button>
                                <h4><i class="icon fa fa-info"></i> Ok!</h4>

                                <p id="msg-success-p"></p>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">当前密码</label>

                                <div class="col-sm-9">
                                    <input type="password" class="form-control" placeholder="当前密码(必填)" id="oldpwd">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">新密码</label>

                                <div class="col-sm-9">
                                    <input type="password" class="form-control" placeholder="新密码" id="pwd">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">确认密码</label>

                                <div class="col-sm-9">
                                    <input type="password" placeholder="确认密码" class="form-control" id="repwd">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" id="pwd-update" class="btn btn-primary">修改</button>
                    </div>

                </div>
                <!-- /.box -->
            </div>

            <div class="col-md-6">

                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-link"></i>

                        <h3 class="box-title">Shadowsocks连接信息修改</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">连接密码</label>

                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input type="text" id="sspwd" placeholder="输入新连接密码（留空将生成随机密码）" class="form-control">
                                        <div class="input-group-btn">
                                            <button type="submit" id="ss-pwd-update" class="btn btn-primary">修改</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer"></div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col (right) -->

        </div>
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->

<script>
    $("#msg-success").hide();
    $("#msg-error").hide();
    $("#ss-msg-success").hide();
</script>

<script type="text/javascript">
    var t = undefined;
    function sspwdUpdateLoading(){
        $("#ss-msg-error").hide(10);
        $("#ss-msg-success").hide(10);
        $("#ss-pwd-update").attr("disabled","disabled");
        $("#ss-pwd-update").html("提交中……");
        if (t != undefined){
            clearTimeout(t);
        }
        t = setTimeout("sspwdUpdateFailLoading1()",10000);
    }
    function sspwdUpdateFailLoading(){
        $("#ss-pwd-update").removeAttr("disabled");
        $("#ss-pwd-update").html("修改");
        if (t != undefined){
            clearTimeout(t);
        }
    }
    function sspwdUpdateFailLoading1(){
        $("#ss-pwd-update").removeAttr("disabled");
        $("#ss-pwd-update").html("修改");
    }
</script>

<script>
    $(document).ready(function () {
        $("#pwd-update").click(function () {
        	$("#msg-success").hide();
        	$("#msg-error").hide();
            $.ajax({
                type: "POST",
                url: "password",
                dataType: "json",
                data: {
                    oldpwd: $("#oldpwd").val(),
                    pwd: $("#pwd").val(),
                    repwd: $("#repwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-success").show();
                        $("#msg-success-p").html(data.msg);
                    } else {
                        $("#msg-error").show();
                        $("#msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#ss-pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "sspwd",
                dataType: "json",
                data: {
                    sspwd: $("#sspwd").val()
                },
                beforeSend: function(){
                    sspwdUpdateLoading();
                },
                success: function (data) {
                    if (data.ret) {
                        $("#ss-msg-success").show();
                        $("#ss-msg-success-p").html(data.msg);
                        sspwdUpdateFailLoading();
                    } else {
                        $("#ss-msg-success").show();
                        $("#ss-msg-success-p").html(data.msg);
                        sspwdUpdateFailLoading();
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                    sspwdUpdateFailLoading();
                }
            })
        });
        $("#ss-ok-close").click(function(){
            $("#ss-msg-success").hide(10);
        });
        $("#error-close").click(function(){
            $("#msg-error").hide(10);
        });
    })
</script>


{include file='user/footer.tpl'}