<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.wenr.model.Student" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>管理员主页</title>
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
	<script>
	function myFunction(){
		alert("权限不足");
	}
</script>
	<script>
		function myFunction1(){
			alert("功能维修中");
		}
	</script>
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
						<li><a onclick="myFunction()">编辑资料</a></li>
						<li><a onclick="myFunction1()">账号设置</a></li>
						<li><a href="Help.jsp">帮助</a></li>
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
			<li><a  href="Help.jsp"><span class="icon icon-message"></span>系统帮助</a></li>
		</ul>
	</div>
	<!--header-->

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
					<li><a href="errorPage.jsp">删库跑路</a></li>
					<li><a href="servlet/LoginServlet?action=logout">退出登录</a></li>
				</ul>
			</li>
		</ul>
		<a class="togglemenu"></a>
		<br /><br />
	</div>
	<div class="centercontent">
		<div id="contentwrapper" class="contentwrapper">

			<div id="updates" class="subcontent">
				<div class="notibar announcement">
					<a class="close"></a>
					<h3>系统维护公告</h3>
					<p>按学校学籍异动办公室管理人员要求，完善下载/查看学生信息相关功能：<br>
						1、完善下载/查看预计毕业生信息功能，添加对休学学生的查询与下载<br>
						2、解决管理人员查询学生详细信息时，入学信息中“毕业中学”字样显示不准确问题，修改后按学生类别给予相应显示；<br>
						3、解决部分院系工作人员无法通过“院系查询学生信息”功能查询本院系学生信息问题。</p>
					<p>系统预计关闭时间：2019/6/23日16时整<br>
				</div><!-- notification announcement -->
			</div><!-- #updates -->
			<div class="widgetbox">
				<div class="title">
					<h3>其他信息</h3>
				</div>
				<div class="widgetcontent">
					<div id="accordion" class="accordion">
						<h3><a href="#">公告 1</a></h3>
						<div>
							<p>
								本次系统更新对学生注册管理信息系统做了如下更新： <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp1.调整学生学年第二学期入学的注册信息的显示，及补注册功能的调整； <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2.调整注册详情统计中新生数据的添加显示，并入统计； <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp3.调整班级报到注册一览表中新生已入学选项添加； <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4.调整留学生注册流程中界面样式及功能的补充完善； <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp5.调整留学生查询注册详情，补充个人信息中的界面说明，功能问题完善。<br>
							</p>
						</div>
						<h3><a href="#">公告 2</a></h3>
						<div>
							<p>
								本次系统更新对学生注册管理信息系统做了如下更新： <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp1、将研究生院管理人员审核“荣誉导师”字样修改为“专业学位兼职导师”； <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2、添加专业学位兼职导师申请导师时，工作年限信息的录入； <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp3、添加研究生院管理人员查看/下载各导师申请表功能； <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp4、添加研究生院管理人员及院系管理人员按要求的格式下载权限范围内专业学位兼职导师信息列表；
							</p>
						</div>
						<h3><a href="#">公告 3</a></h3>
						<div>
							<p>
								按研究生院管理人员要求，优化系统功能： <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp1、屏蔽学生打印时可复制界面内容功能； <br>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2、完善修改学生预计毕业年月流程： <br>
							</p>
							<ul class="margin1020">
								<li>学生申请修改预计毕业年月后，院系教务员审核通过后方可生效</li>
								<li>添加院系教务员通过一定条件查询本院系学生申请记录功能</li>
							</ul>
						</div>

					</div>
				</div>
				<!--widgetcontent-->
			</div>
			<!--widgetbox-->
		</div>
		<!--one_third last-->

	</div>
	<!--contentwrapper-->
</body>

</html>