<%--
  Created by IntelliJ IDEA.
  User: CongTan
  Date: 20/03/2022
  Time: 10:22 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product Discount Calculator</title>
  <style type="text/css">
    .product{
      height: 320px;
      width: 250px;
      margin: 0;
      padding: 10px;
      border: 5px #CCC solid;
      border-radius: 15px;
    }
    .product input{
      padding: 5px;
      margin: 5px;
      height: 40px;
      border: 3px #CCC solid;
      border-radius: 10px;
    }
  </style>
</head>
<body>
<form method="post" action="/display-discount">
  <div class="product">
    <h3>Product Discount Calculator </h3>
    <label>Product Description:</label>
    <input type="text" name="ProductDescription" placeholder="Product Description"/><br>
    <label>List Price:</label>
    <input type="text" name="ListPrice" placeholder="List Price"/><br>
    <label>Discount Percent:</label>
    <input type="text" name="DiscountPercent" placeholder="Discount Percent"/><br>
    <input type="submit" id="submit" value="Calculate Discount">
  </div>
</form>
</body>
</html>
