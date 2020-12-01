<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.lang.*,java.util.*,java.net.*,java.util.*,java.text.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.sql.SQLException" %>

<%!
%>

<%
    String attr = (String) request.getAttribute("executeData");
    out.println("<script language=\"JavaScript\">\n" +
            "    setTimeout(function () {\n" +
            "        location.href = \"receive.jsp?letterData=\" + \"" + attr + "\";\n" +
            "    }, 3000);\n" +
            "</script>");
    out.flush();
%>

<html>
<head>
<link href="css/style-loading.css" rel="stylesheet">
    <title>Loading</title>
</head>
<body>

<div class="loading">
  <span>L</span>
  <span>O</span>
  <span>A</span>
  <span>D</span>
  <span>I</span>
  <span>N</span>
  <span>G</span>
</div>
    <script type="module" src="./app.js"></script>
</body>
</html>