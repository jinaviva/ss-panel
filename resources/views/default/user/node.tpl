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
                 <h3 class="box-title" style="width: 200px"> SS线路列表</h3>  <a type="button" class="btn btn-primary" href="/tt" target="_blank">SS配置教程</a> 
            </div>
            <div class="box-body table-responsive no-padding">
             
             <table class="table table-hover">        
             	<tr>
             	<th>
             	<form class="bs-example bs-example-form" role="form">
				<div class="input-group input-group">
					<span class="input-group-addon" style="color:red">SS线路订阅地址：</span>
					<input type="text" class="form-control" placeholder="订阅地址" value="{$ssr_sub}">
					<!--
					<span class="input-group-btn">
                        <button class="btn btn-primary" type="button">点击复制</button>
                    </span>
                    -->
				</div>
				</form>
             	</th>
             	</tr>
                </table>
                
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
                    {if $node->sort != 0}
                    {continue}
                    {/if}
                    <tr>
                        <td><a href="./node/{$node->id}">{$node->name}</a></td>
                        
                        <td>{$node->info}</td>
                        <td>
                        {if $user->enable != 1}
                        <span style = "color:red;">账户已到期，请续费</span>
                        {else}
                        {$node->server}
                        {/if}
                        </td>
                        <td>{$user->port}</td>
                        <td>{$user->passwd}</td>
                        <td>{$node->method}</td>
                        <td><span class="label label-info">{$node->traffic_rate}</span></td>
                        <td><a href="./node/{$node->id}" type="button" class="btn btn-primary btn-sm">点此查看<span class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span> </a> </td>
                    </tr>
                    {/foreach}
                </table>
            </div>
        </div>
        
        {if $v_nodes_count > 0}
        <div class="box box-info">
            <div class="box-header with-border">
                <span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
                 <h3 class="box-title" style="width: 200px"> V 线路列表（备选方案）</h3> <a type="button" class="btn btn-primary" href="/tt" target="_blank">V配置教程 </a> 
            </div>
            <div class="box-body table-responsive no-padding">
                <table class="table table-hover">
                <tr>
             	<th>
             	<form class="bs-example bs-example-form" role="form">
				<div class="input-group input-group">
					<span class="input-group-addon" style="color:red">V线路订阅地址：</span>
					<input type="text" class="form-control" placeholder="订阅地址" value="{$v_sub}">
					<!--
					<span class="input-group-btn">
                        <button class="btn btn-primary" type="button">点击复制</button>
                    </span>
                    -->
				</div>
				</form>
             	</th>
             	</tr>
               <!--
                <tr>
                <th>
                <form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="name" class="col-sm-2  control-label">V线路订阅地址:</label>
				    <div class="col-sm-8">
				    <input type="text" class="form-control" readonly placeholder="">
				    </div>
				  </div>
				  </form>
				 </th>
				 </tr>
       -->
                </table>
                <table class="table table-hover">
                    <tr>
                        <th>节点位置</th>
                        <th>节点信息</th>
                        <th>状态</th>
                        <th>流量比例</th>
                        <th>节点详情</th>
                    </tr>
                    {foreach $nodes as $node}
                    {if $node->sort != 11}
                    {continue}
                    {/if}
                    <tr>
                        <td><a href="./node/{$node->id}">{$node->name}</a></td>
                        <td>{$node->info}</td>
                        <td>{$node->status}</td>
                        <td><span class="label label-info">{$node->traffic_rate}</span></td>
                        <td><a href="./node/{$node->id}" type="button" class="btn btn-primary btn-sm">点此查看<span class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span> </a> </td>
                    </tr>
                    {/foreach}
                </table>
            </div>
        </div>
        {/if}
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->


{include file='user/footer.tpl'}
