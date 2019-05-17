package com.lisheng.july.service.impl;

import com.lisheng.july.entity.QuartzTaskLog;
import com.lisheng.july.dao.QuartzTaskLogDao;
import com.lisheng.july.service.QuartzTaskLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 任务执行日志 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2018-01-25
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class QuartzTaskLogServiceImpl extends ServiceImpl<QuartzTaskLogDao, QuartzTaskLog> implements QuartzTaskLogService {

}
