<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>物品修改--${site.name}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
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
    <input class="layui-hide" name="id" value="${tGoods.id}"/>
    <div class="layui-form-item">
        <label class="layui-form-label">物品名称</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" name="goodsname" lay-verify="required" placeholder="请输入物品名称" value="${tGoods.goodsname}">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="specifications" placeholder="请输入规格" value="${tGoods.specifications}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">版本号</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="goodsversion" placeholder="请输入版本号" value="${tGoods.goodsversion}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">价格</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="price" placeholder="请输入价格" value="${tGoods.price}">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="count" placeholder="请输入数量" value="${tGoods.count}">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="editTGoods">我要修改</button>
            <button class="layui-btn"   class="layui-btn layui-btn-primary">我不改了</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    var index = parent.layer.getFrameIndex(window.name); //当前窗口索引
    layui.use(['form','jquery','layer'],function(){
        var form = layui.form,
                $    = layui.jquery,
                layer = layui.layer,
                delFlage = ${tGoods.delFlag?string};

        form.on("submit(editTGoods)",function(data){
            if(data.field.id == null){
                layer.msg("物品ID不存在");
                return false;
            }
            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            $.ajax({
                type:"POST",
                url:"${base}/admin/tGoods/edit",
                dataType:"json",
                contentType:"application/json",
                data:JSON.stringify(data.field),
                success:function(res){
                    layer.close(loadIndex);
                    if(res.success){
                        parent.layer.msg("物品编辑成功！",{time:1500},function(){
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