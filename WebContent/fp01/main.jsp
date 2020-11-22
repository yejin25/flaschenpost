<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.lang.*,java.util.*,java.net.*,java.util.*,java.text.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="flaschenpost.LetterConnection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flaschenpost.Letter" %>

<%!
    public String checkData(boolean isValidData, String letter, String font, String color, String group) {
        String executeResult = null;
        boolean returnValue = false;
        if (isValidData) {
            System.out.println("----- letter data size is not 0 -----");
            try {
                LetterConnection letterConnection = new LetterConnection();
                Letter sendData = new Letter(letter, font, color, group);
                executeResult = letterConnection.add(sendData);
                returnValue = executeResult != "NULL";
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("----- letter data size is 0 -----");
            returnValue = false;
        }
        if (returnValue) {
            return executeResult;
        } else {
            return "NULL";
        }
    }
%>

<%
    String letterData;
    String fontData;
    String colorData;
    int groupData;
    try {
        letterData = (String) request.getParameter("content");
        fontData = (String) request.getParameter("font");
        colorData = (String) request.getParameter("color");
        groupData = (int) Integer.parseInt(request.getParameter("group"));
    } catch (NumberFormatException e) {
        e.printStackTrace();
        letterData = (String) request.getParameter("content");
        fontData = (String) request.getParameter("font");
        colorData = (String) request.getParameter("color");
        groupData = 0;
    }
    if (letterData != null) {
        String executeData = checkData(letterData.length() != 0, letterData, fontData, colorData, String.valueOf(groupData));
        if (executeData != "NULL") {
            out.println("<script> alert('내용이 전송 되었습니다.'); </script>");
            response.sendRedirect("receive.jsp" + "?letterData=" + executeData);
        } else {
            out.println("<script> alert('내용이 전송 되지 않았습니다.'); </script>");
        }
        out.flush();
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/mainstyle.css" rel="stylesheet">
    <title>Flaschenpost</title>
</head>
<body>
<div class="background"></div>
<div class="main">
<h1>Flaschenpost</h1>

<form action="#" method="post">
    <div class="input">

        <div class="selection">
            <select id="listbox" name="font">
                <option value="selected">--Font--</option>
                <option value='gothic'>고딕</option>
                <option value="NotoSans">노토산스</option>
                <option value="gongseo">궁서</option>
            </select>

            <select id="listbox" name="color">
                <option value="selected">--Color--</option>
                <option value='black'>Black</option>
                <option value="blue">Blue</option>
                <option value="red">Red</option>
            </select>

            <select id="listbox" name="group">
                <option value="selected">--Group--</option>
                <option value='2'>군인</option>
                <option value="10">10대</option>
                <option value="20">20대</option>
                <option value="1">랜덤</option>
            </select>
        </div>

        <div class="textInput">
            <img id="letter" src='img/letter_new2.png'>
            <textarea id="content" name="content"></textarea>
            <input type="image" src="img/pot3.png" name="send" alt="send" id="send"
                   onMouseOver="this.src='img/pot4.png'"
                   onMouseOut="this.src='img/pot3.png'">
        </div>
    </div>
</form>

<div class="about">
    <a href="AboutPage.jsp" style="text-decoration:none; font-size:1.5rem; color:black"> <strong>About</strong></a>
    <span style="margin-left:50px">Why make?</span>
    <span style="margin-left:50px">How to Use?</span>
    <span style="margin-left:50px">Who are We?</span>
</div>
</div>
</body>
</html>