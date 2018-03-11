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
	src="${basePath }/roof-web/web/resources/js/Roof.web.resource.js"></script>
<script type="text/javascript"
	src="${basePath }/roof-web/web/resources/js/resource_module_detail.js"></script>
<title></title>
</head>
<body>
	<div class="ui-table-toolbar">
		<p class="yleft padding20 gray14">
			<b>模块信息</b>
		</p>
		<ul class="yright">
			<li><a name="addresource"
				href="${basePath }/resourceAction/create.action?parentId=${resource.id}&type=module"><i
					class="icon-cog icon-large"></i> 新增模块</a></li>
			<c:if test="${resource.lvl != 0 }">
				<li><a name="addresource"
					href="${basePath }/resourceAction/create.action?parentId=${resource.id}&type=privilege"><i
						class="icon-cogs icon-large"></i> 新增资源</a></li>
			</c:if>
			<c:if test="${resource.leaf }">
				<li><a id="delSrcBtn"
					href="${basePath }/resourceAction/delete.json?id=${resource.id }"><i
						class="icon-trash icon-large"></i> 删除</a></li>
			</c:if>
			<li><a id="saveBtn" href="#"><i class="icon-save icon-large"></i>
					保存</a></li>
		</ul>
	</div>
	<form id="mainForm"
		action="${basePath }/resourceAction/updateModule.action" method="post">
		<input id="resource_leaf" name="module.leaf" type="hidden"
			value="${resource.leaf }">
		<table border="0" cellpadding="0" cellspacing="1" class="ui-table"
			width="100%">
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">模块名:
					<input name="id" type="hidden" value="${resource.id }" />
				</td>
				<td><input type="text" name="name" style="width: 300px;"
					value="${resource.name }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">顺序:</td>
				<td><input type="text" style="width: 300px;" name="seq"
					value="${resource.seq }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">等级:</td>
				<td><input type="text" style="width: 300px;" name="lvl"
					value="${resource.lvl }" readonly="readonly" /></td>
			</tr>
			<c:if test="${resource.lvl != 0 }">
				<tr>
					<td class="ui-table-header2" style="text-align: center;"
						width="20%">上级节点:</td>
					<td><input type="text" style="width: 300px;"
						value="${resource.parent.name }" readonly="readonly" /></td>
				</tr>
				<tr>
					<td class="ui-table-header2" style="text-align: center;"
						width="20%">标识:</td>
					<td><input type="text" name="identify"
						style="width: 300px;" value="${resource.identify }" /></td>
				</tr>
				<tr>
					<td class="ui-table-header2" style="text-align: center;"
						width="20%">描述:</td>
					<td><input type="text" name="description"
						style="width: 300px;" value="${resource.description }" /></td>
				</tr>
			</c:if>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">路径:</td>
				<td><input type="text" name="path" style="width: 300px;"
					value="${resource.path }" /> <input id="parent_path" type="hidden"
					value="${resource.parent.path }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">规则:</td>
				<td><input type="text" name="pattern"
					style="width: 300px;" value="${resource.pattern }" /> <input
					type="hidden" id="parent_pattern"
					value="${resource.parent.pattern }" /></td>
			</tr>
		</table>
	</form>
</body>
</html>