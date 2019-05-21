<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Just the flow</h1>
<%
String user = request.getParameter("uname");
session.setAttribute("user",user);  

response.sendRedirect("index.jsp");  
%>
</body>
</html>