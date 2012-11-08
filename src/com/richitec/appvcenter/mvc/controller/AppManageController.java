package com.richitec.appvcenter.mvc.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.richitec.appvcenter.constants.PageName;
import com.richitec.appvcenter.constants.WebConstants;
import com.richitec.appvcenter.framework.ContextLoader;
import com.richitec.appvcenter.mvc.model.AppDao;

@Controller
@RequestMapping("/appmanage")
public class AppManageController {
	private AppDao appDao;

	@PostConstruct
	public void init() {
		appDao = ContextLoader.getAppDao();
	}

	@RequestMapping(value = "/versionlist", method = RequestMethod.GET)
	public ModelAndView versionList(@RequestParam String appId) {
		List<Map<String, Object>> versionList = appDao.getVersions(appId);
		String appName = appDao.getAppName(appId);
		ModelAndView view = new ModelAndView();
		view.setViewName("appmanage/versionlist");
		view.addObject(WebConstants.page_name.name(), PageName.appmanage.name());
		view.addObject(WebConstants.version_list.name(), versionList);
		view.addObject(WebConstants.app_name.name(), appName);
		return view;
	}

	@RequestMapping(value = "/newversion", method = RequestMethod.GET)
	public ModelAndView newVersion(@RequestParam String appId) {
		String appName = appDao.getAppName(appId);

		ModelAndView view = new ModelAndView();
		view.setViewName("appmanage/newversion");
		view.addObject(WebConstants.page_name.name(), PageName.appmanage.name());
		view.addObject(WebConstants.app_id.name(), appId);
		view.addObject(WebConstants.app_name.name(), appName);
		return view;
	}

	@RequestMapping(value = "/createApp", method = RequestMethod.POST)
	public ModelAndView createNewApp(
			@RequestParam(value = "app_name") String appName) {
		appDao.saveApp(appName);
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/appmanage");
		return view;
	}

	@RequestMapping(value = "/createVersion", method = RequestMethod.POST)
	public ModelAndView createNewVersion(
			@RequestParam(value = "app_id") String appId,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "version") String version,
			@RequestParam(value = "file_name") String fileName,
			@RequestParam(value = "comment") String comment) {
		appDao.saveVersion(appId, type, version, fileName, comment);
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/appmanage/versionlist");
		view.addObject("appId", appId);
		return view;
	}
	
	
}
