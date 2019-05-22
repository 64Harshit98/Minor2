<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String item = request.getParameter("item");
String vendor = request.getParameter("vendor");

String email = (String)session.getAttribute("email");
String role = (String)session.getAttribute("role");

session.setAttribute("item",item);  
session.setAttribute("vendor",vendor);
session.setAttribute("bid",email);


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
    <head>
        <title>Supply Chain Management</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="style.css">
	    <style>
            h3{
            text-align:center;
            }
        </style>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-top">
           <div class="container">
               <div class="navbar-header">
                   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                   <a href="index.jsp" class="navbar-brand">Supply Chain Management</a>
                </div>
               <div class="collapse navbar-collapse" id="myNavbar">
			       	<%
			       		String name = (String)session.getAttribute("user");
			       	%>
			       		<ul class="nav navbar-nav navbar-right">
		                  	<li><div class="dropdown">
								  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    <span class="glyphicon glyphicon-user"></span> <%=name %>
								  </button>
								  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								    <a class="dropdown-item" href="Logout.jsp">Logout</a>
								</div>
							</li>
		            	</ul>                   
               </div>
           </div>
       </div>

<h1>Live Bidding Dashboard</h1>
<table class="table table-striped table-bordered table-hover">
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
<%
if(role.equalsIgnoreCase("Shopkeeper")){
%>
<td colspan="2"><center><a href="BidUpdate.jsp?current=<%=resultSet.getString("current")%>" class="btn btn-primary">Bid</a></center></td>
<%
}
%>
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