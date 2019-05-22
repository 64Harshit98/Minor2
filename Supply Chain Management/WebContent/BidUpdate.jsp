<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
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
<%
String item = (String)session.getAttribute("item");
String vendor = (String)session.getAttribute("vendor");
String bid = (String)session.getAttribute("bid");

float current = Float.parseFloat(request.getParameter("current"));

session.setAttribute("item",item);  
session.setAttribute("vendor",vendor);
session.setAttribute("bid",bid);

double inc = 0.05;

float ncurr = (float)(current * inc);

out.println(""+(current+ncurr));

Connection con = null;
PreparedStatement ps = null;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm", "root", "");
String sql="Update bidding set bid=?, current=? where vendor ='"+vendor+"' and item = '"+item+"' ";
ps = conn.prepareStatement(sql);
ps.setString(1, bid);
ps.setFloat(2, current+ncurr); 

int i = ps.executeUpdate();
if(i > 0)
{
%>
<a href="Bid.jsp?vendor=<%=session.getAttribute("vendor")%>&item=<%=session.getAttribute("item")%>" class="btn btn-warning">Confirm Bid</a>
<%	
}
else
{
out.print("There is a problem in updating Record.");
} 
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
%> 
</body>
</html>