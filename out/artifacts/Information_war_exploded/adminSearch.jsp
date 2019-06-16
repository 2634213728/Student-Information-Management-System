<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.wenr.model.*,com.wenr.dao.*" %>
<jsp:useBean id="studentDao" class="com.wenr.dao.StudentDao" />
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

<head>
    <base href="<%=basePath%>">
    <title>管理员登录</title>
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
        table {
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }

        table td,
        table th {
            border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
        }

        table thead th {
            background-color: #CCE8EB;
            width: 100px;
        }

        table tr:nth-child(odd) {
            background: #fff;
        }

        table tr:nth-child(even) {
            background: #F5FAFA;
        }
    </style>
</head>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=UTF-8");
%>

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
                    <li><a href="newsfeed.html">新闻订阅</a></li>
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
    <div class="centercontent" align="center"  >
        <br>
        <h3>信息查找</h3>
        <br>
        <div style="font-size:15px">
            <form action="Search.jsp" method="get">
                <p><span>查找元素：
              <select name="credit">
                <option value="sid">学生学号</option>
                <option value="sname">学生姓名</option>
              </select>
                <p>&nbsp;</p>
                <p>
                    <label>&nbsp;&nbsp;&nbsp;&nbsp;内&nbsp;容&nbsp;：&nbsp;</label>
                    <span class="field"><input type="text" name="note" required="required" class="smallinput" /></span>
                <p>&nbsp;</p>
                </p>
                <input id="sub" type="submit" value="确认">
            </form>
        </div>


    </div>
    <!--one_third last-->

</div>
<!--contentwrapper-->
</body>

</html>
