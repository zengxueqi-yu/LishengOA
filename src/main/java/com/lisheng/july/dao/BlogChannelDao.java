package com.lisheng.july.dao;

import com.lisheng.july.entity.BlogChannel;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lisheng.july.entity.VO.ZtreeVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 博客栏目 Mapper 接口
 * </p>
 *
 * @author wangl
 * @since 2018-01-17
 */
public interface BlogChannelDao extends BaseMapper<BlogChannel> {

    List<ZtreeVO> selectZtreeData(Map<String,Object> map);

    List<BlogChannel> selectChannelData(Map<String, Object> map);
}
