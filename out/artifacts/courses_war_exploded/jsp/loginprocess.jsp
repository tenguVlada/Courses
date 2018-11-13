<%@ page import = "java.sql.*" %>
<%
    //try{
        String username = request.getParameter("uname");
        String password = request.getParameter("password");

        Class.forName("com.mysql.jdbc.Driver");

        out.println(username + ", " + password);

        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses/" + "user=root&password=root");
    PreparedStatement pst = null;
    try {
        pst = conn.prepareStatement("Select role from login where user=? and pass=?");
    } catch (SQLException e) {
        out.println("SQL querry qreating error");
    }

    pst.setString(1, username);
    pst.setString(2, password);

    ResultSet rs = pst.executeQuery();
    if(rs.next())
        out.println(rs.toString() + " Valid login credentials");
    else
        out.println("Invalid login credentials");
%>
