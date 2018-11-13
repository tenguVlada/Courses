<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login page</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>

<body>
<div class="formcont">
    <div class="imagecont">
        <img src="img/customer-login.png"class="avatar">
    </div>

    <form action="loginprocess.jsp" method="post" class="logcontainer">

        <input type="text" placeholder="Enter email" name="uname" required>

        <input type="password" placeholder="Enter password" name="password" required>

        <button type="submit">Sign In</button>
    </form>
</div>
</body>
</html>
