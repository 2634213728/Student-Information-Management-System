<%@ page language="java" import="java.util.*,java.lang.*" contentType="text/html; charset=utf-8"%>
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
            text-align:center;
            font-size:1.5em;
        }
    </style>
    <script language="JavaScript" type="text/javascript">
        var idTmr;
        function getExplorer() {
            var explorer = window.navigator.userAgent;
            if (explorer.indexOf("MSIE") >= 0 || (explorer.indexOf("Windows NT 6.1;") >= 0 && explorer.indexOf("Trident/7.0;") >= 0)) {
                return 'ie';   //ie
            }
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';  //firefox
            }
            else if (explorer.indexOf("Chrome") >= 0) {
                return 'Chrome'; //Chrome
            }
            else if (explorer.indexOf("Opera") >= 0) {
                return 'Opera';  //Opera
            }
            else if (explorer.indexOf("Safari") >= 0) {
                return 'Safari';   //Safari
            }
        }

        //此方法为ie导出之后,可以保留table格式的方法
        function getIEsink(tableid) {
            var curTbl = document.getElementById(tableid);
            if (curTbl == null || curTbl == "") {
                alert("没有数据");
                return false;
            }
            var oXL;
            try {
                oXL = new ActiveXObject("Excel.Application"); //创建AX对象excel
            } catch (e) {
                alert("无法启动Excel!\n\n如果您确信您的电脑中已经安装了Excel，" + "那么请调整IE的安全级别。\n\n具体操作：\n\n" + "工具 → Internet选项 → 安全 → 自定义级别 → 对没有标记为安全的ActiveX进行初始化和脚本运行 → 启用");
                return false;
            }

            var oWB = oXL.Workbooks.Add();
            var oSheet = oWB.ActiveSheet;
            var sel = document.body.createTextRange();
            sel.moveToElementText(curTbl);
            sel.select();
            sel.execCommand("Copy");
            oSheet.Paste();
            oXL.Visible = true;
        }

        //此方法为ie导出之后,不保留table格式的方法
        function getIEnotsink(tableid) {
            var curTbl = document.getElementById(tableid);
            if (curTbl == null || curTbl == "") {
                alert("没有数据");
                return false;
            }
            var oXL;
            try {
                oXL = new ActiveXObject("Excel.Application"); //创建AX对象excel
            } catch (e) {
                alert("无法启动Excel!\n\n如果您确信您的电脑中已经安装了Excel，" + "那么请调整IE的安全级别。\n\n具体操作：\n\n" + "工具 → Internet选项 → 安全 → 自定义级别 → 对没有标记为安全的ActiveX进行初始化和脚本运行 → 启用");
                return false;
            }

            var oWB = oXL.Workbooks.Add();
            var oSheet = oWB.ActiveSheet;
            var Lenr = curTbl.rows.length;
            for (i = 0; i < Lenr; i++) {
                var Lenc = curTbl.rows(i).cells.length;
                for (j = 0; j < Lenc; j++) {
                    oSheet.Cells(i + 1, j + 1).value = curTbl.rows(i).cells(j).innerText;
                }
            }
            oXL.Visible = true;
        }
        function getImport(tableid) {
            if (getExplorer() == 'ie') {
                getIEnotsink(tableid);
            }
            else {
                tableToExcel(tableid);
            }
        }
        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
        var tableToExcel = (function () {
            var uri = 'data:application/vnd.ms-excel;base64,',
                template = '<html><head><meta charset="UTF-8"></head><body><table border="1">{table}</table></body></html>',
                base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) },
                format = function (s, c) {
                    return s.replace(/{(\w+)}/g,
                        function (m, p) { return c[p]; })
                }
            return function (table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }
                window.location.href = uri + base64(format(template, ctx))
            }
        })()
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
        <br>
        <div align="center">
            <h3>学生成绩报告单</h3>
            <br>
        </div>
        <%
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=UTF-8");
            int sid =Integer.parseInt(request.getParameter("sid"));
            String sname =request.getParameter("sname");
            String ssex =request.getParameter("ssex");
            String sbri =request.getParameter("sbri");
            Student student1 = new Student();
            student1.setSid(sid);
            int a[] = new int[4];
            int num1=0;
            float num=0;

            float a1[] = new float[4];
            int i = 0;
            String b[]=new String[4];
            ArrayList<Student> list = (ArrayList<Student>)studentDao.SearchID(student1);
            if (list != null && list.size() > 0) {
                //int i = 0;
                for (; i < list.size(); i++) {
                    Student student = list.get(i);
                    a[i] = student.getGrade();
                    b[i] = student.getCla();
                    num1+=a[i];
                }
                num=num1/i;
            }
            String cname[]= new String[]{"Java","大学数学","大学英语","大学体育"};
            for (int p=0;p<4;p++) {
                ArrayList<Student> list1 = (ArrayList<Student>) studentDao.SearchGrade(cname[p]);
                int q=0;
                if (list1 != null && list1.size() > 0) {
                    for (; q < list1.size(); q++) {
                        Student student = list1.get(q);
                        a1[p] += student.getGrade();
                    }
                }
                a1[p]=a1[p]/q;
            }
        %>


        <table border="1px" cellspacing="0px" id="tableExcel">
            <tr>
                <td colspan="<%=i+11%>" align="center">成绩</td>
            </tr>
            <tr>
                <!-- 可以使用rowspan和colspan来合并单元格 -->

                <th rowspan="2">学号</th>
                <th rowspan="2">姓名</th>
                <th rowspan="2">性别</th>

                <th colspan="<%=i%>">个人成绩</th>
                <th colspan="4">班级平均成绩</th>
                <th colspan="2">总分</th>
                <th colspan="2">平均分</th>
            </tr>
            <tr>
                <%
                    int j=0;
                    for(;j<i;j++){
                %>
                <th><%=b[j]%></th>
                <%
                    }
                %>
                <th>Java</th>
                <th>大学数学</th>
                <th>大学英语</th>
                <th>大学体育</th>
                <th>个人</th>
                <th>班级</th>
                <th>个人</th>
                <th>班级</th>
            </tr>
            <tr>
                <td><%=sid%></td>
                <td><%=sname%></td>
                <td><%=ssex%></td>

                <%
                    int j1=0;
                    for(;j1<i;j1++){
                %>
                <th><%=a[j1]%></th>
                <%
                    }
                %>


                <%
                    for(int q=0;q<4;q++){
                %>
                <th><%out.println(String.format("%.2f", a1[q]));%></th>
                <%
                    }
                %>

                <td><%=num1%></td>
                <td><%out.println(String.format("%.2f", a1[0]+a1[1]+a1[2]+a1[3]));%></td>

                <td><%=num%></td>
                <td><%out.println(String.format("%.2f", (a1[0]+a1[1]+a1[2]+a1[3])/4));%></td>
            </tr>

        </table>
        <p></p>
        <br>
        <br>
        <div align="center">
            <input type="button" value="导出成EXCEL文档" onclick="getImport('tableExcel')" />
        </div>



    </div>
    <!--one_third last-->

</div>
<!--contentwrapper-->
</body>

</html>
