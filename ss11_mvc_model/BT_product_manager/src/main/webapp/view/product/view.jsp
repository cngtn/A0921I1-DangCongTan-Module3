<%--
  Created by IntelliJ IDEA.
  User: CongTan
  Date: 30/03/2022
  Time: 9:18 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/product">Back to ProductList</a>
</p>
<table class="table">
    <tr>
        <td>Id:</td>
        <td>${requestScope["product"].getId()}</td>
    </tr>
    <tr>
        <td>Name:</td>
        <td>${requestScope["product"].getName()}</td>
    </tr>
    <tr>
        <td>Type:</td>
        <td>${requestScope["product"].getType()}</td>
    </tr>
    <tr>
        <td>Type: </td>
        <td>${requestScope["product"].getAmount()}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${requestScope["product"].getPrice()}</td>
    </tr>
</table>
</fieldset>
</form>
</body>
</html>
