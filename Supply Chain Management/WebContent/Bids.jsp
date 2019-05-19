<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
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

<h1>All the bids available</h1>
<table border="1">
<tr>
<td>Vendor</td>
<td>Item Name</td>
<td>Item Base Price</td>
<td>Current Bid</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from bidding ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("vendor") %></td>
<td><%=resultSet.getString("item") %></td>
<td><%=resultSet.getString("base") %></td>
<td><%=resultSet.getString("current") %></td>
<td><a href="Bid.jsp?item=<%=resultSet.getString("item")%>&vendor=<%=resultSet.getString("vendor")%>&status=Done">Join</a></td>
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