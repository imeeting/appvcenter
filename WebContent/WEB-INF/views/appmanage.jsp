<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<title>应用管理</title>
<jsp:include page="common/_head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="common/afterlogin_navibar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="span6 offset3">
				<div class="clearfix">
					<h4 class="pull-left">应用列表</h4>
					<a class="btn pull-right avc-button" href="#">创建新应用</a>
				</div>
				<div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>应用名称</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>智会</td>
								<td>
									<div class="btn-group">
										<button class="btn dropdown-toggle" data-toggle="dropdown">
											选择操作 <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="#">查看版本列表</a></li>
											<li><a href="#">增加新版本</a></li> 
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>


		<jsp:include page="common/_footer.jsp"></jsp:include>
	</div>
	<script src="/appvcenter/js/lib/jquery-1.8.0.min.js"></script>
	<script src="/appvcenter/js/lib/bootstrap.min.js"></script>
</body>
</html>