<%@ page import = "java.sql.*" %>

<%
    String username = request.getParameter("uname");
    String password = request.getParameter("password");

    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses?" + "user=root&password=root");
    PreparedStatement pst = null;

    try {
        pst = conn.prepareStatement("SELECT role FROM user WHERE (login LIKE ? AND hash_pass LIKE ?)");
    } catch (SQLException e) {
        out.println("SQL querry qreating error");
    }

    pst.setString(1, username);
    pst.setString(2, password);

    ResultSet rs = pst.executeQuery();
    if(rs.next()){
        if (rs.getString(1).equals("admin"))
            response.sendRedirect("admin.jsp");
        else if (rs.getString(1).equals("student"))
            response.sendRedirect("student.jsp");
        else if (rs.getString(1).equals("lecturer"))
            response.sendRedirect("lecturer.jsp");
        else
            out.println("Invalid login credentials " + rs.getString(1));
    }
    else
        out.println("Invalid login credentials 2");
%>
