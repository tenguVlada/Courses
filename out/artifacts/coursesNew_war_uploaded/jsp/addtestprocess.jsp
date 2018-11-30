<%--
  Created by IntelliJ IDEA.
  User: User646
  Date: 27.11.2018
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.*" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses?" + "user=root&password=root");
        PreparedStatement pst = null;

        String course_id = request.getParameter("course_id");
        String lesson_id = request.getParameter("lesson_id");
        System.out.println("l_id: " + lesson_id);
        String quest_count = request.getParameter("quest_count");
        String quest_text;//"quest" + q_num
        String ans_count; //"ans_cnt" + q_num
        String points; //"mark" + q_num //баллы за вопрос
        String ans_text;  //i + "ans" + q_num
        String ans_coef;  //i + "coef" + q_num

        int evaluation = 0;

        for (int i = 0; i < Integer.parseInt(quest_count); i++) {
            evaluation += Integer.parseInt(request.getParameter("mark"+i).toString());
        }
        System.out.println(evaluation);

        try {
            pst = conn.prepareStatement("INSERT INTO test(lesson, evaluation) VALUES(?, ?)");
        } catch (SQLException e) {
            out.println("SQL query creating error");
        }
        pst.setString(1, lesson_id);
        pst.setInt(2, evaluation);

        pst.executeUpdate();

        try {
            pst = conn.prepareStatement("SELECT MAX(id) as test_id FROM test");
        } catch (SQLException e) {
            out.println("SQL query creating error");
        }

        ResultSet rs = pst.executeQuery();
        String test_id = "";
        if (rs.next()) {
            test_id = rs.getString("test_id");
        }

        for (int i = 0; i < Integer.parseInt(quest_count); i++){
            quest_text = request.getParameter("quest"+i);
            points = request.getParameter("mark"+i);
            ans_count = request.getParameter("ans_cnt"+i);
            if (ans_count == null){
                try {
                    pst = conn.prepareStatement("INSERT INTO question(test, q_text, points, isExam, isOpen) VALUES(?, ?, ?, 0, 1)");
                } catch (SQLException e) {
                    out.println("SQL query creating error");
                }
                pst.setString(1, test_id);
                pst.setString(2, quest_text);
                pst.setString(3, points);

                pst.executeUpdate();
            }
            else{
                try {
                    pst = conn.prepareStatement("INSERT INTO question(test, q_text, points, isExam, isOpen) VALUES(?, ?, ?, 0, 0)");
                } catch (SQLException e) {
                    out.println("SQL query creating error");
                }
                pst.setString(1, test_id);
                pst.setString(2, quest_text);
                pst.setString(3, points);

                pst.executeUpdate();

                for (int j = 0; j < Integer.parseInt(ans_count); j++){
                    ans_text = request.getParameter(j + "ans"+i);
                    ans_coef = request.getParameter(j + "coef"+i);

                    try {
                        pst = conn.prepareStatement("SELECT MAX(id) as quest_id FROM question");
                    } catch (SQLException e) {
                        out.println("SQL query creating error");
                    }

                    rs = pst.executeQuery();
                    String quest_id = "";
                    if (rs.next()) {
                         quest_id = rs.getString("quest_id");
                    }

                    try {
                        pst = conn.prepareStatement("INSERT INTO answer(question, a_text, coefficient) VALUES(?, ?, ?)");
                    } catch (SQLException e) {
                        out.println("SQL query creating error");
                    }
                    pst.setString(1, quest_id);
                    pst.setString(2, ans_text);
                    pst.setString(3, ans_coef);

                    pst.executeUpdate();
                }
            }

        }
        request.setAttribute("textMsg", "Test added!");
    %>
    <jsp:include page="course.jsp?course_id=<%=course_id%>" flush="true" />
</body>
</html>
