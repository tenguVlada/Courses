<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.*" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Student</title>
    <link rel="stylesheet" type="text/css" href="css/lecturer.css">
</head>
<body>

<%
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses?" + "user=root&password=root");
    PreparedStatement pst = null;

   // request.setParameter("student", "student");
    String student = session.getAttribute("name").toString(); //request.getAttribute("lecturer");

    try {
        pst = conn.prepareStatement("SELECT user_name, description FROM user WHERE login = ?");
    } catch (SQLException e) {
        out.println("SQL query creating error");
    }

    pst.setString(1, student);

    ResultSet rs = pst.executeQuery();
    if(rs.next()){
        if (rs.getString("user_name") != null)
            request.setAttribute("student_name", rs.getString("user_name"));
        else
            request.setAttribute("student_name", "");
        if (rs.getString("description") != null)
            request.setAttribute("student_description", rs.getString("description"));
        else
            request.setAttribute("student_description", "");
    }

    try {
        pst = conn.prepareStatement("SELECT course.id, course.course_name, course.description, subscribe.mark FROM courses.subscribe, courses.user, courses.course " +
                "where (user.login = subscribe.student) and (course.id = subscribe.course) and (user.login = ?)");
    } catch (SQLException e) {
        out.println("SQL query creating error");
    }

    pst.setString(1, student);

    rs = pst.executeQuery();

    int n = 1;
    while(rs.next()){
        request.setAttribute("course_id"+n, rs.getString("id"));
        if (rs.getString("course_name") != null)
            request.setAttribute("course_name"+n, rs.getString("course_name"));
        else
            request.setAttribute("course_name"+n, "");
        if (rs.getString("description") != null)
            request.setAttribute("course_description"+n, rs.getString("description"));
        else
            request.setAttribute("description"+n, "");
        if (rs.getString("mark") != null)
            request.setAttribute("course_mark"+n, rs.getString("mark"));
        else
            request.setAttribute("course_mark"+n, "");
        n++;
    }

    //try {
    //    pst = conn.prepareStatement("SELECT DISTINCT theme FROM course WHERE lecturer = ?");
    //} catch (SQLException e) {
    //    out.println("SQL query creating error");
    //}

    //pst.setString(1, lecturer);

    //rs = pst.executeQuery();
    //int t = 1;
    //while(rs.next()){
    //  if ((rs.getString("theme") != null) && (!rs.getString("theme").equals(""))){
    //    request.setAttribute("theme"+t, rs.getString("theme"));
    //    t++;}
    //}
%>

<header>
    <div class="headercont">
        <div class="logo">
            COURSE
        </div>
        <div class="item"><a href="">Home</a></div>
        <div class="item"><a href="">Abous Us</a></div>
        <div class="item"><a href="">Contacts</a></div>
        <form class="item">
            <input type="search" id="searchform" placeholder="Let's start!">
            <button id="searchbutt" type="submit" name="searchbutt">Find</button>
        </form>
    </div>
    <div class="headercont">
        <div class="reg"><a href="">Sign In or Register</a></div>
    </div>
</header>
<div class="title"><span><h3>Student Page<h3></span></div>

<div class="lecturer">
    <center>
        <div class = "circle">
            <img src="img/lecturer/customer.png" alt="Users photo">
        </div>
    </center>
    <div class="info">
        <h3><p align="center"><%=request.getAttribute("student_name")%></p></h3>
        <h4><p align="center">Student</p></h4>
        <span><h4><p align="center">Topics:</p></h4></span>
        <h5><p align="center"> Topic 1: average mark 5.0</p></h5>
        <h5><p align="center"> Topic 2: average mark 5.0</p></h5>
    </div>
</div>
<div class = "course_column">
    <div class="personal_info">
        <h3><p align="center">Personal information</p></h3>
        <div class="lecturer_info" >
            <p><%=request.getAttribute("student_description")%></p>
        </div>
    </div>

    <div class="courses_info">
        <h3><p align="center">In process:</p></h3>
        <%
            for (int i = 1; i < n; i++)
                if (request.getAttribute("course_mark"+i).equals("")){
        %>
        <div class="course" >
            <h4><p align="center"><a href="" style="color: #000000">Unsubscribe</a></p></h4>
            <h4><p align="center"><a href="" style="color: #000000"><%=request.getAttribute("course_name"+i)%></a></p></h4>
            <p>Description: <%=request.getAttribute("course_description"+i)%></p>
        </div>
        <div class = "course_header"><h3><p align="center">Complited:</p></h3></div>
        <%
                }
        %>

        <%
            for (int i = 1; i < n; i++)
                if (!request.getAttribute("course_mark"+i).equals("")){
        %>
        <div class="course" >
            <h4><p align="center">Mark: <%=request.getAttribute("course_mark"+i)%></p></h4>
            <h4><p align="center"><a href="" style="color: #000000"><%=request.getAttribute("course_name"+i)%></a></p></h4>
            <p>Description: <%=request.getAttribute("course_description"+i)%></p>
        </div>

        <%
                }
        %>

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
