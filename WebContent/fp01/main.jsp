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
/*            if (uploadLetterData(letter, font, color, group)) {
                returnValue = true;
            } else {
                returnValue = false;
            }*/
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
/*    private boolean uploadLetterData(String letter, String font, String color, String group) {
        System.out.println("----- " + letter + " " + font + " " + color + " " + group + " ------");
        try {
            LetterConnection letterConnection = new LetterConnection();
            Letter sendData = new Letter(letter, font, color, group);
            String executeResult = letterConnection.add(sendData);
            if (executeResult == "NULL") {
                return false;
            } else {
                System.out.println(executeResult);
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }*/
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
            //out.println("<script> alert('내용이 전송 되었습니다.'); location.href='receive.jsp'; </script>");
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
<script>
    function changeFontSelect(){
        var selectFont = document.getElementById("fontListbox");
        var letterFont = selectFont.options[selectFont.selectedIndex].value;
         
        var x = document.getElementById("content");
        x.style.fontFamily = letterFont;
    }

    function changeColorSelect(){
        var selectColor = document.getElementById("colorListbox");
        var letterColor = selectColor.options[selectColor.selectedIndex].value;
         
        var x = document.getElementById("content");
        x.style.color = letterColor;
    }
</script>
<body>
<div class="app">
		<div class="background"></div>
		<div class="main">
<h1>Flaschenpost</h1>

<form action="#" method="post">
    <div class="input">

        <div class="selection">
            <select id="fontListbox" name="font" onchange="changeFontSelect()">
                <option value="selected">--Font--</option>
                <option value = 'serif'>serif</option>
				<option value = "sans-serif">sans</option>
				<option value = "cursive" >cursive</option>
            </select>

            <select id="colorListbox" name="color" onchange="changeColorSelect()">
                <option value="selected">--Color--</option>
                <option value='black'>Black</option>
                <option value = "#5179d1">Blue</option>
                <option value = "#eb6e5e">Red</option>
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
    <a href="about.jsp" style="text-decoration:none; font-size:1.5rem; color:black"> <strong>About</strong></a>
    <span style="margin-left:50px">Why make?</span>
    <span style="margin-left:50px">How to Use?</span>
    <span style="margin-left:50px">Who are We?</span>
</div>
</div>
</div>
</body>
</html>