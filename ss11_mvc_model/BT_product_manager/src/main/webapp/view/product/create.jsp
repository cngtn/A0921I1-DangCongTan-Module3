<%--
  Created by IntelliJ IDEA.
  User: CongTan
  Date: 30/03/2022
  Time: 9:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<a href="/product">Back to ProductList</a>
<body>
<form action="/product?action=add" method="post">
    <fieldset>
        <legend>Create product</legend>
        <table class="table">
            <tr>
                <td>Id: </td>
                <td><input type="text" name="id" id="id" placeholder="Nhap Id"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" placeholder="Nhap ten san pham"></td>
            </tr>
            <tr>
                <td>Type: </td>
                <td><input type="text" name="type" id="type" placeholder="Nhap loai san pham"></td>
            </tr>
            <tr>
                <td>Type: </td>
                <td><input type="text" name="amount" id="amount" placeholder="Nhap so luong"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price" placeholder="Nhap gia san pham"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
