package com.lisheng.july.service;

import com.baomidou.mybatisplus.service.IService;
import com.lisheng.july.entity.TGoods;

/**
 * <p>
 * 物品信息表 服务类
 * </p>
 *
 * @author wangl
 * @since 2019-02-23
 */
public interface TGoodsService extends IService<TGoods> {
    void deleteTGoods(TGoods tGoods);
}
