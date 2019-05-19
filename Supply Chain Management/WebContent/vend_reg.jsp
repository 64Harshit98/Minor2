<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>



  
  <!DOCTYPE html>

<html>
    <head>
        <title>Vendor Registration</title>
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
                   <a href="admin.jsp" class="navbar-brand">Supply Chain Management</a>
                </div>
               <div class="collapse navbar-collapse" id="myNavbar">
                   <ul class="nav navbar-nav navbar-right">
                  <li><a href="vend_reg.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up for Vendor</a></li>
                    <li><a href="shop_reg.jsp"><span class="glyphicon glyphicon-log-in"></span> Sign up for Shopkeepers</a></li>
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
                            <h4 style="text-align:center;">Vendor Registration</h4>
                        </div>
                        <div class="panel-body">
                            
                             <div class="container">
                                <div class="row">
                                   <div class="col-xs-4">
                   
                                <form action="reg.jsp" method="post">
                                         <div class="form-group">
                            <input type="text"  class="form-control" name="name"  placeholder="Name" >
                                         </div>
                                     <div class="form-group">
                            <input type="text"  class="form-control" name="uname"  placeholder="Username" >
                                         </div>
                                     <div class="form-group">
                            <input type="password"  class="form-control" name="pass"  placeholder="Password" >
                                         </div>
                                     <div class="form-group">
                            <input type="password"  class="form-control" name="cpass"  placeholder="Confirm Password" >
                                         </div>
                                     <div class="form-group">
                            <input type="text"  class="form-control" name="mob"  placeholder="Contact" >
                                         </div>
                                         <div class="form-group">
                                         <label class = "form-control" >Please select what you sell</label>
                                         <label for="Bat" style="text-align:center;">Bat</label>
                                         <input type="checkbox"   name="Bat"  placeholder="Items for sale" >
                                         <label for="Bat" style="text-align:center;">Ball</label>
                                         <input type="checkbox"   name="Ball"  placeholder="Items for sale" >
                                         <label for="Bat" style="text-align:center;">Football</label>
                                         <input type="checkbox"   name="Fball"  placeholder="Items for sale" >
                                         <label for="Bat" style="text-align:center;">Chess</label>
                                         <input type="checkbox"   name="Chess"  placeholder="Items for sale" >
                                         <label for="Bat" style="text-align:center;">Carrom</label>
                                         <input type="checkbox"   name="Carrom"  placeholder="Items for sale" >
                                            <label for="Bat" style="text-align:center;">Rope</label>
                                         <input type="checkbox"   name="Rope"  placeholder="Items for sale" >
                                         </div>
                                         
                             
                                          
                                         
                                     
                                    <button type="submit" value="Register" class="btn btn-primary">Submit</button>
                                </form>
                                   </div>
                                </div>
                             </div>
                        </div>
                    </div>
                    </div>
            </div>
        </div>
       
        <br><br><br>
       
    </body>
</html>
  
