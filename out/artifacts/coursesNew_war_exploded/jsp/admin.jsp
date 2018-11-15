<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Page</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/admin.js"></script>
</head>
<body>

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

<div class="main">
    <div class="title"><span>Admin Page</span></div>
    <div class="leftcol">
        <div class="admininfo">
            <div id="adminimg"><img src="img/admin/admin.png" alt=""></div>
            <div id="adminname">Admin's name</div>
        </div>
        <div class="actbuttons">
            <div id="actiontitle">Actions</div>
            <div class="adminbuttons">
                <div class="butt"><button onclick="showAddForm()" id="addingbuton" type="button" name="button">Create new user</button></div>
                <div class="butt"><button onclick="showDelForm()" id="delbutton" type="button" name="button">Delete user</button></div>
                <div class="butt"><button onclick="showEditForm()" id="editbutton" type="button" name="button">Edit user</button></div>
            </div>
        </div>
    </div>
    <div class="rightcol">

        <form action="createprocess.jsp" method="post"  class="createuser" id="createuserform">
            <div id="createnewuser">Create new user</div>
            <div class="leftcolform">
                <div class="textonform1">E-email</div>
                <div class="textonform2">Password</div>
                <div class="textonform3">Confirm password</div>
                <div class="textonform6">Name</div>
                <div class="textonform4">Personal info</div>
                <div class="textonform5">Role</div>
            </div>
            <div class="rightcolform">
                <div><input type="text" name="email" value="" required></div>
                <div><input type="text" name="password" value="" required></div>
                <div><input type="text" name="password_cp" value="" required></div>
                <div><input type="text" name="uname" value="" required></div>
                <div><textarea id="info" name="info" rows="4" cols="33"></textarea></div>
                <div><select class="" name="role">
                    <option disabled>Choose role for user</option>
                    <option>student</option>
                    <option>lecturer</option>
                </select></div>
            </div>
            <button id="butt" type="submit" name="button">Add</button>
        </form>

        <form action="deleteprocess.jsp" method="post" class="deleteuser" id="deleteuserform">
            <div id="deleteexistuser">Delete user</div>
            <div class="leftcolform">
                <!--<div class="textonform11">Search form</div>
                <div class="textonform22">Founded users</div>-->
                <div class="textonform33">E-mail</div>
                <!--<div class="textonform44">Personal info</div>
                <div class="textonform55">Role</div>-->
            </div>
            <div class="rightcolform">
                <div class="userlist">
                    <input list="email" name = "email">
                    <datalist id="email">
                        <%
                            Class.forName("com.mysql.jdbc.Driver");

                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses?" + "user=root&password=root");
                            PreparedStatement pst = null;

                            try {
                                pst = conn.prepareStatement("SELECT login FROM `user`");
                            } catch (SQLException e) {
                                out.println("SQL querry qreating error");
                            }

                            ResultSet rs = pst.executeQuery();

                            while(rs.next()){
                            %>
                                <option value="<%=rs.getString(1)%>"></option>
                            <%
                            }
                            %>
                    </datalist>
                </div>
                <!--<div><input type="text" name="" value=""
                        selectBox></div>
                <div><select class="" name="">
                    <option disabled>All users</option>
                </select></div>
                <div><input type="text" name="email" value="" required></div>
                <div><textarea id="info" name="name" rows="4" cols="33"></textarea></div>
                <div><select class="" name="">
                    <option disabled>Choose role for user</option>
                </select></div>-->
                <button id="butt" type="submit" name="button">Delete</button>
            </div>
        </form>

        <form action="searchprocess.jsp" method="post" class="searchuser" id="searchuserform">
            <div id="editexistuser">Edit user</div>
            <div class="leftcolform">
                <div class="textonform111">Search form</div>
            </div>
            <div class="rightcolform">
                <div class="userlist">
                    <input list="user" name = "user">
                    <datalist id="user">
                        <%
                            rs.first();
                            while(rs.next()){
                        %>
                        <option value="<%=rs.getString(1)%>"></option>
                        <%
                            }
                        %>
                    </datalist>
                </div>
            </div>
            <button id="buttSearch" type="submit" name="button">Search</button>
        </form>

        <form action="editprocess.jsp" method="post" class="editeuser" id="editeuserform">

            <div class="leftcolform">

                <div class="textonform333">E-mail</div>
                <div class="textonform888">Name</div>
                <div class="textonform666">Personal info</div>
                <div class="textonform777">Role</div>
            </div>
            <div class="rightcolform">
                <div><input type="text" name="email" value="<%=request.getAttribute("email")%>" required></div>
                <div><input type="text" name="uname" value="<%=request.getAttribute("name")%>"></div>
                <div><textarea id="info" name="info" rows="4" cols="33"><%=request.getAttribute("description")%></textarea></div>
                <div><select class="" name="role">
                    <option <%if (new String("student").equals(request.getAttribute("role"))) {%>selected<%}%>>student</option>
                    <option <%if (new String("lecturer").equals(request.getAttribute("role"))) {%>selected<%}%>>lecturer</option>
               </select></div>
            </div>
            <button id="butt" type="submit" name="button">Edit</button>
        </form>
        <!--
        <div id="email">
          <div class="textonform">E-email</div>
          <input type="text" name="" value="" required>
        </div>
        <div id="pass">
          <div class="textonform">Password</div>
          <input type="text" name="" value="" required>
        </div>
        <div id="confpass">
          <div class="textonform">Confirm password</div>
          <input type="text" name="" value="" required>
        </div>
        <div id="info">
          <div class="textonform">Personal info</div>
          <input type="text" name="" value="">
        </div>
        <div id="role">
          <div class="textonform">Role</div>
          <select class="" name="">
            <option disabled>Choose role for user</option>
          </select>
        </div>
        -->
    </div>
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

<%
    if (request != null && request.getAttribute("flag") != null)
    { %>
        <script type="text/javascript">
            showEditForm();
        </script>
    <%
        request.setAttribute("flag", null);
    }
%>

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
