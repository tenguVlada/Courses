<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Main page</title>
    <link rel="stylesheet" href="css/page_with_courses.css">
    <script src="js/allcourses.js"></script>
</head>
<body>

<%
    //request.setAttribute("course_id", "4");
    //String course_id = "1";
   String theme = null;
   if (request.getParameter("theme") != null)
       theme = request.getParameter("theme");

    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses?" + "user=root&password=root");
    PreparedStatement pst = null;

   if (theme == null) {
        try {
            pst = conn.prepareStatement("SELECT course.id, course.lecturer, course.course_name, course.theme, course.description, COUNT(lesson.id) AS less_count FROM course LEFT JOIN lesson ON course.id = lesson.course GROUP BY course.id");
        } catch (SQLException e) {
            out.println("SQL query creating error");
        }
    }
    else {
        try {
            pst = conn.prepareStatement("SELECT course.id, course.lecturer, course.course_name, course.theme, course.description, COUNT(lesson.id) AS less_count FROM course LEFT JOIN lesson ON course.id = lesson.course WHERE course.theme = ? GROUP BY course.id");
            pst.setString(1, theme);
        } catch (SQLException e) {
            out.println("SQL query creating error");
        }
    }

    ResultSet rs = pst.executeQuery();
    int n = 1;
    while(rs.next()){
        request.setAttribute("course_id"+n, rs.getString("id"));
        request.setAttribute("course_lecturer"+n, rs.getString("lecturer"));
        request.setAttribute("course_name"+n, rs.getString("course_name"));
        request.setAttribute("course_theme"+n, rs.getString("theme"));
        request.setAttribute("course_description"+n, rs.getString("description"));
        request.setAttribute("course_less_count"+n, rs.getString("less_count"));
        n++;
    }

    try {
        pst = conn.prepareStatement("SELECT DISTINCT theme FROM course");
    } catch (SQLException e) {
        out.println("SQL query creating error");
    }

    rs = pst.executeQuery();
    int t = 1;
    while(rs.next()){
        if ((rs.getString("theme") != null) && (!rs.getString("theme").equals(""))){
            request.setAttribute("theme"+t, rs.getString("theme"));
        t++;}
    }

%>
<!--<h3><span>-</span><a href="#"></a></h3>
<h3><span>-</span><a href="#">Lecture 2</a></h3>
<h3><span>-</span><a href="#">Lecture 3</a></h3>
-->


<div class="leftMainCol">
    <div id="specs">
        <h2>Specializations</h2>
        <%
            for (int i = 1; i < t; i++){
        %>
        <a href="allcourses.jsp?theme=<%=request.getAttribute("><h3><%=request.getAttribute("theme"+i)%></h3></a>
        <%
            }
        %>
    </div>
</div>
<div class="rightMainCol">
    <%
        for (int i = 1; i < n; i++){
    %>
    <div id="courseCard">
        <div class="leftPart">
            <img src="image/teacher-icon.png" alt="">
            <h4><%=request.getAttribute("course_lecturer"+i)%></h4>
        </div>

        <div class="centerPart">
            <h2 id="courseNameAndDescr"><%=request.getAttribute("course_name"+i)%> : <%=request.getAttribute("course_theme"+i)%></h2>
            <span>Description: </span><span><%=request.getAttribute("course_description"+i)%>
            </span>
            <br/>
            <div id="lessCount">
                <span><h4>Lessons: </h4></span>
                <span><h4><%=request.getAttribute("course_less_count"+i)%></h4></span>
            </div>
        </div>

        <div class="rightPart">
            <div id="rate">
                <div class="starsRate">
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                </div>
                <h4 id="voice">100 voices</h4>
            </div>
            <button id="showMoreButt" onclick="pageRedirect('course.jsp?course_id=<%=request.getAttribute("course_id"+i)%>')" type="button"  name="button">Show more</button>
        </div>
    </div>
    <%
        }
    %>

    <!--<div id="courseCard">
        <div class="leftPart">
            <img src="image/teacher-icon.png" alt="">
            <h4>Name</h4>
        </div>

        <div class="centerPart">
            <h2 id="courseNameAndDescr">Course theme: short description</h2>
            <span>Description: </span><span>Lorem ipsum dolor sit amet, consectetur
              adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
              voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
              cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
            </span>
            <br/>
            <div id="lessCount">
                <span><h4>Lessons: </h4></span>
                <span><h4>12</h4></span>
            </div>
        </div>

        <div class="rightPart">
            <div id="rate">
                <div class="starsRate">
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                </div>
                <h4 id="voice">100 voices</h4>
            </div>
            <button id="showMoreButt" type="button" name="button">Show more</button>
        </div>
    </div>

    <div id="courseCard">
        <div class="leftPart">
            <img src="image/teacher-icon.png" alt="">
            <h4>Name</h4>
        </div>

        <div class="centerPart">
            <h2 id="courseNameAndDescr">Course theme: short description</h2>
            <span>Description: </span><span>Lorem ipsum dolor sit amet, consectetur
              adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
              voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
              cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
            </span>
            <br/>
            <div id="lessCount">
                <span><h4>Lessons: </h4></span>
                <span><h4>12</h4></span>
            </div>
        </div>

        <div class="rightPart">
            <div id="rate">
                <div class="starsRate">
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                    <span>&#9734;</span>
                </div>
                <h4 id="voice">100 voices</h4>
            </div>
            <button id="showMoreButt" type="button" name="button">Show more</button>
        </div>
    </div>
-->
</div>
</body>
</html>
