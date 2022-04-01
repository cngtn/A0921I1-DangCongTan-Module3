<%--
  Created by IntelliJ IDEA.
  User: CongTan
  Date: 30/03/2022
  Time: 9:21 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/product?action=add">Create new product</a>
</p>
<p>
    <a href="/product?action=search">Search product</a>
</p>

<table border="1" class="table">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Type</td>
        <td>Price</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${productList}' var="product" >
        <tr>
            <td>${product.id}</td>
            <td><a href="/product?action=view&id=${product.id}">${product.name}</a></td>
            <td>${product.type}</td>
            <td>${product.amount}</td>
            <td>${product.price}</td>
            <td><a href="/product?action=edit&id=${product.id}">edit</a></td>
            <td><a href="/product?action=delete&id=${product.id}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>