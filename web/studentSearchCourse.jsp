<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.wenr.model.*,com.wenr.dao.*" %>
<jsp:useBean id="courseDao" class="com.wenr.dao.CourseDao" />
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
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");
	//out.print("("+request.getAttribute("course")+")");
%>
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


	<!--one_third last-->
		<br>
	<h3>查看课程</h3>
		<br>
	<form action="servlet/StudentServlet?action=lookup" method="post">
		输入要查询的课程名：<input type="text" name="course" value="" />
		<input type="submit" value="搜索">
	</form>
		<br>

	<table width="90%" class="table">
		<tr>
			<td>课程号</td>
			<td>课程名</td>
			<td>学分</td>
			<td>操作</td>
		</tr>

		<%
			int cutpage = 1;
			final int cntPrePage = 7;
			if (request.getParameter("cutpage") != null) {
				cutpage = Integer.parseInt(request.getParameter("cutpage"));
			}
			String[] color = {"yellow", "green"};

			Student student = (Student)session.getAttribute("student");
			ArrayList<Course> list = (ArrayList<Course>)request.getAttribute("courseList");
			int count = list.size();
			int prepage = cutpage - 1;
			int nxtpage = cutpage + 1;
			if (prepage <= 0) prepage = 1;
			if (cutpage * cntPrePage >= count) nxtpage = cutpage;

			if (list != null && list.size() > 0) {
				for (int i = (cutpage-1)*cntPrePage; i < cutpage*cntPrePage && i < count; i++) {
					Course course = list.get(i);
		%>
		<tr bgcolor="<%=color[i%2] %>" >
			<td><%=course.getCid() %></td>
			<td><%=course.getCname() %></td>
			<td><%=course.getCredit() %></td>
			<td><a href="servlet/StudentServlet?action=select&cid=<%=course.getCid()%>&cutpage=<%=cutpage %>">选课</a></td>
		</tr>

		<%
				}
			}
		%>
	</table>
	<p><a href="servlet/StudentServlet?action=lookup&cutpage=<%=prepage%>&course=<%=request.getAttribute("course") %>">[上一页]</a>
		&nbsp;(<%=cutpage %>/<%=(count-1)/cntPrePage+1 %>)&nbsp;
		<a href="servlet/StudentServlet?action=lookup&cutpage=<%=nxtpage%>&course=<%=request.getAttribute("course") %>">[下一页]</a></p>
</div>
</div>
<!--contentwrapper-->
</body>

</html>
