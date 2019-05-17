package com.lisheng.july.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lisheng.july.dao.TGoodsDao;
import com.lisheng.july.entity.TGoods;
import com.lisheng.july.service.TGoodsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 物品信息表 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-02-23
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class TGoodsServiceImpl extends ServiceImpl<TGoodsDao, TGoods> implements TGoodsService {
    public void deleteTGoods(TGoods tGoods){
        tGoods.setDelFlag(true);
        tGoods.updateById();
    }
}
