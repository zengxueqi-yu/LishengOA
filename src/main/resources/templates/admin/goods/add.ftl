<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>物品添加--${site.name}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!-- 页面描述 -->
    <meta name="description" content="${site.description}"/>
    <!-- 页面关键词 -->
    <meta name="keywords" content="${site.keywords}"/>
    <!-- 网页作者 -->
    <meta name="author" content="${site.author}"/>
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
            <input type="text" class="layui-input" name="goodsname" lay-verify="required" placeholder="请输入物品名称">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="specifications" placeholder="请输入规格">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">版本号</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="goodsversion" placeholder="请输入版本号">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">价格</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="price" lay-verify="price" placeholder="请输入价格">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="count" lay-verify="count" placeholder="请输入数量">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addGoods">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use(['form','jquery','layer'],function(){
        var form = layui.form,
                $    = layui.jquery,
                layer = layui.layer,
                delFlage = false;    //默认启用用户
        form.on("submit(addGoods)",function(data){
            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            $.ajax({
                type:"POST",
                url:"${base}/admin/tGoods/add",
                dataType:"json",
                contentType:"application/json",
                data:JSON.stringify(data.field),
                success:function(res){
                    layer.close(loadIndex);
                    if(res.success){
                        parent.layer.msg("物品添加成功!",{time:1500},function(){
                            //刷新父页面
                            parent.location.reload();
                        });
                    }else{
                        layer.msg(res.message);
                    }
                }
            });
            return false;
        });

    });
</script>
</body>
</html>