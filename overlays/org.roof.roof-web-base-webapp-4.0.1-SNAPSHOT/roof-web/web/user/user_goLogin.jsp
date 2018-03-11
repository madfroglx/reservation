<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<%@include file="/roof-web/head.jsp"%>
<script type="text/javascript" src="${basePath}/common/js/md5.js"></script>
<link rel="stylesheet" type="text/css"
	href="${basePath}/roof-web/web/user/css/goLogin.css" />
<script type="text/javascript">
	var errorCode = $
	{
		errorCode
	};
	jQuery(document).ready(function() {
		if (errorCode == 'BadCredentials') {
			alert('用户名或密码错误!');
		}
		jQuery('#login_btn').click(function() {
			var user_user_noObj = jQuery("#username");
			var user_passwordObj = jQuery("#password");
			var user_user_no = user_user_noObj.val();
			var user_password = user_passwordObj.val();
			if (!user_user_no || user_user_no == "") {
				alert("工号不能为空");
				return;
			}
			if (!user_password || user_password == "") {
				alert("密码不能为空");
				return;
			}
			var md5s = to_hex_md5(user_password).toUpperCase();
			if (!md5s) {
				return;
			}
			user_passwordObj.val(md5s);
			$("#login_form").ajaxSubmit({
				"success" : function(data) {
					if (data.state == 'success') {
						window.location.href = data.message;
					} else {
						alert(data.message);
						user_passwordObj.val("");
					}
				}
			});
		});
	});
	document.onkeydown = function(e) {
		e = e || window.event;
		var keycode = e.which ? e.which : e.keyCode;
		if (keycode == 13) {// Enter
			jQuery('#login_btn').click();
		}
		if (keycode == 27) {// Esc
			var username = jQuery('input[name="username"]');
			var password = jQuery('input[name="password"]');
			username.val("");
			password.val("");
		}
	}
</script>
</head>
<body>
<body>
	<div class="login_wraper">
		<div class="login_left"></div>
		<form id="login_form" action="${basePath}/login"
			method="post">
			<div class="login">
				<ul class="content">
					<li>工&nbsp;&nbsp;&nbsp;号：&nbsp;<input name="username"
						type="text" id="username"
						style="width: 150px; padding: 3px 5px; border: #82BBD9 solid 1px;"
						value="" />
					</li>
					<li>密&nbsp;&nbsp;&nbsp;码：&nbsp;<input name="password"
						type="password" id="password"
						style="width: 150px; padding: 3px 5px; border: #82BBD9 solid 1px;"
						value="" />
					</li>
				</ul>
			</div>
		</form>
		<div id="login_btn" class="login_right" style="cursor: pointer;">
			<p class="btn">
				<a href="javascript:void(0)" class="blue24" target="_self">登录</a>
			</p>
		</div>
	</div>
</body>

</html>