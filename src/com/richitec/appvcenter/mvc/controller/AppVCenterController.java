package com.richitec.appvcenter.mvc.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.richitec.appvcenter.constants.PageName;
import com.richitec.appvcenter.constants.WebConstants;
import com.richitec.appvcenter.framework.Configuration;
import com.richitec.appvcenter.framework.ContextLoader;
import com.richitec.appvcenter.mvc.model.AppDao;
import com.richitec.appvcenter.user.UserBean;

@Controller
public class AppVCenterController {

	private AppDao appDao;

	@PostConstruct
	public void init() {
		appDao = ContextLoader.getAppDao();
	}

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
	public ModelAndView login(HttpSession session,
			@RequestParam String loginName, @RequestParam String loginPwd) {
		Configuration config = ContextLoader.getConfiguration();
		if (loginName.equals(config.getSystemUser())
				&& loginPwd.equals(config.getSystemPwd())) {
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
		view.addObject(WebConstants.page_name.name(), PageName.appmanage.name());
		List<Map<String, Object>> apps = appDao.getApps();
		view.addObject(WebConstants.app_list.name(), apps);
		return view;
	}

	@ResponseStatus(HttpStatus.MOVED_TEMPORARILY)
	@RequestMapping(value = "/downloadapp/{appId}/{device}")
	public void downloadApp(HttpServletResponse response,
			@PathVariable String appId, @PathVariable String device) throws IOException {
		String clientName = appDao.getNewestAppClient(appId, device);
		if (clientName == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String serverUrl = ContextLoader.getConfiguration().getServerUrl();
		String downloadUrl = serverUrl + "/download/" + clientName;
		response.addHeader("Location", downloadUrl);
	}

	@RequestMapping("/version/{appId}/{device}")
	public void getAppVersion(HttpServletResponse response,
			@PathVariable String appId, @PathVariable String device)
			throws JSONException, IOException {
		Map<String, Object> versionInfo = appDao.getNewestAppVersion(appId,
				device);
		if (versionInfo == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String version = (String) versionInfo.get("version");
		String comment = (String) versionInfo.get("comment");
		JSONObject appVer = new JSONObject();
		appVer.put("version", version);
		appVer.put("comment", comment);
		response.getWriter().print(appVer.toString());
	}
}
