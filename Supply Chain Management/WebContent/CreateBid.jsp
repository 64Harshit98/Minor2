<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String item = request.getParameter("item");
int base = Integer.parseInt(request.getParameter("base"));
int current = Integer.parseInt(request.getParameter("base"));
String vendor = request.getParameter("vendor");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into bidding(item,base,current,vendor,bid)values('"+item+"','"+base+"','"+current+"','"+vendor+"','NA')");
out.println("Thank you for register ! Please <a href='index.html'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action=BidMain.jsp>
	<table>
	  <tr>
	    <th>Item</th>
	    <td><% out.print(request.getParameter("item")); %></th>
	  </tr>
	  <tr>
	    <th>Base</td>
	    <td><% out.print(request.getParameter("base")); %></td>
	  </tr>
	  <tr>
	    <th>Current</td>
	    <td><% out.print(request.getParameter("base")); %></td>
	  </tr>
	  <tr>
	    <th>Venndor</td>
	    <td><% out.print(request.getParameter("vendor")); %></td>
	  </tr>
	  <tr>
	    <th><input type=submit value="Start Bid"></td>
	  </tr>
	</table>
</form>
</body>
</html>