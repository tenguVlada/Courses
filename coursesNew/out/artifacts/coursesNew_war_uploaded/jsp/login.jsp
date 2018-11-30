<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login page</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="js/login.js"></script>
</head>

<body>
<div class="formcont">
    <div class="imagecont">
        <img src="img/login/customer-login.png"class="avatar">
    </div>

    <form action="loginprocess.jsp" method="post" class="logcontainer">

        <input type="text" placeholder="Enter email" name="uname" required>

        <input type="password" placeholder="Enter password" name="password" required>

        <button type="submit">Sign In</button>
    </form>
</div>

<div class="popupcont" id="popupcont">
    <div class="popup" id="popup">
        <div class="operstatus"><%=request.getAttribute("textMsg")%></div>
        <button class="close" onclick="closePopUp()">OK</button>
    </div>
</div>

<% if (request != null && request.getAttribute("textMsg") != null)
{ %>
<script type="text/javascript">
    openPopUp();
</script>
<% }
%>

</body>
</html>
