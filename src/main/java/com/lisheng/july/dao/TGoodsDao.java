package com.lisheng.july.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lisheng.july.entity.TGoods;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 物品信息表 Mapper 接口
 * </p>
 *
 * @author wangl
 * @since 2019-02-23
 */
public interface TGoodsDao extends BaseMapper<TGoods> {
    List getGoodsList(Map map);
}
