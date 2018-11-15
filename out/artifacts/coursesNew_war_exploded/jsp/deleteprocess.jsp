<%@ page import = "java.sql.*" %>
<%@ page import="java.util.concurrent.TimeUnit" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = request.getParameter("email");

    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses?" + "user=root&password=root");
    PreparedStatement pst = null;

    try {
        pst = conn.prepareStatement("SELECT count(*) FROM user WHERE login=?");
    } catch (SQLException e) {
        out.println("SQL query qreating error");
    }
    pst.setString(1, email);

    ResultSet rs = pst.executeQuery();
    if(rs.next()){
        if (rs.getInt(1) == 0) {
            out.println("User not found. " + rs.getInt(1) + " " + email);
            //TimeUnit.SECONDS.sleep(3);
            //response.sendRedirect("admin.jsp");
            //return;
        }
    }

    try {
        pst = conn.prepareStatement("DELETE FROM `user` WHERE login LIKE ?");
    } catch (SQLException e) {
        out.println("SQL query qreating error");
    }

    pst.setString(1, email);

    if (pst.executeUpdate() == 1){
        request.setAttribute("textMsg", "User is successfully deleted!");
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
