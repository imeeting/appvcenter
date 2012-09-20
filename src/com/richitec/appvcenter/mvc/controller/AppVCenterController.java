package com.richitec.appvcenter.mvc.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.richitec.appvcenter.constants.WebConstants;
import com.richitec.appvcenter.framework.Configuration;
import com.richitec.appvcenter.framework.ContextLoader;
import com.richitec.appvcenter.user.UserBean;

@Controller
public class AppVCenterController {
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView view = new ModelAndView();
		view.setViewName("index");
		return view;
	}
	
	@RequestMapping("/index")
	public ModelAndView index_() {
		ModelAndView view = new ModelAndView();
		view.setViewName("index");
		return view;
	}
	
	@RequestMapping("/login")
	public ModelAndView login(HttpSession session, @RequestParam String loginName, @RequestParam String loginPwd) {
		Configuration config = ContextLoader.getConfiguration();
		if (loginName.equals(config.getSystemUser()) && loginPwd.equals(config.getSystemPwd())) {
			UserBean user = new UserBean();
			user.setUserName(loginName);
			user.setPassword(loginPwd);
			session.setAttribute(UserBean.SESSION_BEAN, user);
			
			ModelAndView view = new ModelAndView();
			view.setViewName("redirect:/appmanage");
			return view;
		} else {
			ModelAndView view = new ModelAndView();
			view.setViewName("index");
			view.addObject("LoginRetCode", HttpServletResponse.SC_FORBIDDEN);
			return view;
		}
	}
	
	@RequestMapping("/appmanage")
	public ModelAndView appManage() {
		ModelAndView view = new ModelAndView("appmanage");
		view.addObject(WebConstants.page_name.name(), "appmanage");
		return view;
	}
}
