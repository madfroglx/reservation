<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/roof-web/head.jsp"%>
<script type="text/javascript" src="${basePath }/common/js/ROOF.Class.js"></script>
<script type="text/javascript" src="${basePath }/roof-web/web/js/ROOF.SelectableTable.js"></script>
<script type="text/javascript">
	var table = null;
	$(document).ready(function() {
		table = new ROOF.SelectableTable($('table'));
	});
	function getSelectedStatementname() {
		var checked = $('input:checked');
		if (!checked) {
			return;
		}
		return checked.attr('name');
	}
</script>
<title></title>
</head>
<body>
	<table border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
		<tr>
			<td style="text-align: center;" width="20%"></td>
			<td style="text-align: center;">查询名称</td>
		</tr>
		<c:forEach var="statementname" items="${mappedStatementNames }">
			<tr>
				<td style="text-align: center;" width="20%"><input type="checkbox" name="${statementname }"></td>
				<td style="text-align: center;">${statementname }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>