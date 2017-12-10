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
    <title>校园二手书交易</title>
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

<%--<!-- Site wrapper -->--%>
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

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <a type="button" class="btn btn-info" href="<%=request.getContextPath()%>/user/getMyOrder">自己的订单</a>
                    <a type="button" class="btn btn-info" href="<%=request.getContextPath()%>/book/salePage">卖书去</a>
                    <c:if test="${isLogin=='notLogin'}">
                        <a type="button" class="btn btn-info" href="<%=request.getContextPath()%>/user/loginPage">登录</a>
                    </c:if>
                    <c:if test="${isLogin=='Login'}">
                        <a type="button" class="btn btn-info" href="<%=request.getContextPath()%>/user/logOut">登出</a>
                    </c:if>
                </ul>
            </div>
        </nav>
    </header>

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
            <a type="button" class="btn btn-danger" onclick="showChoose()" >目录选择</a>
            <div class="box-body" style="display: none;"  id="chooseType">
                    <form action="/book/search" method="post">
                        <select name="typeList" id="typeList" >
                            <option value="">请选择</option>
                        </select>
                        <input type="submit" class="btn btn-danger" value="查询">
                    </form>
            </div>

            <div class="box box-info">
                <div class="box-body" style="display: block;">
                    <div class="table-responsive">
                        <table class="table no-margin">
                            <thead>
                            <tr>
                                <th>订单状态</th>
                                <th>订单描述</th>
                                <th>价格</th>
                                <th>手机</th>
                                <th>收货人</th>
                                <th>收货地址</th>
                                <th>数量</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${orderList}">
                                <tr>
                                    <td>${user.orderStatus}</td>
                                    <td>${user.description}</td>
                                    <td>${user.price}</td>
                                    <td>${user.telephone}</td>
                                    <td>${user.name}</td>
                                    <td>${user.targetAddress}</td>
                                    <td>${user.bookNum}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                    <div class="col-sm-offset-7 col-sm-5">
                        <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                            <ul class="pagination">
                                <c:if test="${pageNo==0}" >
                                    <li class="paginate_button previous disabled" id="example2_previous">
                                        <a aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a>
                                    </li>
                                </c:if>
                                <c:if test="${pageNo!=0}" >
                                    <li class="paginate_button previous" id="example2_previous">
                                        <a href="accusationPage?pageNo=${pageNo-1}" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a>
                                    </li>
                                </c:if>
                                <c:if test="${accusations.size()<5}" >
                                    <li class="paginate_button next disabled" id="example2_next">
                                        <a aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a>
                                    </li>
                                </c:if>
                                <c:if test="${accusations.size()>=5}" >
                                    <li class="paginate_button next" id="example2_next">
                                        <a href="accusationPage?pageNo=${pageNo+1}" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>
<div class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                        onclick="closeModel()">&times;</button>
            </div>
            <div class="modal-body">
                <img id="imgInModalID" style="width:100%;height: auto;max-height: 800px;">
            </div>
        </div>
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

    function showChoose() {
        $("#chooseType").show();
        locationChange();
    }
    function showimage(source) {
        $("#imgInModalID").attr("src", source);
        $('.modal').show();
    }
    function closeModel() {
        $('.modal').hide();
    }


    function locationChange() {
        var type = "";
        var obj = document.getElementById('typeList');
        obj.options.length = 0;
        obj.add(new Option("请选择", ""));
        $.ajax({
            type: "post",
            url: "/book/getParentTypeList",
            cache: false,
            data: {type: type},
            dataType: "json",
            success: function (result) {
                if (result.length > 0) {
                    obj.add(new Option("请选择", ""));
                    for (var i in result) {
                        var selectOption = new Option(result[i].name, result[i].id);
                        obj.add(selectOption);
                    }
                }
            }
        });

    }
</script>
</body>
</html>
