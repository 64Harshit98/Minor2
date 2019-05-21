<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	session.setAttribute("role","");
	session.setAttribute("user","");
	session.setAttribute("email","");
	response.sendRedirect("index.jsp");  
%>