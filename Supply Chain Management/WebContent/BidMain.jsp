<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action=CreateBid.jsp>
	<table>
	  <tr>
	    <th>Item</th>
	    <td><input type="text" name="item"></th>
	  </tr>
	  <tr>
	    <th>Price</td>
	    <td><input type="number" name="base"></td>
	  </tr>
	  <tr>
	    <th>Vendor</td>
	    <td><input type="text" name="vendor"></td>
	  </tr>
	  <tr>
	    <th><input type=submit value="Submit Bid"></td>
	  </tr>
	</table>
</form>
<%
	session.setAttribute("role","admin");
%>
</body>
</html>