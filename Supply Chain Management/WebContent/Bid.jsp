<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String item = request.getParameter("item");
String vendor = request.getParameter("vendor");

session.setAttribute("item",item);  
session.setAttribute("vendor",vendor);
session.setAttribute("bid","Harry");


String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "scm";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>

<h1>Live Bidding Dashboard</h1>
<table border="1">
<%
try{
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from bidding where vendor ='"+vendor+"' and item = '"+item+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<th>Vendor</th>
<td><%=resultSet.getString("vendor") %></td>
</tr>
<tr>
<th>Item name</th>
<td><%=resultSet.getString("item") %></td>
</tr>
<tr>
<th>Base Price</th>
<td><%=resultSet.getString("base") %></td>
</tr>
<tr>
<th>Current Bid</th>
<td><%=resultSet.getString("current") %></td>
</tr>
<tr>
<th>Bidder</th>
<td><%=resultSet.getString("bid") %></td>
</tr>
<tr>
<td colspan="2"><center><a href="BidUpdate.jsp">Bid</a></center></td>
</tr>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>