{include file='user/main.tpl'}

<div class="content-wrapper">
    <section class="content-header">
        <h1>
            我的信息
            <small>User Profile</small>
        </h1>
    </section>
    <!-- Main content --><!-- Main content -->
    <section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-6">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-user"></i>

                        <h3 class="box-title">我的帐号</h3>
                    </div>
                    <div class="box-body">
                        <dl class="dl-horizontal">
                            <dt>用户名</dt>
                            <dd>{$user->user_name}</dd>
                            <dt>邮箱</dt>
                            <dd>{$user->email}</dd>
                            <dt>账户状态</dt>
                            <dd>{$user->enable}</dd>
                            <dt>账户剩余时间</dt>
                            <dd>{$user->getRemainingDays()}天</dd>
                            <dt>到期时间</dt>
                            <dd>{$user->expireTime()}</dd>
                        </dl>

                    </div>
                    <div class="box-footer">
                        <!-- <a class="btn btn-danger btn-sm" href="kill">删除我的账户</a> -->
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a class="btn btn-primary btn" href="pay?t=m" target="_blank">续费1月（30天，15元）</a>
                                <span class="badge pull-right">支付宝</span>
                            </li>
                            <li class="list-group-item">
                                <a class="btn btn-primary btn" href="pay?t=s" target="_blank">续费1季度（90天，45元）</a>
                                <span class="badge pull-right">支付宝</span>
                            </li>
                             <li class="list-group-item">
                                <a class="btn btn-primary btn" href="pay?t=y" target="_blank">续费1年（365天，158元）</a>
                                <span class="badge pull-right">支付宝</span>
                            </li>
                             <li class="list-group-item">
                                <a class="btn btn-primary btn-warning" href="charge">原有充值码续费通道</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->
{include file='user/footer.tpl'}
