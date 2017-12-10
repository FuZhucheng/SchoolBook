<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xjk
  Date: 17-3-14
  Time: 上午8:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>校园二手交易 | 后台管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/bootstrap.min.css'>
    <!-- Font Awesome -->
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/font-awesome.min.css'>
    <!-- Ionicons -->
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/ionicons.min.css'>
    <!-- Theme style -->
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/AdminLTE.min.css'>
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/zoom.css'>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/_all-skins.min.css'>
    <link rel="shortcut icon" href='<%=request.getContextPath()%>/img/favicon.ico' type="image/x-icon">
    <link rel="Bookmark" href='<%=request.getContextPath()%>/img/favicon.ico'>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">

<!-- Site wrapper -->
<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>校园二手书交易</b></span>
            <!-- logo for regular state and Jianyumobile devices -->
            <span class="logo-lg"><b>校园二手书交易</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <a type="button" class="btn btn-info" href="<%=request.getContextPath()%>/backend/logOut">登出</a>
                </ul>
            </div>
        </nav>
    </header>
    <!-- =============================================== -->
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <c:if test="${msg!=null}">
            <div class="alert alert-success">
                <a class="close" data-dismiss="alert">×</a>
                <strong>${msg}</strong>
            </div>
        </c:if>
        <!-- Main content -->
        <section class="content">
            <div class="box box-info">
                <div class="box-body" style="display: block;">
                        用户ID：<input name="id" value="${user.id}"/>
                        <br/>
                        用户账号：<input name="name" value="${user.name}"/>
                        <br/>
                        用户账号：<input name="account" value="${user.account}"/>
                        <br/>
                        密码：<input name="password" value="${user.password}"/>
                        <br/>
                        国家：<input name="country" value="${user.country}"/>
                        <br/>
                        省份：<input name="province" value="${user.province}"/>
                        <br/>
                        城市：<input name="city" value="${user.city}"/>
                        <br/>
                        性别：<input name="sex" value="${user.sex}"/>
                        <br/>
                        权限：<input name="roleId" value="${user.roleId}"/>
                </div>
                <!-- /.box-body -->
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>
<!-- ./wrapper -->
<!-- jQuery 2.2.0 -->
<script src='<%=request.getContextPath()%>/js/jquery-2.2.3.min.js'></script>
<!-- Bootstrap 3.3.6 -->
<script src='<%=request.getContextPath()%>/js/bootstrap.min.js'></script>
<!-- SlimScroll -->
<script src='<%=request.getContextPath()%>/js/jquery.slimscroll.min.js'></script>
<!-- FastClick -->
<script src='<%=request.getContextPath()%>/js/fastclick.js'></script>
<!-- AdminLTE App -->
<script src='<%=request.getContextPath()%>/js/app.min.js'></script>
<!-- AdminLTE for demo purposes -->
<script src='<%=request.getContextPath()%>/js/demo.js'></script>

<script src='<%=request.getContextPath()%>/js/zoom.js'></script>

<script src='<%=request.getContextPath()%>/js/transition.js'></script>

<script>
    function showimage(source) {
        $("#imgInModalID").attr("src", source);
        $('.modal').show();
    }
    function closeModel() {
        $('.modal').hide();
    }
</script>
</body>
</html>
