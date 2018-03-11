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
</head>
<body>
	<div class="ui-table-toolbar">
		<p class="yleft padding20 gray14">
			<b>资源信息</b>
		</p>
		<ul class="yright">
			<li><a name="addresource"
				href="${basePath }/resourceAction/create.action?parentId=${resource.id}&type=privilege"><i
					class="icon-cogs icon-large"></i> 新增资源</a></li>
			<li><a name="addQuery" href="${basePath }/resourceAction/create.action?parentId=${resource.id}&type=query"><i
					class="icon-cogs icon-large"></i> 新增查询</a></li>
			<c:if test="${resource.leaf }">
				<li><a id="delSrcBtn" href="${basePath }/resourceAction/delete.json?id=${resource.id }"><i
						class="icon-trash icon-large"></i> 删除</a></li>
			</c:if>
			<li><a id="saveBtn" href="#"><i class="icon-save icon-large"></i> 保存</a></li>
		</ul>
	</div>
	<form id="mainForm" action="${basePath }/resourceAction/updatePrivilege.action" method="post">
		<table border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">资源名: <input name="id"
					type="hidden" value="${resource.id }" /> <input id="parent_class" type="hidden"
					value="${resource.parent['class'].name }" />
				</td>
				<td><input type="text" name="name" style="width: 300px;" value="${resource.name }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">顺序:</td>
				<td><input type="text" style="width: 300px;" name="seq" value="${resource.seq }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">等级:</td>
				<td><input type="text" style="width: 300px;" name="lvl" value="${resource.lvl }" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">上级节点:</td>
				<td><input type="text" style="width: 300px;" value="${resource.parent.name }" readonly="readonly" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">标识:</td>
				<td><input type="text" name="identify" style="width: 300px;" value="${resource.identify }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">描述:</td>
				<td><input type="text" name="description" style="width: 300px;" value="${resource.description }" />
				</td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">路径:</td>
				<td><input type="text" name="path" style="width: 300px;" value="${resource.path }" /> <input
					id="parent_path" type="hidden" value="${resource.parent.path }" /></td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">规则:</td>
				<td><input type="text" name="pattern" style="width: 300px;" value="${resource.pattern }" /> <input
					id="parent_pattern" type="hidden" value="${resource.parent.pattern }" /></td>
			</tr>
		</table>

		<div class="ui-table-toolbar">
			<p class="yleft padding20 gray14">
				<b>参数</b>
			</p>
		</div>
		<table border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">支持格式:</td>
				<td><select name="format" style="width: 300px;">
						<c:choose>
							<c:when test="${resource.format ==  'json'}">
								<option selected="selected" value="json">json</option>
							</c:when>
							<c:otherwise>
								<option value="json">json</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${resource.format ==  'xml'}">
								<option selected="selected" value="xml">xml</option>
							</c:when>
							<c:otherwise>
								<option value="json">xml</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${resource.format ==  'html'}">
								<option selected="selected" value="html">html</option>
							</c:when>
							<c:otherwise>
								<option value="html">html</option>
							</c:otherwise>
						</c:choose>
				</select></td>
			</tr>
			<!--
			<tr>
				<td class="ui-table-header2" style="text-align: center;">请求参数说明:</td>
				<td><div class="ui-table-toolbar">
						<ul class="yright">
							<li><a id="parameters_new_btn" href="#"><i class="icon-plus icon-large"></i> 新增</a></li>
							<li><a href="#"><i class="icon-edit icon-large"></i> 修改</a>
							</li>
							<li><a href="#"><i class="icon-trash icon-large"></i> 删除</a>
							</li>
						</ul>
					</div>
					<table border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
						<tr>
							<td class="ui-table-header2" style="text-align: center;" width="10%">名称</td>
							<td class="ui-table-header2" style="text-align: center;" width="10%">必选</td>
							<td class="ui-table-header2" style="text-align: center;" width="10%">类型及范围</td>
							<td class="ui-table-header2" style="text-align: center;" width="70%">说明</td>
						</tr>
						<tr>
							<td>source</td>
							<td>false</td>
							<td>string</td>
							<td>采用OAuth授权方式不需要此参数</td>
						</tr>
						<tr>
							<td>source</td>
							<td>false</td>
							<td>string</td>
							<td>采用OAuth授权方式不需要此参数</td>
						</tr>
						<tr>
							<td>source</td>
							<td>false</td>
							<td>string</td>
							<td>采用OAuth授权方式不需要此参数</td>
						</tr>
					</table>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;">返回字段说明:</td>
				<td><div class="ui-table-toolbar">
						<ul class="yright">
							<li><a href="#" id="return_fields_new_btn"><i class="icon-plus icon-large"></i> 新增</a>
							</li>
							<li><a href="#"><i class="icon-edit icon-large"></i> 修改</a>
							</li>
							<li><a href="#"><i class="icon-trash icon-large"></i> 删除</a>
							</li>
						</ul>
					</div>
					<table border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
						<tr>
							<td class="ui-table-header2" style="text-align: center;" width="10%">名称</td>
							<td class="ui-table-header2" style="text-align: center;" width="10%">必选</td>
							<td class="ui-table-header2" style="text-align: center;" width="10%">类型及范围</td>
							<td class="ui-table-header2" style="text-align: center;" width="70%">说明</td>
						</tr>
						<tr>
							<td>source</td>
							<td>false</td>
							<td>string</td>
							<td>采用OAuth授权方式不需要此参数</td>
						</tr>
						<tr>
							<td>source</td>
							<td>false</td>
							<td>string</td>
							<td>采用OAuth授权方式不需要此参数</td>
						</tr>
						<tr>
							<td>source</td>
							<td>false</td>
							<td>string</td>
							<td>采用OAuth授权方式不需要此参数</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">返回实例:</td>
				<td><textarea cols="80" rows="10" name="returnExample">${resource.returnExample }</textarea>
				</td>
			</tr>
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">备注:</td>
				<td><textarea cols="80" rows="10" name="remark">${resource.remark }</textarea>
				</td>
			</tr>
			  -->
		</table>
	</form>

	<div id="parameters_new_form" title="请求参数新增">
		<table border="0" cellpadding="0" width="100%">
			<tr>
				<td style="text-align: center;" width="30%">名称:</td>
				<td><input type="text" style="width: 250px;" /></td>
			<tr>
			<tr>
				<td style="text-align: center;" width="30%">必选:</td>
				<td><input type="text" style="width: 250px;" /></td>
			<tr>
			<tr>
				<td style="text-align: center;" width="30%">类型及范围:</td>
				<td><input type="text" style="width: 250px;" /></td>
			<tr>
			<tr>
				<td style="text-align: center;" width="30%">说明:</td>
				<td><textarea rows="10" cols="50"></textarea></td>
			<tr>
		</table>
	</div>

	<div id="return_fields_new_form" title="返回字段说明新增">
		<table border="0" cellpadding="0" width="100%">
			<tr>
				<td style="text-align: center;" width="30%">名称:</td>
				<td><input type="text" style="width: 250px;" /></td>
			<tr>
			<tr>
				<td style="text-align: center;" width="30%">必选:</td>
				<td><input type="text" style="width: 250px;" /></td>
			<tr>
			<tr>
				<td style="text-align: center;" width="30%">类型及范围:</td>
				<td><input type="text" style="width: 250px;" /></td>
			<tr>
			<tr>
				<td style="text-align: center;" width="30%">说明:</td>
				<td><textarea rows="10" cols="50"></textarea></td>
			<tr>
		</table>
	</div>
</body>
</html>