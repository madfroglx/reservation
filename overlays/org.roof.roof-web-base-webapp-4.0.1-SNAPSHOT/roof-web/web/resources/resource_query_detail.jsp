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
	src="${basePath }/roof-web/web/resources/js/resource_resource_detail.js"></script>
<title></title>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#statemet_select_btn").button()
								.click(
										function(event) {
											$("#statemet_select_dialog")
													.dialog("open");
										});

						$("#statemet_select_dialog")
								.dialog(
										{
											autoOpen : false,
											width : 800,
											height : 600,
											modal : true,
											resizable : false,
											buttons : {
												"确定" : function() {
													$(
															'input[name="privilege.identify"]')
															.val(
																	statemet_select_frame.window
																			.getSelectedStatementname())
															.trigger("change");
													$(this).dialog("close");
												},
												"取消" : function() {
													$(this).dialog("close");
												}
											}
										});
					});
</script>
</head>
<body>
	<div class="ui-table-toolbar">
		<p class="yleft padding20 gray14">
			<b>查询信息</b>
		</p>
		<ul class="yright">
			<li><a name="addresource"
				href="${basePath }/resourceAction/create.action?parentId=${resource.id}&type=queryfilter"><i
					class="icon-cogs icon-large"></i> 新增过滤</a></li>
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
		action="${basePath }/resource_queryAction/update.action" method="post">
		<table border="0" cellpadding="0" cellspacing="1" class="ui-table"
			width="100%">
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">过滤名:
					<input name="privilege.id" type="hidden" value="${resource.id }" />
					<input id="parent_class" type="hidden"
					value="${resource.parent.class.name }" />
				</td>
				<td><input type="text" name="privilege.name"
					style="width: 300px;" value="${resource.name }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">顺序:</td>
				<td><input type="text" style="width: 300px;"
					name="privilege.seq" value="${resource.seq }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">等级:</td>
				<td><input type="text" style="width: 300px;"
					name="privilege.lvl" value="${resource.lvl }" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">上级节点:</td>
				<td><input type="text" style="width: 300px;"
					value="${resource.parent.name }" readonly="readonly" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">标识:</td>
				<td><input type="text" name="privilege.identify"
					readonly="readonly" style="width: 300px;"
					value="${resource.identify }" />&nbsp;&nbsp;<a
					id="statemet_select_btn" class="btn" href="#"><i
						class="icon-search"></i> </a></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">描述:</td>
				<td><input type="text" name="privilege.description"
					style="width: 300px;" value="${resource.description }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">路径:</td>
				<td><input type="text" name="privilege.path"
					style="width: 300px;" value="${resource.path }" /> <input
					id="parent_path" type="hidden" value="${resource.parent.path }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">规则:</td>
				<td><input type="text" name="privilege.pattern"
					style="width: 300px;" value="${resource.pattern }" /> <input
					id="parent_pattern" type="hidden"
					value="${resource.parent.pattern }" /></td>
			</tr>
		</table>

		<div id="statemet_select_dialog" title="请选择查询">
			<iframe name="statemet_select_frame"
				src="resource_queryAction/statementSelectPage.action"
				frameborder="0" width="100%" height="100%"></iframe>
		</div>
</body>
</html>