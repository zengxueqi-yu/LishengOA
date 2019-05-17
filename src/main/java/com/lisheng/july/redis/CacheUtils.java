package com.lisheng.july.redis;

import com.lisheng.july.base.MySysUser;
import com.lisheng.july.entity.User;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Caching;

/**
 * Created by July on 2018/1/20.
 * todo:
 */
public class CacheUtils {
    /**
     * 清除当前用户redis缓存
     * @return
     */
    @Caching(evict = {
            @CacheEvict(value = "user", key = "'user_id_'+T(String).valueOf(#result.id)",condition = "#result.id != null and #result.id != 0"),
            @CacheEvict(value = "user", key = "'user_name_'+#result.loginName", condition = "#result.loginName !=null and #result.loginName != ''"),
            @CacheEvict(value = "user", key = "'user_email_'+#result.email", condition = "#result.email != null and #result.email != ''"),
            @CacheEvict(value = "user", key = "'user_tel_'+#result.tel", condition = "#result.tel != null and #result.tel != ''" ),
    })
    public User clearUserCache(){
        User user = new User();
        user.setId(MySysUser.id());
        return user.selectById();
    }

    //@Cacheeable(key = "#p0")将查询结果缓存到redis中，（key = "#p0"）指定传入的第一个参数作为redis的key
    //@CachePut(key = "#p0")指定key，将更新的结果同步到redis中
    //@CacheEvict(key = "#p0",allEntries = true)指定key，删除缓存数据，allEntries = true，方法调用后将立即清除缓存
}
