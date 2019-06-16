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
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
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
    </style>
    <script src="https://code.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/data.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
</head>

<body class="withvernav">
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=UTF-8");
    int sid =Integer.parseInt(request.getParameter("sid"));
    String sname =request.getParameter("sname");
    int sgrade =Integer.parseInt(request.getParameter("sgrade"));

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
    <div class="centercontent" align="center">
        <br>
        <h3><%=sname %>的信息中心</h3>
        <br>
        <p><label>学号： <%=sid %></label></p>
        <p><label>名字： <%=sname %></label></p>
        <table border="1px" cellspacing="0px" id="datatable">
            <thead>
            <tr>
                <td>科 目</td>
                <td>分 数</td>
            </tr>
            </thead>
            <tbody>
            <%
                try{
                String[] color = {"#D3D3D3", "#DEB887"};
                //String a =studentDao.getSid();
                Student student1 = new Student();
                student1.setSid(sid);
                int a[] = new int[4];
                String b[]=new String[5];
                ArrayList<Student> list = (ArrayList<Student>)studentDao.SearchID(student1);
                if (list != null && list.size() > 0) {
                    int i = 0;
                    for (; i < list.size(); i++) {
                        Student student = list.get(i);
                        a[i]=student.getGrade();
                        b[i] = student.getCla();
            %>
            <tr bgcolor="<%=color[i%2] %>">
                <td><%=student.getCla() %></td>
                <td><%=student.getGrade() %></td>
            </tr>
            <%
                    }
                }
                }catch (Exception ex) {
                    response.sendRedirect(path + "/errorPage.jsp");
                    return ;
                }
            %>
            </tbody>
        </table>
        <br>
        <div id="container" style="min-width: 20px; height: 400px;width: 600px; margin: 0 auto"></div>
        <script>
            var chart = Highcharts.chart('container', {
                data: {
                    table: 'datatable'
                },
                chart: {
                    type: 'column'
                },
                title: {
                    text: '<%=sname%>的各科成绩柱状图'
                    // 该功能依赖 data.js 模块，详见https://www.hcharts.cn/docs/data-modules
                },
                yAxis: {
                    allowDecimals: false,
                    title: {
                        text: '成绩',
                        rotation: 0
                    }
                },
                tooltip: {
                    formatter: function () {
                        return '<b>' +'学号'+ <%=sid%> + '</b><br/>' +
                            this.point.name.toLowerCase()+this.point.y + ' 分' ;
                    }
                }
            });</script>
    </div>
    <!--one_third last-->

</div>
<!--contentwrapper-->
</body>

</html>
