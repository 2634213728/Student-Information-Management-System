<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.wenr.model.*,com.wenr.dao.*" %>
<jsp:useBean id="studentDao" class="com.wenr.dao.StudentDao" />
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
        a{color:#00F}

        a:hover{color:#f00}
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
    </style>
</head>

<body class="withvernav">
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=UTF-8");
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
    <div class="centercontent">
        <table width="90%" class="table">
            <tr>
                <td>学 号</td>
                <td>密 码</td>
                <td>名 字</td>
                <td>科 目</td>
                <td>分 数</td>
                <td>性 别</td>
                <td>生 日</td>
                <td>个人中心</td>
                <td>信息修正</td>
            </tr>
            <%
                String[] color = {"#D3D3D3", "#DEB887"};
                //String a =studentDao.getSid();
                Student student1 = new Student();
                try{
                if("sid".equals(request.getParameter("credit"))){
                    student1.setSid(Integer.parseInt(request.getParameter("note")));
                    ArrayList<Student> list = (ArrayList<Student>)studentDao.SearchID(student1);
                    if (list != null && list.size() > 0) {
                        for (int i = 0; i < list.size(); i++) {
                            Student student = list.get(i);
            %>
            <tr bgcolor="<%=color[i%2] %>">
                <td><%=student.getSid() %></td>
                <td><%=student.getSpwd() %></td>
                <td><%=student.getSname() %></td>
                <td><%=student.getCla() %></td>
                <td><%=student.getGrade() %></td>
                <td><%=student.getSex() %></td>
                <td><%=student.getBri() %></td>
                <td><a href="adminUpdate.jsp?sid=<%=student.getSid() %>&sname=<%=student.getSname() %>&sgrade=<%=student.getGrade() %>&sclass=<%=student.getCla() %>">个人中心</a></td>
                <td><a href="adminUpdate2.jsp?sid=<%=student.getSid() %>&sname=<%=student.getSname() %>&ssex=<%=student.getSex() %>&sbri=<%=student.getBri() %>">信息修正</a></td>
            </tr>
            <%
                    }
                }
                    else{
                        %>
                        <script type="text/javascript">
                                alert("本系统尚未录入该信息！");
                        window.location.href ="adminSearch.jsp";
            </script>
            <%
                    }
            }
            else{
                student1.setSname(request.getParameter("note"));
                ArrayList<Student> list = (ArrayList<Student>)studentDao.SearchName(student1);
                if (list != null && list.size()> 0) {
                    for (int i = 0; i < list.size(); i++) {
                        Student student = list.get(i);
            %>
            <tr bgcolor="<%=color[i%2] %>">
                <td><%=student.getSid() %></td>
                <td><%=student.getSpwd() %></td>
                <td><%=student.getSname() %></td>
                <td><%=student.getCla() %></td>
                <td><%=student.getGrade() %></td>
                <td><%=student.getSex() %></td>
                <td><%=student.getBri() %></td>
                <td><a href="adminUpdate.jsp?sid=<%=student.getSid() %>&sname=<%=student.getSname() %>&sgrade=<%=student.getGrade() %>&sclass=<%=student.getCla() %>">个人中心</a></td>
                <td><a href="adminUpdate2.jsp?sid=<%=student.getSid() %>&sname=<%=student.getSname() %>&ssex=<%=student.getSex() %>&sbri=<%=student.getBri() %>">信息修正</a></td>
            </tr>

            <%
                        }
                    }
                    else{
            %>
            <script type="text/javascript">
                alert("本系统尚未录入该信息！");
                window.location.href ="adminSearch.jsp";
            </script>
            <%
                    }
                }
                }catch (Exception ex) {
                    response.sendRedirect(path + "/errorPage.jsp");
                    return ;
                }
            %>
        </table>

    </div>
    <!--one_third last-->

</div>
<!--contentwrapper-->
</body>

</html>