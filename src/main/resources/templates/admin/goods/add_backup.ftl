<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>物品信息表添加--${site.name}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="${site.description}"/>
    <meta name="keywords" content="${site.keywords}"/>
    <meta name="author" content="${site.author}"/>
    <link rel="icon" href="${site.logo}">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all" />
    <style type="text/css">
        .layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
        @media(max-width:1240px){
            .layui-form-item .layui-inline{ width:100%; float:none; }
        }
        .layui-form-item .role-box {
            position: relative;
        }
        .layui-form-item .role-box .jq-role-inline {
            height: 100%;
            overflow: auto;
        }

    </style>
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <div class="layui-form-item">
        <label class="layui-form-label">物品名称</label>
        <div class="layui-input-block">

            <input type="hidden" class="layui-input" name="goodsname" id="goodsname" >
            <div class="layui-upload-drag" id="goodsname">
              <i class="layui-icon"></i>
              <p>点击上传，或将文件拖拽到此处</p>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">规格</label>
        <div class="layui-input-block">

            <input type="hidden" class="layui-input" name="specifications" id="specifications" >
            <div class="layui-upload-drag" id="specifications">
              <i class="layui-icon"></i>
              <p>点击上传，或将文件拖拽到此处</p>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">版本号</label>
        <div class="layui-input-block">

            <input type="hidden" class="layui-input" name="goodsversion" id="goodsversion" >
            <div class="layui-upload-drag" id="goodsversion">
              <i class="layui-icon"></i>
              <p>点击上传，或将文件拖拽到此处</p>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-block">

            <input type="hidden" class="layui-input" name="price" id="price" >
            <div class="layui-upload-drag" id="price">
              <i class="layui-icon"></i>
              <p>点击上传，或将文件拖拽到此处</p>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数量</label>
        <div class="layui-input-block">

            <input type="hidden" class="layui-input" name="count" id="count" >
            <div class="layui-upload-drag" id="count">
              <i class="layui-icon"></i>
              <p>点击上传，或将文件拖拽到此处</p>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addTGoods">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use(['form','jquery','layer'],function(){
        var form      = layui.form,
                $     = layui.jquery,
                layer = layui.layer;


        form.on("submit(addTGoods)",function(data){

            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            $.post("${base}/admin/tGoods/add",data.field,function(res){
                layer.close(loadIndex);
                if(res.success){
                    parent.layer.msg("物品信息表添加成功！",{time:1000},function(){
                        parent.layer.close(parent.addIndex);
                        //刷新父页面
                        parent.location.reload();
                    });
                }else{
                    layer.msg(res.message);
                }
            });
            return false;
        });

    });
</script>
</body>
</html>