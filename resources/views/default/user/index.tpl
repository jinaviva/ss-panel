{include file='user/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            用户中心
            <small>User Center</small>
        </h1>
    </section>
    
    <!-- Main content -->
    <section class="content">
        <!-- START PROGRESS BARS -->
        <div class="row">
            
            <div class="col-md-6" >
             <div class="box box-primary" style="height:260px">
                    <div class="box-header">
                        <i class="fa  fa-paper-plane"></i>

                        <h3 class="box-title">账户信息</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <dl class="dl-horizontal">
                            <dt>账户状态</dt>
                            <dd>
                            {if $user->enable != 1 }
                            <span style="color:red;">已停用</span>
                            {else}正常{/if}
                            </dd>
                            <dt>账户剩余时间</dt>
                            <dd>
                            {if $user->getRemainingDays() > 0 }
                            {$user->getRemainingDays()}天<a href="/user/profile" style="margin-left: 15px;" type="button" class="btn btn-primary btn-xs" >==>点此充值</a>
                            {else}
                             <span style="color:red;">{$user->getRemainingDays()}天</span><a href="/user/profile" style="margin-left: 15px;" type="button" class="btn btn-primary btn-xs" >==>点此充值</a>
                            {/if}
                            </dd>
                            <dt>线路列表</dt>
                            <dd><a href="/user/node" type="button" class="btn btn-primary btn-xs">==>点此查看节点列表</a></dd>
                            <dt>使用方法</dt>
                            <dd>请查看【节点列表】阅读【配置手册】</dd>
                            <dt>上次使用</dt>
                            <dd>{$user->lastSsTime()}</dd>
                        </dl>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <div class="col-md-6">
                <div class="box box-primary" style="height:260px">
                    <div class="box-header">
                        <i class="fa fa-bullhorn"></i>

                        <h3 class="box-title" style="margin-right: 10px;">公告&FAQ</h3>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">查看重要提醒</button>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        {$msg}
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>


            <!-- /.col (right) -->
            </div>
            <div class="row">
            <div class="col-md-6">
                <div class="box box-primary" style="height:260px">
                    <div class="box-header">
                        <i class="fa fa-exchange"></i>

                        <h3 class="box-title">流量使用情况</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="40"
                                         aria-valuemin="0" aria-valuemax="100"
                                         style="width: {$user->trafficUsagePercent()}%">
                                        <span class="sr-only">Transfer</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <dl class="dl-horizontal">
                            <dt>总流量</dt>
                            <dd>{$user->enableTraffic()}</dd>
                            <dt>已用流量</dt>
                            <dd>{$user->usedTraffic()}</dd>
                            <dt>剩余流量</dt>
                            <dd>{$user->unusedTraffic()}</dd>
                            <dt>流量规则</dt>
                            <dd>为防止滥用行为，每账户每月流量上限100G，次月1日流量清零重置。</dd>
                        </dl>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col (left) -->
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-pencil"></i>

                        <h3 class="box-title">签到获取流量</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <p> 每{$config['checkinTime']}小时可以签到一次。</p>

                        <p>上次签到时间：<code>{$user->lastCheckInTime()}</code></p>
                        {if $user->isAbleToCheckin() }
                            <p id="checkin-btn">
                                <button id="checkin" class="btn btn-success  btn-flat">签到</button>
                            </p>
                        {else}
                            <p><a class="btn btn-success btn-flat disabled" href="#">不能签到</a></p>
                        {/if}
                        <p id="checkin-msg"></p>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            
            <!-- /.col (right) -->
            </div>
            
            <div class="row">
            <!--
            <div class="col-md-6">
                <div class="box box-solid" style="height:260px">
                    <div class="box-header">
                        <span class="glyphicon glyphicon-book" aria-hidden="true"></span>
                        <h3 class="box-title">配置手册</h3>
                    </div>
                    <div class="box-body">
                      <div class="list-group">
                        <a href="/sstt/windows.html" target="_blank" class="list-group-item">Windows电脑配置手册</a>
                        <a href="/sstt/osx.html" target="_blank" class="list-group-item">苹果（MAC）电脑配置手册</a>
                        <a href="/sstt/iphone.html" target="_blank" class="list-group-item">苹果手机（平板）配置手册</a>
                        <a href="/sstt/android.html" target="_blank" class="list-group-item">安卓手机配置手册</a>
                    </div>
                </div>
                </div>
            </div>
            --> 
            <!-- /.col (right) -->

            
        </div>
        <!-- /.row --><!-- END PROGRESS BARS -->
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="myModal">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">重要提醒！以下内容请复制下来保存：</h4>
      </div>
      <div class="modal-body">
      {$imp_msg}
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">我知道了</button>
      </div>
    </div>
  </div>
</div>
<script>
    $(document).ready(function () {
        $("#checkin").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
        if($.cookie("isClose") != 'yes'){
            $('#myModal').modal('show');
            $.cookie("isClose",'yes',{ expires:1});
        }
    })
</script>


{include file='user/footer.tpl'}
