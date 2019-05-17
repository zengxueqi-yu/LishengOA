package com.lisheng.july.annotation;

import java.lang.annotation.*;

/**
 * Created by JUly on 2018/1/13.
 * todo:
 * 类SysLog的功能描述:
 * 系统日志注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLog {
    String value() default "";
}
