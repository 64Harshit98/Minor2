

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String id =  request.getParameter("vid");

int id1 = Integer.parseInt(request.getParameter("id"));
String Name = request.getParameter("vname");
String Iname = request.getParameter("iname");
String Item_quant = request.getParameter("i_qty");
String Cost_quant= request.getParameter("c_qty");
String contact = request.getParameter("mob");
int iq1 = Integer.parseInt(request.getParameter("iqty"));
int cq1 = Integer.parseInt(request.getParameter("cqty"));
int cont = Integer.parseInt(request.getParameter("mob"));


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm", "root", "");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into stock(vid,vname,item,item_qty,cost_qty,contact)values('"+id1+"','"+Name+"','"+Iname+"','"+iq1+"','"+cq1+"','"+cont+"')");
session.setAttribute("msg", "Thank you for registering. Your response has been recorded in the database.");
response.sendRedirect("stockentry.jsp");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
