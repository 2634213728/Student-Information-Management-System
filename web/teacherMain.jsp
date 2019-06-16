<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <base href="<%=basePath%>">

    <title>错误页面</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/style.default.css" type="text/css" />
    <script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
    <script type="text/javascript" src="js/plugins/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/custom/general.js"></script>
    <!--[if IE 9]>
    <link rel="stylesheet" media="screen" href="css/style.ie9.css"/>
    <![endif]-->
    <!--[if IE 8]>
    <link rel="stylesheet" media="screen" href="css/style.ie8.css"/>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="js/plugins/css3-mediaqueries.js"></script>
    <![endif]-->
</head>

<body>
<div class="bodywrapper">
    <div class="topheader orangeborderbottom5">
        <div class="left">
            <h1 class="logo">学生信息<span>统计</span></h1>
            <span class="slogan">后台管理系统</span>


            <br clear="all" />

        </div>
        <!--left-->


        <!--right-->
    </div>
    <!--topheader-->


    <div class="contentwrapper padding10">
        <div class="errorwrapper error404">
            <div class="errorcontent">
                <h1>系统帮助</h1>
                <h3>系统版本说明</h3>
                <br>
                <ul>
                    <li>支持5G+</li>
                    <li>万物互联</li>
                    <li>量子通讯</li>
                    <li>AI架构</li>
                </ul>
                <br />
                <button class="stdbtn btn_black" onclick="history.back()">返回上一页</button> &nbsp;
                <a href="http://www.baidu.com.cn">
                    <button class="stdbtn btn_orange">获取帮助</button>
            </div>
            <!--errorcontent-->
        </div>
        <!--errorwrapper-->
    </div>


</div>
<!--bodywrapper-->

</body>

</html>
