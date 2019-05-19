<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%
String item = (String)session.getAttribute("item");
String vendor = (String)session.getAttribute("vendor");
String bid = (String)session.getAttribute("bid");

session.setAttribute("item",item);  
session.setAttribute("vendor",vendor);
session.setAttribute("bid","Harry");

Connection con = null;
PreparedStatement ps = null;

try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm", "root", "");
String sql="Update bidding set bid=?, current=? where vendor ='"+vendor+"' and item = '"+item+"' ";
ps = conn.prepareStatement(sql);
ps.setString(1, bid);
ps.setInt(2, 1006);
int i = ps.executeUpdate();
if(i > 0)
{
%>
<a href="Bid.jsp?vendor=<%=session.getAttribute("vendor")%>&item=<%=session.getAttribute("item")%>">Confirm Bid</a>
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