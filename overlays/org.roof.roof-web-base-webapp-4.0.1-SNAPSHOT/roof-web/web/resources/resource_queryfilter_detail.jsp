<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${basePath}/common/js/fort_awesome/css/font-awesome.min.css" />
<!--[if IE 7]>
  <link rel="stylesheet" href="${basePath}/common/js/fort_awesome/css/font-awesome-ie7.min.css" />
 <![endif]-->
<%@include file="/roof-web/head.jsp"%>
<script type="text/javascript" src="${basePath }/roof-web/web/resources/js/Roof.web.resource.js"></script>
<script type="text/javascript" src="${basePath }/roof-web/web/resources/js/resource_resource_detail.js"></script>
<title></title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#addCurrentUser").button().click(function() {
			$("textarea[name='privilege.criteria']").val(function() {
				return $(this).val() + "\\#{T(org.roof.security.BaseUserContext).getCurrentUser()?.id}";

			});
		});
		$("#addCurrentUserOrg").button().click(function() {
			$("textarea[name='privilege.criteria']").val(function() {
				return $(this).val() + "\\#{T(org.roof.security.BaseUserContext).getCurrentUser()?.org?.org_id}";
			});
		});
		$("#addCurrentUserRoles").button().click(function() {
			$("textarea[name='privilege.criteria']").val(function() {
				return $(this).val() + "\\#{T(org.roof.security.BaseUserContext).getUserRoles()}";
			});
		});
	});
</script>
</head>
<body>
	<div class="ui-table-toolbar">
		<p class="yleft padding20 gray14">
			<b>资源信息</b>
		</p>
		<ul class="yright">
			<li><a name="addresource"
				href="${basePath }/resourceAction/create.action?parentId=${resource.id}&type=queryfilter"><i
					class="icon-cogs icon-large"></i> 新增过滤</a></li>
			<c:if test="${resource.leaf }">
				<li><a id="delSrcBtn" href="${basePath }/resourceAction/delete.json?id=${resource.id }"><i
						class="icon-trash icon-large"></i> 删除</a></li>
			</c:if>
			<li><a id="saveBtn" href="#"><i class="icon-save icon-large"></i> 保存</a></li>
		</ul>
	</div>
	<form id="mainForm" action="${basePath }/resource_query_filterAction/update.action" method="post">
		<table border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">资源名: <input name="privilege.id"
					type="hidden" value="${resource.id }" /> <input id="parent_class" type="hidden"
					value="${resource.parent.class.name }" />
				</td>
				<td><input type="text" name="privilege.name" style="width: 300px;" value="${resource.name }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">顺序:</td>
				<td><input type="text" style="width: 300px;" name="privilege.seq" value="${resource.seq }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">等级:</td>
				<td><input type="text" style="width: 300px;" name="privilege.lvl" value="${resource.lvl }" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">上级节点:</td>
				<td><input type="text" style="width: 300px;" value="${resource.parent.name }" readonly="readonly" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">标识:</td>
				<td><input type="text" name="privilege.identify" style="width: 300px;" value="${resource.identify }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">是否使用表达式:</td>
				<td><select style="width: 300px;" name="privilege.useSpel">
						<c:if test="${empty resource.useSpel ||  resource.useSpel == 0 }">
							<option value="0" selected="selected">否</option>
							<option value="1">是</option>
						</c:if>
						<c:if test="${resource.useSpel == 1 }">
							<option value="0">否</option>
							<option value="1" selected="selected">是</option>
						</c:if>
				</select></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">条件:</td>
				<td><textarea rows="5" cols="60" name="privilege.criteria">${resource.criteria }</textarea>&nbsp;&nbsp;<a
					id="addCurrentUser" href="#">当前用户</a>&nbsp;&nbsp;<a id="addCurrentUserOrg" href="#">当前用户组织</a> &nbsp;&nbsp;<a
					id="addCurrentUserRoles" href="#">当前用户角色</a></td>
			</tr>

			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">描述:</td>
				<td><input type="text" name="privilege.description" style="width: 300px;" value="${resource.description }" />
				</td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">路径:</td>
				<td><input type="text" name="privilege.path" style="width: 300px;" value="${resource.path }" /> <input
					id="parent_path" type="hidden" value="${resource.parent.path }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">规则:</td>
				<td><input type="text" name="privilege.pattern" style="width: 300px;" value="${resource.pattern }" /> <input
					id="parent_pattern" type="hidden" value="${resource.parent.pattern }" /></td>
			</tr>
		</table>
</body>
</html>