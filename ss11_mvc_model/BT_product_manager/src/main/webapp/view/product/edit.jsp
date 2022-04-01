<%--
  Created by IntelliJ IDEA.
  User: CongTan
  Date: 30/03/2022
  Time: 9:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <title>Edit product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
<body>
<h1>Edit Product</h1>
<a href="/product">Back to ProductList</a>
<form method="post">
    <fieldset>
        <legend>Edit product</legend>
        <table class="table">
            <tr>
                <td>Id: </td>
                <td><input type="text" name="id" id="id" value="${requestScope["product"].getId()}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${requestScope["product"].getName()}" ></td>
            </tr>
            <tr>
                <td>Type: </td>
                <td><input type="text" name="type" id="type" value="${requestScope["product"].getType()}" ></td>
            </tr>
            <tr>
                <td>Type: </td>
                <td><input type="text" name="amount" id="amount" value="${requestScope["product"].getAmount()}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price" value="${requestScope["product"].getPrice()}" ></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Edit product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>