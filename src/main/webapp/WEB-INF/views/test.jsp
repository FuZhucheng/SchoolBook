<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2017/11/29
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div >
    <table >
        <thead>
        <tr>
            <th>ID</th>
            <th>用户名</th>
            <th>头像</th>
            <th>国家</th>
            <th>省份</th>
            <th>城市</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <%--<c:if test="${empty user.name}">--%>
                    <%--<td>${String.format("%05d", user.id)}</td>--%>
                <%--</c:if>--%>
                <%--<c:if test="${not empty user.name}">--%>
                    <%--<td>${user.name}</td>--%>
                <%--</c:if>--%>
                <%--<c:if test="${empty user.avatar}">--%>
                    <%--<c:if test="${user.sex=='F'}">--%>
                        <%--<td><img src="<%=request.getContextPath()%>/img/defaultF.jpg" style="width: 45px;height: 80px;"--%>
                                 <%--onclick='showimage("<%=request.getContextPath()%>/img/defaultF.jpg")'/></td>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${user.sex=='M'}">--%>
                        <%--<td><img src="<%=request.getContextPath()%>/img/defaultM.jpg" style="width: 45px;height: 80px;"--%>
                                 <%--onclick='showimage("<%=request.getContextPath()%>/img/defaultM.jpg")'/></td>--%>
                    <%--</c:if>--%>
                    <%--<td><img src="<%=request.getContextPath()%>/img/defaultAva.png" style="width: 45px;height: 80px;"--%>
                    <%--onclick='showimage("<%=request.getContextPath()%>/img/defaultAva.png")'/></td>--%>
                <%--</c:if>--%>

                <%--<c:if test="${not empty user.avatar}">--%>
                    <%--<td><img src="${user.avatar}" style="width: 45px;height: 80px;"--%>
                             <%--onclick='showimage("${user.avatar}")'/></td>--%>
                <%--</c:if>--%>
                <td>${user.country}</td>
                <td>${user.province}</td>
                <td>${user.city}</td>
                <td>${user.city}</td>
                <td>${user.city}</td>
                    <%--<td>--%>
                    <%--<a type="button" class="btn btn-primary" href="deleteAvatar?pageNo=${pageNo}&uid=${user.accuseUserId}">删除头像</a>--%>
                    <%--<a type="button" class="btn btn-primary" href="deleteName?pageNo=${pageNo}&uid=${item.accuseUserId}">删除用户名</a>--%>
                    <%--<a type="button" class="btn btn-info" href="gag?pageNo=${pageNo}&uid=${item.accuseUserId}&day=1">禁言一天</a>--%>
                    <%--<a type="button" class="btn btn-warning" href="gag?pageNo=${pageNo}&uid=${item.accuseUserId}&day=7">禁言七天</a>--%>
                    <%--<a type="button" class="btn btn-danger" href="deleteAccusation?pageNo=${pageNo}&aid=${item.id}">删除</a>--%>
                    <%--</td>--%>
            </tr>
            <%--<tr>--%>
            <%--<td>${item.id}</td>--%>
            <%--<c:if test="${empty item.name}">--%>
            <%--<td>${String.format("%05d", item.id)}</td>--%>
            <%--</c:if>--%>
            <%--<c:if test="${not empty item.name}">--%>
            <%--<td>${item.name}</td>--%>
            <%--</c:if>--%>
            <%--<c:if test="${empty item.avatar}">--%>
            <%--<c:if test="${item.sex=='F'}">--%>
            <%--<td><img src="<%=request.getContextPath()%>/img/defaultF.jpg" style="width: 45px;height: 80px;"--%>
            <%--onclick='showimage("<%=request.getContextPath()%>/img/defaultF.jpg")'/></td>--%>
            <%--</c:if>--%>
            <%--<c:if test="${item.sex=='M'}">--%>
            <%--<td><img src="<%=request.getContextPath()%>/img/defaultM.jpg" style="width: 45px;height: 80px;"--%>
            <%--onclick='showimage("<%=request.getContextPath()%>/img/defaultM.jpg")'/></td>--%>
            <%--</c:if>--%>
            <%--</c:if>--%>
            <%--<c:if test="${not empty item.avatar}">--%>
            <%--<td><img src="${item.avatar}" style="width: 45px;height: 80px;"--%>
            <%--onclick='showimage("${item.avatar}")'/></td>--%>
            <%--</c:if>--%>
            <%--<td>${item.sex}</td>--%>
            <%--<td>${item.city}</td>--%>
            <%--<td>${item.province}</td>--%>
            <%--<td>${item.country}</td>--%>
            <%--</tr>--%>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
