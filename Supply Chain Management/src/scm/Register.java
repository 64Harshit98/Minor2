package scm;

import java.sql.*;

public class Register {

	public static int register(String name, String email, String pass){  
		int status=0;  
		try{  
		Connection con=ConnectionProvider.getCon();  
		PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?)");  
		ps.setString(1, name);  
		ps.setString(2, email);  
		ps.setString(3, pass);  
		              
		status=ps.executeUpdate();  
		
		}catch(Exception e){}  
		      
		return status;  
		}
}
