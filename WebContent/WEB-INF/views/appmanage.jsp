<%@page import="com.richitec.appvcenter.constants.WebConstants"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<title>应用管理</title>
<jsp:include page="common/_head.jsp"></jsp:include>
</head>
<body>
	<%
		List<Map<String, Object>> appList = (List<Map<String, Object>>) request.getAttribute(WebConstants.app_list.name());
	%>

	<jsp:include page="common/afterlogin_navibar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="span6 offset3">
				<div class="clearfix">
					<h4 class="pull-left">应用列表</h4>
					<a class="btn pull-right avc-button" data-toggle="modal"
						href="#new_app_dlg">创建新应用</a>
				</div>
				<div>
					<table class="table">
						<thead>
							<tr>
								<th>AppID</th>
								<th>应用名称</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="app_tbody">
					<table class="table table-hover">
						<tbody>
							<%
								if (appList != null) {
									for (Map<String, Object> app : appList) {
										Integer appId = (Integer) app.get("appId");
										String appName = (String) app.get("name");
												
							%>
							<tr>
								<td width="34"><%=appId %></td>
								<td width="36%"><%=appName %></td>
								<td width="30%">
									<div class="btn-group">
										<button class="btn dropdown-toggle" data-toggle="dropdown">
											选择操作 <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="/appvcenter/appmanage/versionlist?appId=<%=appId %>"><i class="icon-list"></i>&nbsp;查看版本列表</a></li>
											<li><a href="/appvcenter/appmanage/newversion?appId=<%=appId %>"><i class="icon-plus-sign"></i>&nbsp;创新新版本</a></li>
										</ul>
									</div>
								</td>
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
	<jsp:include page="common/_footer.jsp"></jsp:include>

	<!-- dialog  -->
	<div id="new_app_dlg" class="modal hide fade">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4>创建新应用</h4>
		</div>
		<div class="modal-body">
			<form id="new_app_form" class="span3 offset1" method="post" action="/appvcenter/appmanage/createApp">
				<div>
					<input id="app_name_ipt" type="text" class="input-medium span3"
						name="app_name" placeholder="应用名称" />
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal" id="new_app_close">关闭</a> <a
				id="new_app_save" href="#" class="btn btn-primary">保存</a>
		</div>
	</div>

	<!-- template -->
	<div class="template hide">
		<div class="alert alert-error new_app_error">
			<button type="button" class="close" data-dismiss="alert">×</button>
			<label>应用名称不能为空!</label>
		</div>
	</div>

	<script src="/appvcenter/js/lib/jquery-1.8.0.min.js"></script>
	<script src="/appvcenter/js/lib/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#new_app_save").click(function() {
			$("#new_app_form .new_app_error").alert("close");
			
			var appName = $("#app_name_ipt").val();
			if (appName == null || appName == "") {
				var newAppErrorAlert = $(".template .new_app_error").clone();
				$("#new_app_form").append(newAppErrorAlert);
				return false;
			}

			$("#new_app_form").submit();
		});
		
		$("#new_app_close").click(function() {
			$("#new_app_form .new_app_error").alert("close");
		});
	</script>
</body>
</html>