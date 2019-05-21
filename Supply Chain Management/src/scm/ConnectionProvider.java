package scm;

import java.sql.*;  
import static scm.Provider.*; 

public class ConnectionProvider {

	private static Connection connection=null;  
	static{  
	try{  
		connection = DriverManager.getConnection("com.mysql.jdbc.Driver/scm", "root", ""); 
	}catch(Exception e){}  
	}  
	  
	public static Connection getCon(){  
	    return connection;  
	}  
}
