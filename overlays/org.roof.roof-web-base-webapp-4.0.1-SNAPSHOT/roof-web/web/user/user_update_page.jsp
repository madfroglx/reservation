<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${basePath}/common/js/fort_awesome/css/font-awesome.min.css" />
<!--[if IE 7]>
  <link rel="stylesheet" href="${basePath}/common/js/fort_awesome/css/font-awesome-ie7.min.css" />
 <![endif]-->
<%@include file="/roof-web/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${basePath}/common/js/zTree/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript"
	src="${basePath }/common/js/ROOF.Class.js"></script>
<script type="text/javascript"
	src="${basePath }/roof-web/web/js/ROOF.SelectableTable.js"></script>
<script type="text/javascript"
	src="${basePath }/common/js/zTree/js/jquery.ztree.all-3.1.min.js"></script>
<script type="text/javascript" src="${basePath}/common/js/md5.js"></script>
<script type="text/javascript"
	src="${basePath}/roof-web/web/user/js/user_create_page.js"></script>
</head>
<body>
	<div class="ui-table-toolbar">
		<p class="yleft padding20 gray14">
			<b>修改用户</b>
		</p>
		<ul class="yright">
			<li><a id="saveBtn" href="#"><i class="icon-save icon-large"></i>
					保存</a></li>
			<c:if test="${currentPage != null }">
				<li><a id="backBtn"
					href="${basePath }/userAction/list.action?currentPage=${currentPage}"><i
						class="icon-reply icon-large"></i> 返回</a></li>
			</c:if>
		</ul>
	</div>
	<form id="mainForm" action="${basePath }/userAction/update.action"
		method="post">
		<input type="hidden" name="id" value="${user.id }" />
		<table border="0" cellpadding="0" cellspacing="1" class="ui-table"
			width="100%">
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">姓名:</td>
				<td><input type="text" name="name" style="width: 300px;"
					value="${user.name }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">用户名:</td>
				<td><input type="text" name="username" style="width: 300px;"
					value="${user.username }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">部门:</td>
				<td><input type="hidden" name="org.id" value="${user.org.id }" /><input
					type="text" readonly="readonly" name="org.name"
					style="width: 300px;" value="${user.org.name }" />&nbsp;&nbsp;<a
					id="org_select_btn" class="btn" href="#"> <i
						class="icon-search"></i>
				</a></td>
			</tr>
			<tr style="display: none;">
				<td class="ui-table-header2" style="text-align: center;" width="20%">密码:</td>
				<td><input type="password" name="password"
					style="width: 300px;" value="${user.password }" /></td>
			</tr>
			<tr style="display: none;">
				<td class="ui-table-header2" style="text-align: center;" width="20%">重复密码:</td>
				<td><input type="password" name="repassword"
					style="width: 300px;" value="${user.password }" /></td>
			</tr>
		</table>
		<table border="0" cellpadding="0" cellspacing="1" class="ui-table"
			width="100%">
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">角色:</td>
				<td><c:forEach var="role" items="${roleses }"
						varStatus="status">
						<c:set var="flag" value="false" />
						<c:forEach var="r" items="${user.roles }">
							<c:if test="${r.id == role.id }">
								<c:set var="flag" value="true" />
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${flag == true}">
								<input type="checkbox" name="rolesIds" value="${role.id}"
									checked="checked" /> ${role.name }<br />
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="rolesIds" value="${role.id}" /> ${role.name }<br />
							</c:otherwise>
						</c:choose>

					</c:forEach></td>
			</tr>
		</table>
	</form>
	<div id="org_select_dialog" title="请选择部门">
		<div class="ztree" style="height: 80%; overflow: auto;"></div>
	</div>

</body>
</html>