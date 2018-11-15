<%@ page import = "java.sql.*" %>
<%@ page import="java.util.concurrent.TimeUnit" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String password_cp = request.getParameter("password_cp");
    String uname = request.getParameter("uname");
    String info = request.getParameter("info");
    String role = request.getParameter("role");

    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses?" + "user=root&password=root");
    PreparedStatement pst = null;

    try {
        pst = conn.prepareStatement("SELECT count(*) FROM user WHERE login=?");
    } catch (SQLException e) {
        out.println("SQL querry qreating error");
    }
    pst.setString(1, email);

    ResultSet rs = pst.executeQuery();
    if(rs.next()){
        if (rs.getInt(1) == 0) {
            request.setAttribute("textMsg", "Email isn't used!");
        %>
            <jsp:include page="admin.jsp" flush="true" />
        <%
        }
    }

    try {
        pst = conn.prepareStatement("REPLACE INTO `user` (login, role, user_name, description) VALUES(?, ?, ?, ?)");
    } catch (SQLException e) {
        out.println("SQL querry qreating error");
    }

    pst.setString(1, email);
    pst.setString(2, role);
    pst.setString(3, uname);
    pst.setString(4, info);

    if (pst.executeUpdate() == 1){
        request.setAttribute("textMsg", "User is successfully edited!");
    %>
        <jsp:include page="admin.jsp" flush="true" />
    <%
    }
    else{
        request.setAttribute("textMsg", "Invalid user credentials!");
    %>
        <jsp:include page="admin.jsp" flush="true" />
    <%
    }
%>
