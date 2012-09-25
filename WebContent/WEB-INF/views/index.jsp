<%@page import="com.richitec.appvcenter.user.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    	               "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh">
<head>
<title>AppVCenter</title>
<jsp:include page="common/_head.jsp"></jsp:include>
</head>
<body>
	<%
		UserBean user = (UserBean) session.getAttribute(UserBean.SESSION_BEAN);
		if (user != null) {
			response.sendRedirect("/appvcenter/appmanage");
			return;
		}
	%>
	

	<jsp:include page="common/beforelogin_navibar.jsp"></jsp:include>
	<div class="container">
		<form id="signin-form" action="/appvcenter/login">
			<label>系统登录</label>
			<div>
				<input type="text" class="input-medium" name="loginName" placeholder="用户名" />
			</div>
			<div>
				<input type="password" class="input-medium" name="loginPwd" placeholder="密码" />
			</div>
			<button class="btn" type="submit">登录</button>

			<%
				Integer loginRetCode = (Integer) request.getAttribute("LoginRetCode");
				if (loginRetCode != null) {
					if (loginRetCode == HttpServletResponse.SC_FORBIDDEN) {
					%>
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<label>用户名或密码错误！</label>
						</div>
					<% 	
					}
				}
			%>
		</form>
	</div>
	<jsp:include page="common/_footer.jsp"></jsp:include>
	<script src="/appvcenter/js/lib/jquery-1.8.0.min.js"></script>
	<script src="/appvcenter/js/lib/bootstrap.min.js"></script>
</body>


</html>
