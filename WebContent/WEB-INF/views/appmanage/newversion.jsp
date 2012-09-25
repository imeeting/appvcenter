<%@page import="com.richitec.appvcenter.constants.WebConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>创建新版本</title>
<jsp:include page="../common/_head.jsp"></jsp:include>
</head>
<body>
	<%
		String appId = (String)request.getAttribute(WebConstants.app_id.name());
		String appName = (String)request.getAttribute(WebConstants.app_name.name());
	%>

	<jsp:include page="../common/afterlogin_navibar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="offset1 span9 clearfix">
				<a href="/appvcenter/appmanage" class="text-info pull-left">&lt;&lt;返回应用管理</a>
				<label class="pull-right">当前应用：<strong><%=appName %></strong></label>
			</div>
			<div class="span6 offset3">
				<form action="/appvcenter/appmanage/createVersion" method="post">
					<input type="hidden" name="app_id" value="<%=appId %>" />
					<input id="appName" type="hidden" name="app_name" value="<%=appName %>" />
					<table class="table table-bordered">
						<caption><h4>创建新版本</h4></caption>
							<tbody>
							<tr>
								<td>终端类型</td>
								<td>
									<select id="client_type" name="type">
										<option value="android" selected="selected">Android</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>版本</td>
								<td><input id="client_version_input" type="text" name="version" /></td>
							</tr>
							<tr>
								<td>文件名</td>
								<td><input id="file_name_input" name="file_name" type="text" readonly="readonly" /></td>
							</tr>
						</tbody>
					</table>
					<button type="submit" class="btn">保存</button>
				</form>
			</div>
		</div>

	</div>
	<jsp:include page="../common/_footer.jsp"></jsp:include>

	<script src="/appvcenter/js/lib/jquery-1.8.0.min.js"></script>
	<script src="/appvcenter/js/lib/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			function generateFileName() {
				var type = $("#client_type").val();
				var version = $("#client_version_input").val();
				var suffix = "apk";
				if (type == "android") {
					suffix = "apk";
				}
				var fileName = $("#appName").val() + "-" + version + "." + suffix;
				$("#file_name_input").val(fileName);
				
				setTimeout(function() {
					generateFileName();
				}, 300);
			}
			
			generateFileName();
		});
	</script>
</body>
</html>