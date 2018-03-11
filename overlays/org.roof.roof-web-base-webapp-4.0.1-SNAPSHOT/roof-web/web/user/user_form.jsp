<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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
			type="text" readonly="readonly" name="org.name" style="width: 300px;"
			value="${org.name }" />&nbsp;&nbsp;<a id="org_select_btn"
			class="btn" href="#"> <i class="icon-search"></i>
		</a></td>
	</tr>

	<tr>
		<td class="ui-table-header2" style="text-align: center;" width="20%">密码:</td>
		<td><input type="password" name="password" style="width: 300px;"
			value="${user.password }" /></td>
	</tr>
	<tr>
		<td class="ui-table-header2" style="text-align: center;" width="20%">重复密码:</td>
		<td><input type="password" name="repassword"
			style="width: 300px;" value="${user.password }" /></td>
	</tr>
</table>
<table border="0" cellpadding="0" cellspacing="1" class="ui-table"
	width="100%">
	<tr>
		<td class="ui-table-header2" style="text-align: center;" width="20%">角色:</td>
		<td><c:forEach var="role" items="${roleses }" varStatus="status">
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
<div id="org_select_dialog" title="请选择部门">
	<div class="ztree" style="height: 80%; overflow: auto;"></div>
</div>