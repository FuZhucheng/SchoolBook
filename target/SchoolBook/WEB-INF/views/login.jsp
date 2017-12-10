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
  <title>校园二手书交易系统 | 后台管理</title>
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
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href='<%=request.getContextPath()%>/css/_all-skins.min.css'>
  <link rel="shortcut icon" href='/img/favicon.ico' type="image/x-icon">
  <link rel="Bookmark" href='/img/favicon.ico'>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<c:if test="${error!=null }">
  <div class="alert alert-error">
    <a class="close" data-dismiss="alert">×</a>
    密码错误
  </div>
</c:if>
<div class="login-box">
  <div class="login-logo">
    <b>校园二手书交易系统</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">管理员登录</p>
    <form action="login" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="account" placeholder="账号">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="password" placeholder="密码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <!-- /.social-auth-links -->

    <!--<a href="#">I forgot my password</a><br>-->
    <!--<a href="register.html" class="text-center">Register a new membership</a>-->

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<script src="<%=request.getContextPath()%>/js/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>
