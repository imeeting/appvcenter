<%@page import="com.richitec.appvcenter.constants.WebConstants"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>版本列表</title>
<jsp:include page="../common/_head.jsp"></jsp:include>
</head>
<body>
	<%
		List<Map<String, Object>> versionList = (List<Map<String, Object>>) request.getAttribute(WebConstants.version_list.name());
		String appName = (String) request.getAttribute(WebConstants.app_name.name()); 
	%>
	<jsp:include page="../common/afterlogin_navibar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="offset1 span9 clearfix">
				<a href="/appvcenter/appmanage" class="text-info pull-left">&lt;&lt;返回应用管理</a>
				<label class="pull-right">当前应用：<strong><%=appName %></strong></label>
			</div>
			<div class="span6 offset3">
				<div>
					<table class="table">
						<thead>
							<tr>
								<th>终端类型</th>
								<th>客户端名称</th>
								<th>版本号</th>
								<th>更新时间</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="version_tbody">
					<table class="table table-hover">
						<tbody>
							<%
								if (versionList != null) {
									for (Map<String, Object> version : versionList) {	
										String type = (String)version.get("type");
										String fileName = (String) version.get("client_name");
										String clientVersion = (String) version.get("version");
										String updateTime = String.valueOf(version.get("update_time"));
							%>
							<tr>
								<td width="22%"><%=type %></td>
								<td width="26%"><%=fileName %></td>
								<td width="17%"><%=clientVersion %></td>
								<td width="22%"><%=updateTime %></td>
								<td width="13%"><a class="" href="#" title="下载"><i class="icon-download"></i></a></td>
							</tr>
							
							<%
									}
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="../common/_footer.jsp"></jsp:include>

	<script src="/appvcenter/js/lib/jquery-1.8.0.min.js"></script>
	<script src="/appvcenter/js/lib/bootstrap.min.js"></script>
</body>
</html>