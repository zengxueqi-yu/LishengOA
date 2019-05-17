package com.lisheng.july.controller;

import com.lisheng.july.entity.TGoods;
import com.lisheng.july.entity.User;
import com.lisheng.july.service.TGoodsService;
import com.xiaoleilu.hutool.date.DateUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.lisheng.july.util.LayerData;
import com.lisheng.july.util.RestResponse;
import com.lisheng.july.annotation.SysLog;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 物品信息表  前端控制器
 * </p>
 *
 * @author July
 * @since 2019-02-23
 */
@Controller
@RequestMapping("/admin/tGoods")
public class TGoodsController {
    private static final Logger LOGGER = LoggerFactory.getLogger(TGoodsController.class);

    @Autowired
    private TGoodsService tGoodsService;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @GetMapping("list")
    @SysLog("跳转物品信息表列表")
    public String list(){
        return "/admin/goods/list";
    }

    @RequiresPermissions("sys:tGoods:list")
    @PostMapping("list")
    @ResponseBody
    @SysLog("请求物品信息表列表数据")
    public LayerData<TGoods> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                  @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                  ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<TGoods> layerData = new LayerData<>();
        EntityWrapper<TGoods> goodsEntityWrapper = new EntityWrapper<>();
        goodsEntityWrapper.eq("del_flag",false);
        if(!map.isEmpty()){
            String keys = (String) map.get("key");
            if(StringUtils.isNotBlank(keys)) {
                goodsEntityWrapper.like("goodsname", keys).or().like("specifications", keys).or().like("goodsversion", keys);
            }
        }
        Page<TGoods> pageData = tGoodsService.selectPage(new Page<>(page,limit),goodsEntityWrapper);
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增物品信息表页面")
    public String add(){
        return "/admin/goods/add";
    }

    @PostMapping("add")
    @SysLog("保存新增物品信息表数据")
    @ResponseBody
    public RestResponse add(@RequestBody TGoods tGoods){
        System.out.println("物品名称====>"+tGoods.getGoodsname());
        tGoodsService.insert(tGoods);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑物品信息表页面")
    public String edit(Long id,Model model){
        TGoods tGoods = tGoodsService.selectById(id);
        model.addAttribute("tGoods",tGoods);
        return "/admin/goods/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑物品信息表数据")
    public RestResponse edit(@RequestBody TGoods tGoods){
        if(null == tGoods.getId() || 0 == tGoods.getId()){
            return RestResponse.failure("ID不能为空");
        }

        //redisTemplate.opsForValue().set("zengxueqi","zengxueqi-yu1314",12000);
        tGoodsService.updateById(tGoods);
        return RestResponse.success();
    }

    @RequiresPermissions("sys:tGoods:delete")
    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除物品信息表数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        TGoods tGoods = tGoodsService.selectById(id);
        tGoods.setDelFlag(true);
        tGoodsService.updateById(tGoods);
        return RestResponse.success();
    }

    @RequiresPermissions("sys:tGoods:delete")
    @PostMapping("deleteSome")
    @ResponseBody
    @SysLog("删除系统用户数据(多个)")
    public RestResponse deleteSome(@RequestBody List<TGoods> tGoodsList){
        if(tGoodsList == null || tGoodsList.size()==0){
            return RestResponse.failure("请选择需要删除的用户");
        }
        for (TGoods tGoods : tGoodsList){
            if(tGoods.getId() == 1){
                return RestResponse.failure("不能删除超级管理员");
            }else{
                tGoodsService.deleteTGoods(tGoods);
            }
        }
        return RestResponse.success();
    }

    //使用freemarker在controller里面model.addAttribute("tGoods",tGoods);对象数据后，前端页面可以直接使用${tGoods.属性}得到属性值
}