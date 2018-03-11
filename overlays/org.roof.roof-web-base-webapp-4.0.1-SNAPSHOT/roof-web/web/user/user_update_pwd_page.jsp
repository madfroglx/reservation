<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${basePath}/common/js/fort_awesome/css/font-awesome.min.css" />
<!--[if IE 7]>
  <link rel="stylesheet" href="${basePath}/common/js/fort_awesome/css/font-awesome-ie7.min.css" />
 <![endif]-->
<%@include file="/roof-web/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${basePath}/common/js/zTree/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript" src="${basePath }/common/js/ROOF.Class.js"></script>
<script type="text/javascript" src="${basePath }/roof-web/web/js/ROOF.SelectableTable.js"></script>
<script type="text/javascript" src="${basePath }/common/js/zTree/js/jquery.ztree.all-3.1.min.js"></script>
<script type="text/javascript" src="${basePath}/common/js/md5.js"></script>
<script type="text/javascript" src="${basePath}/roof-web/web/user/js/user_create_page.js"></script>
</head>
<body>

	<div class="ui-table-toolbar">
		<p class="yleft padding20 gray14">
			<b>修改密码</b>
		</p>
		<ul class="yright">
			<li><a id="saveBtn" href="#"><i class="icon-save icon-large"></i>保存</a></li>
		</ul>
	</div>
	<form id="mainForm" action="${basePath }/userAction/update_pwd.action" method="post">
		<input type="hidden" name="user.id" value="${user.id }" />
		<table border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">姓名:</td>
				<td>${user.name }</td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">用户名:</td>
				<td>${user.username }</td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">密码:</td>
				<td><input type="password" name="user.password" style="width: 300px;" value="" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">重复密码:</td>
				<td><input type="password" name="repassword" style="width: 300px;" value="" /></td>
			</tr>
		</table>
	</form>
</body>
</html>