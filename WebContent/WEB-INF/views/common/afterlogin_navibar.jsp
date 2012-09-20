<%@page import="com.richitec.appvcenter.constants.WebConstants"%>
<%@page import="com.richitec.appvcenter.user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	UserBean userBean = (UserBean) session
			.getAttribute(UserBean.SESSION_BEAN);
	if (userBean == null) {
		response.sendRedirect("/appvcenter/index");
		return;
	}
	String pageName = String.valueOf(request
			.getAttribute(WebConstants.page_name.name()));
%>
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand">AppVCenter</a>
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class="<%="appmanage".equals(pageName) ? "active" : ""%>"><a href="/appvcenter/appmanage">应用管理</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>