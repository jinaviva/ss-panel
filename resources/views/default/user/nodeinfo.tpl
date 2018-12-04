{include file='user/main.tpl'}

<div class="content-wrapper">
    <section class="content-header">
        <h1>
            【{$ary.node_name}】详细配置信息
            <small>Node Detail</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- START PROGRESS BARS -->
        <div class="row">
            <div class="col-md-12">
                <div class="callout callout-info">
                    <h4>注意!</h4>
                    <p>配置文件以及二维码请勿泄露！</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-solid">
                    <div class="box-header">
                        <i class="glyphicon glyphicon-send"></i>

                        <h3 class="box-title">手动配置信息</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                       <!--  <textarea class="form-control" rows="6">{$json_show}</textarea> -->
                        <form class="form-horizontal">
                          <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">服务器</label>
                            <div class="col-sm-5">
                              <input type="text" class="form-control" id="inputEmail3" readonly value="{$ary.server}">
                          </div>
                      </div>
                      <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">端口</label>
                            <div class="col-sm-5">
                              <input type="text" class="form-control" id="inputEmail3" readonly value="{$ary.server_port}">
                          </div>
                      </div>
                      <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-5">
                              <input type="text" class="form-control" id="inputEmail3" readonly value="{$ary.password}">
                          </div>
                      </div>
                      <div class="form-group">
                            <label class="col-sm-2 control-label">加密方式</label>
                            <div class="col-sm-5">
                              <input type="text" class="form-control" readonly value="{$ary.method}">
                          </div>
                      </div>
                  </form>
                  </div>
                    <!-- /.box-body -->
                </div>
                <div class="box box-solid">
                    <div class="box-header">
                        <i class="fa fa-qrcode"></i>

                        <h3 class="box-title">配置二维码</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="text-center">
                            <div id="ss-qr"></div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
                <div class="box box-solid">
                    <div class="box-header">
                        <i class="fa fa-code"></i>

                        <h3 class="box-title">配置ss代码</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="input-group">
                            <input type="text" id="ss-qr-text" class="form-control" value="{$ssqr}">
                            <div class="input-group-btn">
                                <a class="btn btn-primary btn-flat" href="{$ssqr}">></a>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                
                <!-- /.box -->
            </div>
            <!-- /.col (right) -->

            <div class="col-md-6">
                <!-- /.box -->
                <div class="box box-solid">
                    <div class="box-header">
                        <span class="glyphicon glyphicon-book" aria-hidden="true"></span>
                        <h3 class="box-title">SS线路配置手册</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                      <div class="list-group">
                        <a href="/tt/sswin" target="_blank" class="list-group-item">Windows电脑配置手册</a>
                        <a href="/tt/ssmacos" target="_blank" class="list-group-item">苹果（MAC）电脑配置手册</a>
                        <a href="/tt/ssios" target="_blank" class="list-group-item">苹果手机（平板）配置手册</a>
                        <a href="/tt/ssandr" target="_blank" class="list-group-item">安卓手机配置手册</a>
                    </div>
                </div>
                    <!-- /.box-body -->
                </div>
            <!-- /.col (right) -->
        </div>
        <!-- END PROGRESS BARS -->
        <script src=" /assets/public/js/jquery.qrcode.min.js "></script>
        <script>
            var text_qrcode = jQuery('#ss-qr-text').val();
            jQuery('#ss-qr').qrcode({
                "text": text_qrcode
            });
        </script>
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->
{include file='user/footer.tpl'}
