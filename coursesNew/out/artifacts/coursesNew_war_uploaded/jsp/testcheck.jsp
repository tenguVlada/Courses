<%--
  Created by IntelliJ IDEA.
  User: User646
  Date: 26.11.2018
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Test Results</title>
    <link rel="stylesheet" href="css/test_check.css">
    <script type="text/javascript" src="js/test_check.js">
    </script>
</head>
<body>
<div>
    <jsp:include page="header/header.jsp"/>
</div>

<form class="testQuestForm" action="" method="post">
    <h3>Results of Test</h3>
    <div class="testQuest">
        <span class="quest">
          <p class="questP">
            Lorem ipsum dolor sit amet, consectetur adipiscing
            elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            Ut enim ad minim veniam, quis nostrud exercitation ullamco
            laboris nisi ut aliquip ex ea commodo consequat.
          </p>
        </span>
        <div class="testQuestAns">
            <p>1 Squirrel</p>
            <p>2 Squirrel</p>
            <p>3 Squirrel</p>
            <p>4 Squirrel</p>
        </div>
    </div>

    <div class="openQuest"
    <span class="questP">
          <p class="questP">
            Lorem ipsum dolor sit amet, consectetur adipiscing
            elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            Ut enim ad minim veniam, quis nostrud exercitation ullamco
            laboris nisi ut aliquip ex ea commodo consequat.
          </p>
        </span>
    <div class="openQuestAns">
        <textarea name="name" rows="10" cols="80" readonly>БЕЛКИБЕЛКИБЕЛКИБЕЛКИБЕЛКИБЕЛКИБЕЛКИБЕЛКИ</textarea>
    </div>
    <div class="openQuestMark">
        <p>Mark for answer:</p>
        <input type="text" name="" value="">
    </div>
    </div>

    <div class="openQuest"
    <span class="questP">
          <p class="questP">
            Lorem ipsum dolor sit amet, consectetur adipiscing
            elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            Ut enim ad minim veniam, quis nostrud exercitation ullamco
            laboris nisi ut aliquip ex ea commodo consequat.
          </p>
        </span>
    <div class="openQuestAns">
        <textarea name="name" rows="10" cols="80" readonly>БЕЛКИБЕЛКИБЕЛКИБЕЛКИБЕЛКИБЕЛКИБЕЛКИБЕЛКИ</textarea>
    </div>
    <div class="openQuestMark">
        <p>Mark for answer:</p>
        <input type="text" name="" value="">
    </div>
    </div>

    <div class="testQuest">
        <span class="quest">
          <p class="questP">
            Lorem ipsum dolor sit amet, consectetur adipiscing
            elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            Ut enim ad minim veniam, quis nostrud exercitation ullamco
            laboris nisi ut aliquip ex ea commodo consequat.
          </p>
        </span>
        <div class="testQuestAns">
            <p>1 Squirrel</p>
            <p>2 Squirrel</p>
            <p>3 Squirrel</p>
            <p>4 Squirrel</p>
        </div>
    </div>

    <button type="button" name="button" onclick="openPopUpConf()">Mark</button>

    <div class="popupconfcont" id="popupconfcont">
        <div class="popupconf" id="popupconf">
            <div class="operstatus">Confirm changes?</div>
            <div class="popUpButtons">
                <button type="submit" id="confirm" onclick="statusPressed('confirm');closePopUpConf()">OK</button>
                <button id="cancel" onclick="statusPressed('cancel');closePopUpConf()">Cancel</button>
            </div>
        </div>
    </div>

</form>
</body>
</html>

