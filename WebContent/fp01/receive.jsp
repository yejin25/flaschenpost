<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.lang.*,java.util.*,java.net.*,java.util.*,java.text.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="flaschenpost.LetterConnection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flaschenpost.Letter" %>

<%!
    public String getRandomData(String group, String latestInputIndex) {
        String receiveRandomString = "이런, 아직 작성한 사람이 없나봐요..! 글을 더 써보세요!";
        String receiveFont = "serif-sans";
        String receiveColor = "black";
        HashMap<String, Letter> receiveHashMap = new HashMap<String, Letter>();
        try {
            LetterConnection letterConnection = new LetterConnection();
            receiveHashMap = letterConnection.getSelection(Integer.parseInt(group));
            if (receiveHashMap.size() != 0) {
                ArrayList<String> receiveHashMapKeySet = new ArrayList<String>(receiveHashMap.keySet());
                int randomNum = getRandomNumber(Integer.parseInt(latestInputIndex), receiveHashMapKeySet);
                Letter receiveLetter = receiveHashMap.get(String.valueOf(randomNum));
                System.out.println("----- " + randomNum + " " + receiveHashMap.size() + " -----");
                receiveRandomString = receiveLetter.getContext();
                receiveFont = receiveLetter.getFont();
                receiveColor = receiveLetter.getColor();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return receiveRandomString + "_" + receiveFont + "_" + receiveColor;
    }
    public int getRandomNumber(int index, ArrayList<String> receiveKey) {
        int randomnize = 0;
        boolean isTrueNum = true;
        Random random = new Random();
        random.setSeed(System.currentTimeMillis());
        while (isTrueNum) {
            randomnize = random.nextInt(index - 1);
            if (randomnize == 0) {
                isTrueNum = true;
            } else if (randomnize == index) {
                isTrueNum = true;
            } else if (receiveKey.contains(String.valueOf(randomnize))){
                isTrueNum = false;
                break;
            }
        }
        return randomnize;
    }
%>

<%
    String letterData[];
    String executeArr[];<!--text, font, color-->
    String executeData = "null";
    String executeFont = "serif-sans";
    String executeColor = "black";
    try {
        System.out.println(request.getParameter("letterData"));
        if (request.getParameter("letterData") != null && request.getParameter("letterData") != "null") {
            letterData = request.getParameter("letterData").split("_");
            executeArr[] = getRandomData(letterData[0], letterData[1]).split("_");
            executeData = executeArr[0];
            executeFont = executeArr[1];
            executeColor = executeArr[2];
        }
    } catch (NullPointerException e) {
        e.printStackTrace();
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/receivestyle.css" rel="stylesheet">
    <title>Flaschenpost</title>
</head>

<body>
<h1>Flaschenpost</h1>

<div class="output">
    <div class="textOutput">
        <img id="letter" src='img/letter_old2.png'>
        <textarea id="content" name="oldcontent" readonly="readonly" style="font-family:executeFont; color:executeColor">  
            <%
                out.println(executeData);
                out.flush();
            %>
        </textarea>
    </div>
</div>

<div class="about">
    <a href="AboutPage.jsp" style="text-decoration:none; font-size:1.5rem; color:black"> <strong>About</strong></a>
    <span style="margin-left:50px">Why make?</span>
    <span style="margin-left:50px">How to Use?</span>
    <span style="margin-left:50px">Who are We?</span>
</div>
</body>
</html>