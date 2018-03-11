<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/roof-web/head.jsp"%>
<script type="text/javascript" src="${basePath }/roof-web/web/user/js/user_list.js"></script>
<script type="text/javascript" src="${basePath }/common/js/ROOF.Class.js"></script>
<script type="text/javascript" src="${basePath }/roof-web/web/js/ROOF.SelectableTable.js"></script>
<link rel="stylesheet" href="${basePath}/common/js/fort_awesome/css/font-awesome.min.css" />
<script type="text/javascript">
function resetPwd(obj){
	if(!obj.id){
		return;
	}
	$.ajax({
	    async: false,
	    url : "userAction!update_pwd.action",
	    data: {"user.id":obj.id,"user.password":"${defPwd}"},
	    type: 'post',
	    dataType: 'json',
	    cache: false,
	    beforeSubmit: function(formData){
	   },
	   error: function(){
	       alert('Ajax信息加载出错，请重试！');
        },
        success: function(replay){
         alert(replay.message);
         if(replay.state=="success"){
        	 //$('#searchBtn').click();
         }
	   }
	 });
}
</script>
<!--[if IE 7]>
  <link rel="stylesheet" href="${basePath}/common/js/fort_awesome/css/font-awesome-ie7.min.css" />
 <![endif]-->
<title></title>
</head>
<body>
	<div class="ui-table-toolbar">
		<p class="yleft padding20 gray14">
			<b>用户搜索</b>
		</p>
		<ul class="yright">
			<li><a id="resetBtn" href="javascript:void(0)"><i class="icon-repeat icon-large"></i> 重置</a></li>
			<li><a id="searchBtn" href="javascript:void(0)"><i class="icon-search icon-large"></i> 搜索</a></li>
		</ul>
	</div>
	<form id="mainForm" action="${basePath }/userAction/list_select.action" method="post">
		<table border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
			<tr>
				<td class="ui-table-header2" style="text-align: center;" width="20%">姓名:</td>
				<td><input type="text" name="user.name" style="width: 300px;" value="${user.name }" /></td>
				<td class="ui-table-header2" style="text-align: center;" width="20%">用户名:</td>
				<td><input type="text" name="user.username" style="width: 300px;" value="${user.username }" />
				</td>
			</tr>
		</table>
	<div class="ui-table-toolbar">
		<p class="yleft padding20 gray14">
			<b>用户列表</b>
		</p>
		<!-- <ul class="yright">
			<li><a id="resetPwdBtn" href="javascript:void(0)"><i class="icon-repeat icon-large"></i>密码重置</a></li>
		</ul> -->
	</div>
	<table border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
		<tr>
			<td class="ui-table-header2" style="text-align: center;" width=""></td>
			<td class="ui-table-header2" style="text-align: center;" width="">序号</td>
			<td class="ui-table-header2" style="text-align: center;" width="">姓名</td>
			<td class="ui-table-header2" style="text-align: center;" width="">用户名</td>
			<td class="ui-table-header2" style="text-align: center;" width="">操作</td>
		</tr>
		<c:forEach var="user" items="${page.dataList }" varStatus="status">
			<tr>
				<td><input type="checkbox" name="users[${status.index }].id" value="${user.id }" /></td>
				<td style="text-align: center;">${status.index + 1 }</td>
				<td style="text-align: center;">${user.name }</td>
				<td style="text-align: center;">${user.username }</td>
				<td style="text-align: center; cursor: pointer;" onclick="resetPwd(this)" id="${user.id }">密码重置</td>
			</tr>
		</c:forEach>
	</table>
	<%@include file="/roof-web/page_bar.jsp" %>
	</form>
</body>
</html>