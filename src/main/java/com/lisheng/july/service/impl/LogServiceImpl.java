package com.lisheng.july.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import com.lisheng.july.dao.LogDao;
import com.lisheng.july.entity.Log;
import com.lisheng.july.service.LogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 系统日志 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2018-01-14
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class LogServiceImpl extends ServiceImpl<LogDao, Log> implements LogService {

    @Override
    public List<Integer> selectSelfMonthData() {
        List<Map> list =  baseMapper.selectSelfMonthData();
        List<Integer> pv = Lists.newArrayList();
        for(Map map : list){
            pv.add(Integer.valueOf(map.get("total").toString()));
        }
        return pv;
    }
}
