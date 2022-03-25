<%--
  Created by IntelliJ IDEA.
  User: CongTan
  Date: 25/03/2022
  Time: 10:50 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1 style="text-align: center">CUSTOMER LIST</h1>
<table border="bold" class="table table-success table-striped" >
    <thead>
    <tr>
        <th>Ten</th>
        <th>Ngay sinh</th>
        <th>Dia chi</th>
        <th>Anh</th>
    </tr>
    </thead>
    <c:forEach items="${customerList}" var="customer">
    <tbody>
        <tr>
            <td>${customer.ten}</td>
            <td>${customer.ngaySinh}</td>
            <td>${customer.diaChi}</td>
            <td><image src="${customer.hinhAnh}" width="50px" height="50px"></image></td>
        </tr>
    </tbody>
    </c:forEach>

</table>
</body>
</html>