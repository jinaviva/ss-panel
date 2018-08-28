{include file='user/main.tpl'}

<div class="content-wrapper">
    <section class="content-header">
        <h1>
            【{$node->name}】详细配置信息
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

                        <h3 class="box-title">V线路手动配置信息</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                       <!--  <textarea class="form-control" rows="6">$json_show</textarea> -->
                        <form class="form-horizontal">
                          <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label">地址(address)</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="inputEmail3" readonly value="{$node->server}">
                          </div>
                      </div>
                      <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label">端口(port)</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="inputEmail3" readonly value="{$node->v2ray_port}">
                          </div>
                      </div>
                      <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label">UUID(id)</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="inputEmail3" readonly value="{$user->v2ray_uuid}">
                          </div>
                      </div>
                      <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label">额外ID(alterId)</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="inputEmail3" readonly value="{$user->v2ray_alter_id}">
                          </div>
                      </div>
                      <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label">加密方式(security)</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="inputEmail3" readonly value="auto">
                          </div>
                      </div>
                      <div class="form-group">
                            <label class="col-sm-3 control-label">传输协议(network)</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" readonly value="{$node->v2ray_network}">
                          </div>
                      </div>
                      <div class="form-group">
                            <label class="col-sm-3 control-label">伪装类型(type)</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" readonly value="{$node->v2ray_type}">
                          </div>
                      </div>
                      <div class="form-group">
                            <label class="col-sm-3 control-label">路径(path)</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" readonly value="{$node->v2ray_path}">
                          </div>
                      </div>
                      <div class="form-group">
                            <label class="col-sm-3 control-label">底层传输安全</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" readonly value="{$node->v2ray_tls}">
                          </div>
                      </div>
                  </form>
                  </div>
                    <!-- /.box-body -->
                </div>
                <div class="box box-solid">
                    <div class="box-header">
                        <i class="fa fa-qrcode"></i>

                        <h3 class="box-title">V线路配置二维码</h3>
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

                        <h3 class="box-title">V线路配置URL</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="input-group">
                            <!-- <input type="text" id="ss-qr-text" class="form-control" value="{$v2url}">  -->
                            <textarea class="form-control" rows="6" name="textarea" id="ss-qr-text">{$v2url}</textarea>
                            <div class="input-group-btn">
                                <a class="btn btn-primary btn-flat" href="{$v2url}">></a>
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
                        <h3 class="box-title">配置手册</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                      <div class="list-group">
                        <a href="/sstt/windows.html" target="_blank" class="list-group-item">Windows电脑配置手册</a>
                        <a href="/sstt/osx.html" target="_blank" class="list-group-item">苹果（MAC）电脑配置手册</a>
                        <a href="/sstt/iphone.html" target="_blank" class="list-group-item">苹果手机（平板）配置手册</a>
                        <a href="/sstt/android.html" target="_blank" class="list-group-item">安卓手机配置手册</a>
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
