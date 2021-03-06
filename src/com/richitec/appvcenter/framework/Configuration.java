package com.richitec.appvcenter.framework;

/**
 * Manage the configuration of phone conference server, including IP info
 * 
 * @author sk
 * 
 */
public class Configuration {

	private String systemUser;
	private String systemPwd;
	private String serverUrl;

	public String getSystemUser() {
		return systemUser;
	}

	public void setSystemUser(String systemUser) {
		this.systemUser = systemUser;
	}

	public String getSystemPwd() {
		return systemPwd;
	}

	public void setSystemPwd(String systemPwd) {
		this.systemPwd = systemPwd;
	}

	public String getServerUrl() {
		return serverUrl;
	}

	public void setServerUrl(String serverUrl) {
		this.serverUrl = serverUrl;
	}

}
