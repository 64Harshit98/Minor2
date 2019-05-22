<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
                   <a href="#" class="navbar-brand">Supply Chain Management</a>
                </div>
               <div class="collapse navbar-collapse" id="myNavbar">
	               <%
			       	if(session.getAttribute("user") == null || session.getAttribute("user").equals("")){
			       	%>
			       		<ul class="nav navbar-nav navbar-right">
		                  	<li><a href="vend_reg.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up for Vendor</a></li>
		                    <li><a href="shop_reg.jsp"><span class="glyphicon glyphicon-log-in"></span> Sign up for Shopkeepers</a></li>
		            	</ul>
			       	<%
			       	} else{
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
			       	<%
			       	}
			       	%>
                   
               </div>
           </div>
       </div>
       <div class="container ">
       <center>
       	<%
       	if(session.getAttribute("user") == null || session.getAttribute("user").equals("")){
       		out.println("<h1>Welcome to Supply Chain Management</h1>");
       	%>
       		<a href="Login.jsp" class="btn btn-primary btn-lg " role="button">Login</a>
       	<%
       	} else{
       		String name = (String)session.getAttribute("user");
       		String role = (String)session.getAttribute("role");
       		out.println("<h2>"+name+"</h2>");
       		if(role.equalsIgnoreCase("Shopkeeper")){
         %>
         		<a href=Bids.jsp class="btn btn-primary">Join Bid</a>
         		<a href=Admin.jsp class="btn btn-success">Search Product</a>
         <%
           	} else if(role.equalsIgnoreCase("Vendor")){
           		
         %> 
         		<a href=BidMain.jsp class="btn btn-primary">Create Your Bid</a>
         		<a href=stockentry.jsp class="btn btn-success">Enter Product</a>
         		<a href=OwnBids.jsp class="btn btn-info"> Your Live Bids</a>
         <% 		
           	}
       	}
       	%>
       	
       	</center>
       	
       </div>
    </body>
</html>
  
