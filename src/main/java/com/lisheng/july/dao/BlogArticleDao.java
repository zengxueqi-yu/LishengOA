package com.lisheng.july.dao;

import com.baomidou.mybatisplus.plugins.Page;
import com.lisheng.july.entity.BlogArticle;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 博客内容 Mapper 接口
 * </p>
 *
 * @author wangl
 * @since 2018-01-17
 */
public interface BlogArticleDao extends BaseMapper<BlogArticle> {

    List<BlogArticle> selectIndexArticle(Map<String,Object> map);

    List<BlogArticle> selectDetailArticle(Map<String, Object> map, Page<BlogArticle> page);

    List<BlogArticle> selectDetailArticle(Map<String, Object> map);

    List<BlogArticle> selectNewCommentArticle(Integer limit);

    /**
     * 查找当前文章的标签相似的文章
     * @param map
     * @return
     */
    List<BlogArticle> selectLikeSameWithTags(Map<String,Object> map);

    void saveArticleTags(Map<String, Object> map);

    void removeArticleTags(Long articleId);
}
