package com.lisheng.july.base;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.lisheng.july.entity.*;
import com.lisheng.july.realm.AuthRealm.ShiroUser;
import com.lisheng.july.service.*;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public class BaseController {
	
	public User getCurrentUser() {
		ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		if(shiroUser == null) {
			return null;
		}
		User loginUser = userService.selectById(shiroUser.getId());
		return loginUser;
	}

	@Autowired
	protected UserService userService;

	@Autowired
	protected MenuService menuService;

	@Autowired
	protected RoleService roleService;

	@Autowired
	protected DictService dictService;

	@Autowired
	protected RescourceService rescourceService;

	@Autowired
	protected TableService tableService;

	@Autowired
	protected SiteService siteService;

	@Autowired
	protected LogService logService;

	@Autowired
	protected BlogArticleService blogArticleService;

	@Autowired
	protected BlogChannelService blogChannelService;

	@Autowired
	protected BlogCommentService blogCommentService;

	@Autowired
	protected BlogTagsService blogTagsService;

	@Autowired
	protected QuartzTaskService quartzTaskService;

	@Autowired
	protected QuartzTaskLogService quartzTaskLogService;

	@Autowired
	protected TGoodsService tGoodsService;
}
