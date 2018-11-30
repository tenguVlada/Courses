<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Header part</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/addlecture.css">
    <script src="js/addtest.js"></script>
</head>
<body>
<jsp:include page="header/header.jsp"/>
<%
    /*String c_id = request.getParameter("course_id");

    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses?" + "user=root&password=root");
    PreparedStatement pst = null;

    try {
        pst = conn.prepareStatement("SELECT course_name FROM course WHERE id=?");
    } catch (SQLException e) {
        out.println("SQL query creating error");
    }

    pst.setString(1, c_id);

    ResultSet rs = pst.executeQuery();
    if(rs.next()) {
        request.setAttribute("course_name", rs.getString("course_name"));
    }*/
%>
<div class="main_layer">
    <div class="title" id="course_title">Course title</div>
    <hr>

    <div class="leftcol">
        <button class="button" id="button_main" onclick="<!--save_test();-->">Save Test</button>
        <button class="button" id="button_main" onclick="add_close();">+ Add close question</button>
        <button class="button" id="button_main" onclick="<!--add_open();-->">+ Add open question</button>
    </div>
    <div class = "rightcol" id="rightcol_id">
        <div class="edit_test" id="edit_test_id" name="test">
            <label class="lbl">Number of answers (2-10):</label>
            <input type="number" id="number_id" value="2" onchange="add_answers();"/>
            <div class="question" id = "question_id" contenteditable="true" data-placeholder="Enter question..."
                 spellcheck="true" data-medium-editor-element="true" role="textbox" aria-multiline="true"></div>
            <div class="answer" id = "answer_id" contenteditable="true" data-placeholder="Enter answer..."
                 spellcheck="true" data-medium-editor-element="true" role="textbox" aria-multiline="true"></div>
            <div class="answer" id = "answer_id" contenteditable="true" data-placeholder="Enter answer..."
                 spellcheck="true" data-medium-editor-element="true" role="textbox" aria-multiline="true"></div>
        </div>

        <div class="edit_test" id="edit_test_id">
            <div class="question" id = "question_id" contenteditable="true" data-placeholder="Enter question..."
                 spellcheck="true" data-medium-editor-element="true" role="textbox" aria-multiline="true"></div>
        </div>

        <div class="edit_open" id = "edit_open_id" contenteditable="true" data-placeholder="Enter question..." spellcheck="true"
             data-medium-editor-element="true" role="textbox" aria-multiline="true"></div>
        <div class="material_title" data-medium-editor-element="true">Lecture material</div>
        <div class="edit_input_text" id = "edit_input_text" name="editable_input" contenteditable="true" data-placeholder="Enter text..." spellcheck="true"
             data-medium-editor-element="true" role="textbox" aria-multiline="true"></div>
        <!--<div class="input_photo" id="input_photo_id">
            <input type='file' id="upload" onchange="readURL(this);"/>
            <img src="#" id="upload-img" alt="image" />
        </div>-->
    </div>
</div>

</body>
</html>




