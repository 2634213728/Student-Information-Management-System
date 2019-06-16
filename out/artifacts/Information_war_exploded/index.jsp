<%@ page language="java" import="java.util.*"
		 contentType="text/html; charset=utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<base href="<%=basePath%>">
	<title>学生成绩管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->
	<link rel="stylesheet" href="css/style.default.css" type="text/css" />
	<script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="js/plugins/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/custom/general.js"></script>
	<script type="text/javascript" src="js/custom/index.js"></script>
</head>
<%
	//从cookies中读取历史数据
	request.setCharacterEncoding("utf-8");
	String inumber = "";
	String password = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (Cookie c: cookies) {
			if ("inumber".equals(c.getName())) {
				inumber = c.getValue();
			}
			if ("password".equals(c.getName())) {
				password = c.getValue();
			}
		}
	}
%>

<body class="loginpage">
<div id="login" class="loginbox">
	<div class="loginboxinner">
		<div class="logo">
			<h1 class="logo">学生成绩<span>管理</span></h1>
			<span class="slogan">后台管理系统</span>
		</div>
		<!--logo-->
		<form action="servlet/LoginServlet?action=login" method="post">
			<!-- required表示该字段必填 -->
			<div class="username">
				<div class="usernameinner">
					<input class="input" type="text" placeholder="账号" required="required" name="inumber" value="<%=inumber %>" />
				</div>
			</div>

			<div class="password">
				<div class="passwordinner">
					<input class="input" type="password" placeholder="密码" required="required" name="password" value="<%=password%>" />
				</div>
			</div>
			<p align="right"><label style="color:white">选择登录身份：</label>
				<select name="identity">
					<option value="admin">教师</option>
					<option value="student">学生</option>
				</select>
			</p>

			<div class="keep"><input type="checkbox" name="isUseCookie" checked="checked" /> 记住密码</div>
			<p id="button"><button type="submit">登录</button></p>
		</form>
	</div>
</div>
<!--粒子特效插件部分-->
<script src="js/canvas-nest.js" type="text/javascript" color="	0,0,0" opacity="0.8" count="300"></script>
</body>

</html>
