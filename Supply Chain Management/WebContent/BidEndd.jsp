<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String item = request.getParameter("item");
String vendor = request.getParameter("vendor");

String email = (String)session.getAttribute("email");
String role = (String)session.getAttribute("role");

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

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="DELETE from bidding WHERE item = '"+item+"' and vendor='"+vendor+"' ";
statement.executeUpdate(sql);

System.out.print("Bid Deleted");
response.sendRedirect("index.jsp");
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
