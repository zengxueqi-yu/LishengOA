<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>物品信息表--${site.name}</title>
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
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all" />
</head>
<body class="childrenBody">
<fieldset class="layui-elem-field">
  <legend>物品信息表检索</legend>
  <div class="layui-field-box">
    <form class="layui-form" id="searchForm">
        <div class="layui-inline" style="width: 15%">
            <input type="text" value="" name="s_key" placeholder="可以输入物品名称/规格/型号" class="layui-input search_input">
        </div>
        <div class="layui-inline">
            <a class="layui-btn" lay-submit="" lay-filter="searchForm">查询</a>
        </div>
        <div class="layui-inline" >
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-normal" data-type="addTGoods">添加物品信息表</a>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-danger" data-type="deleteSome">批量删除</a>
        </div>
    </form>
  </div>
</fieldset>
<div class="layui-form users_list">
    <table class="layui-table" id="test" lay-filter="demo"></table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
</div>
<div id="page"></div>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/tools.js"></script>
<script>
    layui.use(['layer','form','table','laydate'], function() {
        var layer = layui.layer,
                $ = layui.jquery,
                form = layui.form,
                laydate = layui.laydate,
                table = layui.table;


        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'edit'){
                var editIndex = layer.open({
                    title : "编辑物品信息表",
                    type : 2,
                    content : "${base}/admin/tGoods/edit?id="+data.id,
                    success : function(layero, index){
                        setTimeout(function(){
                            layer.tips('点击此处返回物品信息表列表', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500);
                    }
                });
                //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
                $(window).resize(function(){
                    layer.full(editIndex);
                });
                layer.full(editIndex);
            }
            if(obj.event === "del"){
                layer.confirm("你确定要删除该物品信息表么？",{btn:['是的,我确定','我再想想']},
                        function(){
                            $.post("${base}/admin/tGoods/delete",{"id":data.id},function (res){
                                if(res.success){
                                    layer.msg("删除成功",{time: 1000},function(){
                                        location.reload();
                                    });
                                }else{
                                    layer.msg(res.message);
                                }

                            });
                        }
                )
            }
        });

        var t = {
            elem: '#test',
            url:'${base}/admin/tGoods/list',
            method:'post',
            page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                groups: 2, //只显示 1 个连续页码
                first: "首页", //显示首页
                last: "尾页", //显示尾页
                limits:[3,10, 20, 30]
            },
            //cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            width: $(parent.window).width()-223,
            cols: [[
                {type:'checkbox'},
                {field:'goodsname',title:'物品名称',width:'15%'},
                {field:'specifications',title:'规格',width:'15%'},
                {field:'goodsversion',title:'版本号',width:'15%'},
                {field:'price',title:'价格',width:'10%'},
                {field:'count',title:'数量',width:'10%'},
                {field:'createDate',  title: '创建时间',width:'15%',templet:'<div>{{ layui.laytpl.toDateString(d.createDate) }}</div>',unresize: true}, //单元格内容水平居中
                {fixed: 'right', title:'操作',  align: 'center',toolbar: '#barDemo'}
            ]]
        };
        table.render(t);

        var active={
            addTGoods : function(){
                var addIndex = layer.open({
                    title : "添加物品信息表",
                    type : 2,
                    content : "${base}/admin/tGoods/add",
                    success : function(layero, addIndex){
                        setTimeout(function(){
                            layer.tips('点击此处返回物品信息表列表', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500);
                    }
                });
                //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
                $(window).resize(function(){
                    layer.full(addIndex);
                });
                layer.full(addIndex);
            },
            deleteSome : function(){//批量删除
                var checkStatus = table.checkStatus('test'),
                        data = checkStatus.data;
                if(data.length > 0){
                    console.log(JSON.stringify(data));
                    layer.confirm("你确定要删除这些用户么？",{btn:['是的,我确定','我再想想']},
                            function(){
                                var deleteindex = layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
                                $.ajax({
                                    type:"POST",
                                    url:"${base}/admin/tGoods/deleteSome",
                                    dataType:"json",
                                    contentType:"application/json",
                                    data:JSON.stringify(data),
                                    success:function(res){
                                        layer.close(deleteindex);
                                        if(res.success){
                                            layer.msg("删除成功",{time: 1000},function(){
                                                table.reload('test', t);
                                            });
                                        }else{
                                            layer.msg(res.message);
                                        }
                                    }
                                });
                            }
                    )
                }else{
                    layer.msg("请选择需要删除的用户",{time:1000});
                }
            }
        };

        $('.layui-inline .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        form.on("submit(searchForm)",function(data){
            t.where = data.field;
            table.reload('test', t);
            return false;
        });

    });
</script>
</body>
</html>