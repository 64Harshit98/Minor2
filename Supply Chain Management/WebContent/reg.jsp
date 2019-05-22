<%@page import="java.sql.*"%>

<%
	String role = request.getParameter("role");
	String name = request.getParameter("name");
	String uname = request.getParameter("uname");
	String pass = request.getParameter("pass");
	String cpass = request.getParameter("cpass");
	String contact = request.getParameter("contact");
	String email = request.getParameter("email");
	String city = request.getParameter("city");
	
	session.setAttribute("user",uname); 
	session.setAttribute("email",email);
	session.setAttribute("role",role);
	
		if(cpass.equals(pass)){
			if(role.equalsIgnoreCase("Vendor")){
				try
				{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm", "root", "");
				Statement st=conn.createStatement();
						st.executeUpdate("insert into vendor(vid,username,password,email,contact,city,Verified)values('"+uname+"','"+name+"','"+pass+"','"+email+"','"+contact+"','"+city+"','NA')");
						out.println("Thank you for registering as Vendor !");			 							
					response.sendRedirect("index.jsp");
				} catch(Exception e)
				{
					System.out.print(e);
					e.printStackTrace();
				}
			}
			else if(role.equalsIgnoreCase("Shopkeeper")){
				try
				{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm", "root", "");
				Statement st=conn.createStatement();
						st.executeUpdate("insert into shopkeeper(name,username,Contact,Email,City,Password,Verified)values('"+name+"','"+uname+"','"+contact+"','"+email+"','"+city+"','"+pass+"','NA')");
						out.println("Thank you for registering as Shopkeeper !");			 							
					response.sendRedirect("index.jsp");
				} catch(Exception e)
				{
					System.out.print(e);
					e.printStackTrace();
				}
			} 
		} else{
			out.println("Passwords Do Not Match");
		}
	
	
%>