<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	src="${basePath}/roof-web/web/resources/js/resource_list.js"></script>
<title></title>
</head>
<body>
	<div class="ui-table-toolbar">
		<p class="yleft padding20 gray14">
			<b>${resource.name }</b>
		</p>
		<ul class="yright">
			<li><a name="addresource"
				href="${basePath }/resourceAction/create.action?parentId=${resource.id}&type=module"><i
					class="icon-cog icon-large"></i> 新增模块</a></li>
			<li><a name="addresource"
				href="${basePath }/resourceAction/create.action?parentId=${resource.id}&type=privilege"><i
					class="icon-cogs icon-large addresource"></i> 新增资源</a></li>
			<li><a href="#"><i class="icon-trash icon-large"></i> 查看</a></li>
			<li><a href="#"><i class="icon-edit icon-large"></i> 修改</a></li>
			<li><a href="#"><i class="icon-trash icon-large"></i> 删除</a></li>
		</ul>
	</div>
	<table border="0" cellpadding="0" cellspacing="1" class="ui-table"
		width="100%">
		<tr>
			<td class="ui-table-header2" style="text-align: center;" width="5%">序号</td>
			<td class="ui-table-header2" style="text-align: center;" width="5%">类型</td>
			<td class="ui-table-header2" style="text-align: center;" width="10%">名称</td>
			<td class="ui-table-header2" style="text-align: center;" width="10%">标识</td>
			<td class="ui-table-header2" style="text-align: center;" width="20%">路径</td>
			<td class="ui-table-header2" style="text-align: center;" width="20%">规则</td>
		</tr>
		<c:forEach var="r" items="${resources }" varStatus="status">
			<tr>
				<td>${status.index + 1 }</td>
				<td></td>
				<td>${r.name }</td>
				<td>${r.identify }</td>
				<td>${r.path }</td>
				<td>${r.pattern }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>