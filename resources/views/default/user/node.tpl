{include file='user/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            节点列表
            <small>Node List</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- START PROGRESS BARS -->
        <div class="row">
            <div class="col-md-12">
                <div class="callout callout-info">
                    <h4>注意!</h4>
                    <h5>请勿在任何地方公开节点地址！</h5>
                    <h5>流量比例为0.5即使用100MB按照50MB流量记录记录结算。</h5>
                    {$msg}
                </div>
            </div>
        </div>
        <div class="box box-info">
            <div class="box-header with-border">
                <span class="glyphicon glyphicon-send" aria-hidden="true"></span>
                 <h3 class="box-title">线路列表</h3>
            </div>
            <div class="box-body table-responsive no-padding">
                <table class="table table-hover">
                    <tr>
                        <th>节点位置</th>
                        <th>节点信息</th>
                        <th>服务器地址</th>
                        <th>端口</th>
                        <th>密码<a href="/user/edit">（修改）</a></th>
                        <th>加密方式</th>
                        <th>流量比例</th>
                        <th>账号和二维码</th>
                    </tr>
                    {foreach $nodes as $node}
                    <tr>
                        <td><a href="./node/{$node->id}">{$node->name}</a></td>
                        <td>{$node->info}</td>
                        <td>
                        {if $user->enable eq 0}
                        <span style = "color:red;">账户已到期，续费后开通</span>
                        {else}
                        {$node->server}
                        {/if}
                        </td>
                        <td>{$user->port}</td>
                        <td>{$user->passwd}</td>
                        <td>{$node->method}</td>
                        <td><span class="label label-info">{$node->traffic_rate}</span></td>
                        <td><a href="./node/{$node->id}" type="button" class="btn btn-primary btn-sm">查看<span class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span> </a> </td>
                    </tr>
                    {/foreach}
                </table>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->


{include file='user/footer.tpl'}
