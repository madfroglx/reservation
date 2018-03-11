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
<script type="text/javascript"
	src="${basePath}/roof-web/web/role/js/role_create_page.js"></script>
<script type="text/javascript"
	src="${basePath }/common/js/zTree/js/jquery.ztree.all-3.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${basePath}/common/js/zTree/zTreeStyle/zTreeStyle.css" />
<title></title>
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
				<li><a id="backbtn"
					href="${basePath }/roleAction/list.action?currentPage=${currentPage}"><i
						class="icon-reply icon-large"></i> 返回</a></li>
			</c:if>
		</ul>
	</div>
	<form id="mainForm" action="${basePath }/roleAction/update.action"
		method="post">
		<input type="hidden" name="id" value="${role.id }" />
		<%@include file="role_form.jsp"%>
	</form>
</body>
</html>