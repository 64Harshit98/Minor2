<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String item = request.getParameter("item");
String vendor = (String)session.getAttribute("email");

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
	    }</style>
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
       <div class="col-xs-5">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 style="text-align:center;">Vendor Registration</h4>
            </div>
            <div class="panel-body">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-4">
                            <form >
                            <%
							try{
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							String sql ="select * from bidding where item = '"+item+"' and vendor='"+vendor+"'";
							resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
							%>
                                <div class="form-group">
                                    <label for="item">Item</label>
                                    <% out.print(resultSet.getString("item")); %>
                                </div>
                                <div class="form-group">
                                    <label for="bprice">Base Price</label>
                                    <% out.print(resultSet.getString("base")); %>
                                </div>
                                <div class="form-group">
                                    <label for="cprice">Current Price</label>
                                    <td><% out.print(resultSet.getString("base")); %>
                                </div>   
                                <div class="form-group">
                                    <label for="quantity">Quantity</label>
                                    <% out.print(resultSet.getString("qty")); %>
                                </div>
                                <div class="form-group">
                                    <label for="quantity">Bidder</label>
                                    <% out.print(resultSet.getString("bid")); %>
                                </div>
                                <a href="BidEndd.jsp?item=<%=resultSet.getString("item") %>&vendor=<%=resultSet.getString("vendor") %>" class="btn btn-warning">End Bid</a>
                                <%
								}
								connection.close();
								} catch (Exception e) {
								e.printStackTrace();
								}
                                %>
                            </form>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
    </body>
</html>
  
