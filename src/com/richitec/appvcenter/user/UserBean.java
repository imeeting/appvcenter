package com.richitec.appvcenter.user;

public class UserBean {
	public static final String SESSION_BEAN = "userbean";
	
	private String username;
	private String password;
	

	public String getUserName() {
		return username;
	}

	public void setUserName(String name) {
		this.username = name;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
}
