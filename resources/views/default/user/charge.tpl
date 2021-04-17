{include file='user/main.tpl'}

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            为账户充值
            <small>Charge my account</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-sm-12">
                <div id="msg-error" class="alert alert-warning alert-dismissable" style="display:none">
                    <button type="button" class="close" aria-hidden="true" id="error-close">&times;</button>
                    <h4><i class="icon fa fa-warning"></i> 出错了!</h4>

                    <p id="msg-error-p"></p>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- left column -->
            <div class="col-md-6">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="box-header">
                            <i class="fa fa-user"></i>

                            <h3 class="box-title">请输入充值卡密</h3>
                        </div>
                        <div id="msg-success" class="alert alert-info alert-dismissable" style="display:none">
                            <button type="button" class="close" aria-hidden="true" id="ok-close">&times;</button>
                            <h4><i class="icon fa fa-info"></i> Ok!</h4>

                            <p id="msg-success-p"></p>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="请输入充值卡密(必填)" id="code">
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button type="submit" id="charge" class="btn btn-primary">充值</button>
                        <!-- <h4>本站唯一官方充值卡购买地址：<a href="{$config['buyCard']}" target="_blank" class="btn btn-warning btn-sm"> 充值码购买</a></h4>-->
                        <p style="color:red;">
                            <a href="https://item.taobao.com/item.htm?ft=t&id=641616035417" target="_blank">淘宝购买注册/充值码地址</a>
                        </p>
                    </div>

                </div>
                <!-- /.box -->
            </div>
            <div class="col-md-6">
                <div class="callout callout-info">
                    <h3>注意！</h3>
                    <!-- <h4>本站唯一官方充值卡购买地址：<a href="{$config['buyCard']}" target="_blank" class="btn btn-warning btn-sm">充值码购买</a></h4> -->
                    <h4>遇到问题请咨询：{$config['serviceQq']}</h4>

                </div>
            </div>
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
    function chargeLoading(){
        $("#msg-error").hide(10);
        $("#msg-success").hide(10);
        $("#charge").attr("disabled","disabled");
        $("#charge").html("正在充值……");
        if (t != undefined){
            clearTimeout(t);
        }
        t = setTimeout("chargeFailLoading1()",10000);
    }
    function chargeFailLoading(){
        $("#charge").removeAttr("disabled");
        $("#charge").html("充值");
        if (t != undefined){
            clearTimeout(t);
        }
    }
    function chargeFailLoading1(){
        $("#charge").removeAttr("disabled");
        $("#charge").html("充值");
    }
</script>

<script>
    $(document).ready(function () {
        $("#charge").click(function () {
            $.ajax({
                type: "POST",
                url: "charge",
                dataType: "json",
                data: {
                    code: $("#code").val(),
                },
                beforeSend: function(){
                    chargeLoading();
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-success").show();
                        $("#msg-success-p").html(data.msg);
                        chargeFailLoading();
                    } else {
                        $("#msg-error").show();
                        $("#msg-error-p").html(data.msg);
                        chargeFailLoading();
                    }
                },
                error: function (jqXHR) {
                    chargeFailLoading();
                    alert("发生错误：" + jqXHR.status);
                }
            })
        });
        $("#error-close").click(function(){
            $("#msg-error").hide(10);
        });
        $("#ok-close").click(function(){
            $("#msg-success").hide(10);
        });
    })
</script>

{include file='user/footer.tpl'}
