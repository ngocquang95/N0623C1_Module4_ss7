<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 9/16/2023
  Time: 7:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách học sinh</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="..//css/style.css">
<%--    Ctrl + U để kiểm tra nhanh chống xem file có import vào được hay không--%>
</head>
<body>
<%@ include file="..//common/header.jsp"%>

<div class="container">
    <h2 class="text-info">${sessionScope.userDetail.username}</h2>
    <form>
        <div class="mb-3">
            <label for="name" class="form-label">Tên</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="mb-3">
            <label for="fromScore" class="form-label">Từ Điểm</label>
            <input type="text" class="form-control" id="fromScore" name="fromScore">
        </div>
        <div class="mb-3">
            <label for="toScore" class="form-label">Đến Điểm</label>
            <input type="text" class="form-control" id="toScore" name="toScore">
        </div>
        <div class="mb-3">
            <label for="clazzId" class="form-label">Lớp</label>
            <select class="form-select" id="clazzId" name="clazzId">
                <option value="">Chọn lớp</option>
                <c:forEach var="clazz" items="${clazzList}">
                    <option value="${clazz.id}">${clazz.name}</option>
                </c:forEach>
            </select>
            <p class="text-danger">${messageError.clazzId}</p>
        </div>
        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
    </form>

    <h1 class="text-danger">${param.message}</h1>
<%--    Ẩn nút thêm mới khi login vào tài khoản user (không chứa quyền admin) --%>
    <c:if test="${sessionScope.userDetail.roles.contains('admin')}">
        <a href="student?action=create" class="btn btn-primary">Thêm mới</a>
    </c:if>


    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Tên</th>
            <th scope="col">Điểm</th>
            <th scope="col">Xếp loại</th>
            <th scope="col">Lớp</th>
            <c:if test="${sessionScope.userDetail.roles.contains('admin')}">
                <th scope="col">Chỉnh sửa</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${studentList}" varStatus="loop">
            <tr>
                <th scope="row">${loop.count}</th>
                <td>${student.name}</td>
                <td>${student.score}</td>
                <td>
                    <c:if test="${student.score < 5}">
                        <p class="text-danger">Yếu</p>
                    </c:if>

                    <c:if test="${student.score >= 5 && student.score < 7}">
                        <p>Bình thường</p>
                    </c:if>

                    <c:if test="${student.score >= 7}">
                        <p class="text-info">Tốt</p>
                    </c:if>
                </td>
                <td>${student.clazzName}</td>
                <c:if test="${sessionScope.userDetail.roles.contains('admin')}">
                    <td><a href="student?action=edit&id=${student.id}" class="btn btn-info">Chỉnh sửa</a></td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</body>
</html>
