package com.richitec.appvcenter.framework;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.richitec.appvcenter.mvc.model.AppDao;

public class ContextLoader extends ContextLoaderListener {

	public static ApplicationContext appContext;
	public static String appAbsolutePath;

	public void contextDestroyed(ServletContextEvent event) {
		ComboPooledDataSource ds = (ComboPooledDataSource) appContext
				.getBean("dataSource_mysql_c3p0");
		if (null != ds) {
			ds.close();
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		super.contextInitialized(event);
		ServletContext context = event.getServletContext();
		appAbsolutePath = context.getRealPath("/");
		appContext = WebApplicationContextUtils
				.getRequiredWebApplicationContext(context);
	}

	public static Configuration getConfiguration() {
		return (Configuration) appContext.getBean("configuration");
	}
	
	public static AppDao getAppDao() {
		return (AppDao) appContext.getBean("app_dao");
	}

}
