<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
      <div class="container">
    <div class="row row_style">
        <div class="col-xs-3">
            <div class="panel">  
            </div>
        </div>
    <div class="col-xs-5">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4>Please enter what would you like to search</h4>
            </div>
        <div class="panel-body">
            <div class="container">
            <div class="row">
                <div class="col-xs-4">
                    <form action= "log1.jsp" method = post>
                    <div class="form-group">
                    <label for="item">Item Name</label>
                    <input type="text"  class="form-control" id="email" name="name">
                    </div>
                    <div class="form-group">
                    <label for="quantity">Quantity of items</label>
                    <input type="number"  class="form-control" name="quant" id="quant">
                    </div>
                    <button type="submit" value="Save" class="btn btn-primary">Search</button>
                    </form>
                </div>
            </div>
            </div>
        </div>
        <br>
        </div>
    </div>
    </div>
</div>

    </body>
</html>
  

