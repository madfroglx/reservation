<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${basePath}/roof-web/web/user/js/jmenu/menu.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/roof-web/css/style.css" />
<script type="text/javascript" src="${basePath }/roof-web/web/user/js/jmenu/jquery.js"></script>
<title></title>
<script type="text/javascript" src="${basePath }/roof-web/web/user/js/user_goMain.js"></script>
<script type="text/javascript">
	var menudate = ${menuJson};
	var basePath = "${basePath}";
</script>
<script type="text/javascript" src="${basePath }/roof-web/web/user/js/jmenu/menu.js"></script>
</head>
<body>
	<div id="menu" style="width: 99%">
		<ul class="menu" style="width: 100%">
		</ul>
	</div>
	<div style="width: 100%; height: 100%; float: left;">
		<iframe name="_mainFrame" src="${basePath }/roof-web/web/index.jsp" frameborder="0" scrolling="auto" width="100%"></iframe>
	</div>
	<div id="copyright" style="display:none;">
		Copyright &copy; 2012 <a href="http://apycom.com/">Apycom jQuery Menus</a>
	</div>
</body>
</html>