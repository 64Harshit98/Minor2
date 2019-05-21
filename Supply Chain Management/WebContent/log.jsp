<%@page import="java.sql.*"%>
<html>
<body>
<%
	String role = request.getParameter("role");
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	
	session.setAttribute("role",role);
	try
	{
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm", "root", "");
	statement = conn.createStatement();
	String sql ="select * from "+role+" where Email='"+email+"' and Password='"+pass+"';";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
		session.setAttribute("user",resultSet.getString("username"));
		session.setAttribute("email",resultSet.getString("Email"));
		%>
		<center><h1>Welcome <%=session.getAttribute("user") %></h1></center>
		<a href="index.jsp" class="btn btn-primary">Go To HomePage</a>
		<%
		}

	
	} catch(Exception e)
	{
		System.out.print(e);
		e.printStackTrace();
	}
%>
</body>
</html>