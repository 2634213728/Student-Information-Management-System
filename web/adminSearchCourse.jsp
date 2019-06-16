<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.wenr.model.*" %>
<jsp:useBean id="courseDao" class="com.wenr.dao.CourseDao" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>管理员登录</title>
	<!--meta标签："keywords" 是一个经常被用到的名称。
    它为文档定义了一组关键字。某些搜索引擎在遇到这些关键字时，
    会用这些关键字对文档进行分类。
    如果没有提供 name 属性，那么名称/值对中的名称会采用 http-equiv 属性的值。
    content 属性提供了名称/值对中的值。该值可以是任何有效的字符串。
    content 属性始终要和 name 属性或 http-equiv 属性一起使用。
    -->
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
		table {
			border-collapse:collapse;
			margin:0px auto;
			text-align:center;
			font-size:1.2em;
		}
		p {
			font-size:1.2em;
			text-align:center;
		}
	</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<script type="text/javascript" language="javascript">
	<!--
	function confirmAct()
	{
		if(confirm('确定要执行删除操作吗?'))
		{
			return true;
		}
		return false;
	}
	//-->
</script>
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
				<span>管理员</span>
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
						<li><a href="adminMain.jsp">编辑资料</a></li>
						<li><a href="adminMain.jsp">账号设置</a></li>
						<li><a href="adminMain.jsp">帮助</a></li>
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
			<li class="current"><a href="adminMain.jsp"><span class="icon icon-flatscreen"></span>首页</a></li>
			<li><a href="adminSearchStudent.jsp"><span class="icon icon-pencil"></span>学生管理</a></li>

			<li><a href="adminSearchCourse.jsp"><span class="icon icon-chart"></span>课程信息</a></li>
			<li><a href="teacherMain.jsp"><span class="icon icon-message"></span>系统帮助</a></li>
		</ul>
	</div>
	<div class="vernav2 iconmenu">
		<ul>

			<li><a href="adminSearch.jsp" class="elements">信息查找</a></li>
			<li><a href="adminAddGrade.jsp" class="widgets">成绩录入</a></li>
			<li><a href="adminAddStudent.jsp" class="calendar">添加学生</a></li>
			<li><a href="adminAddCourse.jsp" class="support">添加课程</a></li>
			<li><a href="adminSearchStudent.jsp" class="tables">查看所有学生</a></li>
			<li><a href="adminSearchCourse.jsp" class="typo">查看所有课程</a></li>
			<li><a href="#addons" class="addons">其他页面</a>
				<span class="arrow"></span>
				<ul id="addons">
					<li><a href="http://www.hnust.edu.cn">学校官网</a></li>
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
		<h3>查看课程</h3>
		<br>
		<table width="90%" class="table">
			<tr>
				<td>课程号</td>
				<td>课程名</td>
				<td>学分</td>
				<td>更新</td>
				<td>删除</td>
			</tr>
			<%
				int cutpage = 1;
				final int cntPrePage = 7;
				if (request.getParameter("cutpage") != null) {
					cutpage = Integer.parseInt(request.getParameter("cutpage"));
				}
				String[] color = {"#D3D3D3", "#DEB887"};
				ArrayList<Course> list = (ArrayList<Course>)courseDao.getAllCourse();
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
				<td><a href="adminUpdateCourse.jsp?cid=<%=course.getCid() %>">更新</a></td>
				<td><a href="servlet/AdminServlet?action=delete&cid=<%=course.getCid() %>" onclick="javascript:return confirmAct()">删除</a></td>
			</tr>

			<%
					}
				}
			%>
		</table>
		<p><a href="adminSearchCourse.jsp?cutpage=<%=prepage%>">[上一页]</a>
			&nbsp;(<%=cutpage %>/<%=(count-1)/cntPrePage+1 %>)&nbsp;
			<!--&nbsp表示空格。是javascript里面的转义字符！-->
			<a href="adminSearchCourse.jsp?cutpage=<%=nxtpage%>">[下一页]</a></p>

	</div>
	<!--one_third last-->

</div>
<!--contentwrapper-->
</body>

</html>
