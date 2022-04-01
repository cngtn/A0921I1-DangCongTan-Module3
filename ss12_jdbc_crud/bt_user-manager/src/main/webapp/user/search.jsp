<%--
  Created by IntelliJ IDEA.
  User: CongTan
  Date: 01/04/2022
  Time: 4:07 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search user</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body>
<h1>Search user by country</h1>
<p>
    <a href="/users">Back to UserList</a>
</p>
<form method="post">
    <fieldset>
        <legend>Search</legend>
        <input type="text" name="country" id="country" placeholder="Nhap country can tim">
        <input type="submit" value="Search user">
    </fieldset>
</form>
</body>
</html>