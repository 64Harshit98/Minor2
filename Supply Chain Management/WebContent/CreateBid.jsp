<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String item = request.getParameter("item");
int base = Integer.parseInt(request.getParameter("base"));
int current = Integer.parseInt(request.getParameter("base"));
int qty = Integer.parseInt(request.getParameter("qty"));
String vendor = (String)session.getAttribute("email");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into bidding(item,base,current,vendor,bid, qty)values('"+item+"','"+base+"','"+current+"','"+vendor+"','NA', '"+qty+"')");
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
                            <form action="Bids.jsp">
                                <div class="form-group">
                                    <label for="item">Item</label>
                                    <% out.print(request.getParameter("item")); %>
                                </div>
                                <div class="form-group">
                                    <label for="bprice">Base Price</label>
                                    <% out.print(request.getParameter("base")); %>
                                </div>
                                <div class="form-group">
                                    <label for="cprice">Current Price</label>
                                    <td><% out.print(request.getParameter("base")); %>
                                </div>   
                                <div class="form-group">
                                    <label for="quantity">Quantity</label>
                                    <% out.print(request.getParameter("qty")); %>
                                </div>
                                <div class="form-group">
                                    <label for="quantity">Vendor</label>
                                    <%= session.getAttribute("email") %>
                                </div>
                                <button type="submit" value="Start Bid" class="btn btn-primary">Start Bid</button>
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
  
