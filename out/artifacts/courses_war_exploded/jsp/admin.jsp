<%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 11.11.2018
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        <form class="createuser" id="createuserform">
            <div id="createnewuser">Create new user</div>
            <div class="leftcolform">
                <div class="textonform1">E-email</div>
                <div class="textonform2">Password</div>
                <div class="textonform3">Confirm password</div>
                <div class="textonform4">Personal info</div>
                <div class="textonform5">Role</div>
            </div>
            <div class="rightcolform">
                <div><input type="text" name="" value="" required></div>
                <div><input type="text" name="" value="" required></div>
                <div><input type="text" name="" value="" required></div>
                <div><textarea id="info" name="name" rows="4" cols="33"></textarea></div>
                <div><select class="" name="">
                    <option disabled>Choose role for user</option>
                </select></div>
            </div>
            <button id="butt" type="submit" name="button">Add</button>
        </form>

        <form class="deleteuser" id="deleteuserform">
            <div id="deleteexistuser">Delete user</div>
            <div class="leftcolform">
                <div class="textonform11">Searh form</div>
                <div class="textonform22">Founded users</div>
                <div class="textonform33">E-mail</div>
                <div class="textonform44">Personal info</div>
                <div class="textonform55">Role</div>
            </div>
            <div class="rightcolform">
                <div><input type="text" name="" value=""></div>
                <div><select class="" name="">
                    <option disabled>All users</option>
                </select></div>
                <div><input type="text" name="" value="" required></div>
                <div><textarea id="info" name="name" rows="4" cols="33"></textarea></div>
                <div><select class="" name="">
                    <option disabled>Choose role for user</option>
                </select></div>
            </div>
            <button id="butt" type="submit" name="button">Delete</button>
        </form>

        <form class="editeuser" id="editeuserform">
            <div id="editexistuser">Edit user</div>
            <div class="leftcolform">
                <div class="textonform111">Searh form</div>
                <div class="textonform222">Founded users</div>
                <div class="textonform333">E-mail</div>
                <div class="textonform444">New password</div>
                <div class="textonform555">Confirm new password</div>
                <div class="textonform666">Personal info</div>
                <div class="textonform777">Role</div>
            </div>
            <div class="rightcolform">
                <div><input type="text" name="" value=""></div>
                <div><select class="" name="">
                    <option disabled>All users</option>
                </select></div>
                <div><input type="text" name="" value="" required></div>
                <div><input type="text" name="" value=""></div>
                <div><input type="text" name="" value=""></div>
                <div><textarea id="info" name="name" rows="4" cols="33"></textarea></div>
                <div><select class="" name="">
                    <option disabled>Choose role for user</option>
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
