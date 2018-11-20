<%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 10.11.2018
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lecturer page</title>
    <link rel="stylesheet" type="text/css" href="css/lecturer.css">
</head>
<body>

<header>
    <div class = "logo">
        <img src="header/logo.png" alt="logo">
    </div>
    <headercount>
        <div class="item"><a href="">Courses</a></div>
        <div class="item"><a href="">About</a></div>
        <div class="item">
            <form action="login.jsp">
                <p><input type="search" name="q" placeholder="Search courses">
                    <input type="image" id = "buttonSearch" src="header/search.png" alt="Search">
                </p>
            </form>
        </div>
    </headercount>
    <div class="reg">
        <div id="adminimg"></div>
        <a href="login.jsp"><%out.print(session.getAttribute("name"));%><br>Log Out</a>
    </div>
</header>

<div class="title"><span><h3>Lecturer Page<h3></span></div>

<div class="lecturer">
    <center>
        <div class = "circle">
            <img src="img/lecturer/customer.png" alt="Users photo">
        </div>
    </center>
    <div class="info">
        <h3><p align="center">User Name</p></h3>
        <h4><p align="center">Lecturer</p></h4>
        <span><h4><p align="center">Specializations:</p></h4></span>
        <h5><p align="center">- Specialization 1</p></h5>
        <h5><p align="center">- Specialization 2</p></h5>
        <h5><p align="center">- Specialization 3</p></h5>
    </div>
</div>
<div class = "course_column">
    <div class="personal_info">
        <h3><p align="center">Personal information</p></h3>
        <div class="lecturer_info" >
            <p>Lecter.Hannibal Lecter</p>
        </div>
    </div>

    <div class="courses_info">
        <p><h3><p align="center">Courses:</p></h3> </p>
        <div class="course" >
            <h4><p align="center">Course Name</p></h4>
            <p>Description:Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                sed do eiusmod tempor incididunt ut labore et dolore magna
                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>
        <div class="course" >
            <h4><p align="center">Course Name</p></h4>
            <p>Description:Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                sed do eiusmod tempor incididunt ut labore et dolore magna
                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>
        <div class="course" >
            <h4><p align="center">Course Name</p></h4>
            <p>Description:Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                sed do eiusmod tempor incididunt ut labore et dolore magna
                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>
    </div>
</div>
<footer class="foot">
    <div class="footcont">
        <div class="contact">
            <p><strong>Contacts:</strong></p>
            <p>maxuaforever@gmail.com</p>
        </div>
        <div class="copyright">
            <p>&copy 2009 - 2018 All rights reserved</p>
        </div>
    </div>
</footer>

</body>
</html>
