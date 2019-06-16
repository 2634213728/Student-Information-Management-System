<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.wenr.model.*,com.wenr.dao.StudentDao" %>
<%@ page import="com.wenr.dao.CourseDao" %>
<jsp:useBean id="studentDao" class="com.wenr.dao.StudentDao" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<base href="<%=basePath%>">

	<title>学生登录</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style.default.css" type="text/css" />
	<script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
	<script type="text/javascript" src="js/plugins/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/plugins/jquery.uniform.min.js"></script>
	<script type="text/javascript" src="js/plugins/jquery.flot.min.js"></script>
	<script type="text/javascript" src="js/plugins/jquery.flot.resize.min.js"></script>
	<script type="text/javascript" src="js/plugins/jquery.slimscroll.js"></script>
	<script type="text/javascript" src="js/custom/general.js"></script>
	<script type="text/javascript" src="js/custom/dashboard.js"></script>
	<style type="text/css">

		a{color:#00F}

		a:hover{color:#f00}
		table
		{
			border-collapse: collapse;
			margin: 0 auto;
			text-align: center;
		}
		table td, table th
		{
			border: 1px solid #cad9ea;
			color: #666;
			height: 30px;
		}
		table thead th
		{
			background-color: #CCE8EB;
			width: 100px;
		}
		table tr:nth-child(even)
		{
			background: #fff;
		}
		table tr:nth-child(odd)
		{
			background: #F5FAFA;
		}
		table tr:nth-of-type(1){
			background: #BEBEBE;
		}
		p {
			font-size:1.2em;
			text-align:center;
		}
	</style>
</head>

<body class="withvernav">
<div class="bodywrapper">
	<div class="topheader">
		<div class="left">
			<h1 class="logo">学生信息<span>统计</span></h1>
			<span class="slogan">后台管理系统</span>
			<br clear="all" />

		</div>
		<!--left-->

		<div class="right">
			<!--<div class="notification">
                    <a class="count" href="ajax/notifications.html"><span>9</span></a>
                </div>-->
			<div class="userinfo">
				<img src="images/thumbs/avatar.png" alt="" />
				<span><%=((Student)session.getAttribute("student")).getSname()%></span>
			</div>
			<!--userinfo-->

			<div class="userinfodrop">
				<div class="avatar">
					<a href=""><img src="images/thumbs/avatarbig.png" alt="" /></a>
					<div class="changetheme">
						切换主题: <br />
						<a class="default"></a>
						<a class="blueline"></a>
						<a class="greenline"></a>
						<a class="contrast"></a>
						<a class="custombg"></a>
					</div>
				</div>
				<!--avatar-->
				<div class="userdata">
					<h4>Genius</h4>
					<span class="email">gneius.zeng@qq.com </span>
					<ul>
						<li><a href="studentMain.jsp">编辑资料</a></li>
						<li><a href="studentMain.jsp">账号设置</a></li>
						<li><a href="studentMain.jsp">帮助</a></li>
						<li><a href="servlet/LoginServlet?action=logout">退出登录</a></li>
					</ul>
				</div>
				<!--userdata-->
			</div>
			<!--userinfodrop-->
		</div>
		<!--right-->
	</div>
	<!--topheader-->
	<div class="header">
		<ul class="headermenu">
			<li class="current"><a href="studentMain.jsp"><span class="icon icon-flatscreen"></span>首页</a></li>

			<li><a href="adminSearchCourse.jsp"><span class="icon icon-chart"></span>课程信息</a></li>
			<li><a href="teacherMain.jsp"><span class="icon icon-message"></span>系统帮助</a></li>
		</ul>
	</div>
	<div class="vernav2 iconmenu">
		<ul>

			<li><a href="servlet/StudentServlet?action=lookup">学生选课</a></li>
			<li><a href="studentSelected.jsp">已选课程</a></li>
			<li><a href="#addons" class="addons">其他页面</a>
				<span class="arrow"></span>
				<ul id="addons">
					<li><a href="errorPage.jsp">删库跑路</a></li>
					<li><a href="servlet/LoginServlet?action=logout">退出登录</a></li>
				</ul>
			</li>
		</ul>
		<a class="togglemenu"></a>
		<br /><br />
	</div>
	<!--topheader工作区-->
	<!--topheader工作区-->
	<!--topheader工作区-->
	<!--topheader工作区-->
	<div class="centercontent" align="center">
		<br>
		<h3>已选课程</h3>
		<br>
		<table width="90%" class="table">
			<tr>
				<td>课程号</td>
				<td>课程名</td>
				<td>学分</td>
				<td>成绩</td>
				<td>操作</td>
			</tr>
			<%
				String[] color = {"yellow", "green"};
				Student student = (Student)session.getAttribute("student");
				//B/S架构中,客户端与服务器连接,在服务端就会自动创
				// 建一个session对象. session.setAttribute("username",username); 是将username保存在sessio
				// n中！session的key值为“username”value值就是username真实的值，或者引用值. 这样以
				// 后你可以通过session.getAttribute("username")的方法获得这个对
				// 象. 比如说,当用户已登录系统后你就在session中存储
				// 了一个用户信息对象,此后你可以随时从session中将这个对象取出来进行一些操作,比如进行身 份验证等等.
				ArrayList<Course> list = studentDao.getSelectedCourse(student);
				for (int i = 0; i < list.size(); i++) {
					Course course = list.get(i);
			%>
			<tr bgcolor="<%=color[i%2] %>" >
				<td><%=course.getCid() %></td>
				<td><%=course.getCname() %></td>
				<td><%=course.getCredit() %></td>
				<!-- 如何把为null的成绩不显示出来？？ 窝偷偷把默认成绩改成了-1 感觉不太好-- -->
				<td><%=course.getScore()<0?"":course.getScore() %></td>
				<td><a href="servlet/StudentServlet?action=delete&cid=<%=course.getCid() %>">删除</a></td>
			</tr>

			<%
				}
			%>

		</table>
	</div>
	<!--one_third last-->

</div>
<!--contentwrapper-->
</body>

</html>
