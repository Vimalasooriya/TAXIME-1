package com.taxiMe.utill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 

 

public class DBConnection {

	//parameters of the connection
     private static String jdbcUrl = "jdbc:mysql://localhost:3306/taxime";
     private static String dbUserName = "root";
     private static String dbPassword = "";

     private static Connection connection;
     
     public static Connection getConnection() { 
    
    	 //create connection 
    	 try {
    		 //check if have the connection 
    	  if (connection == null || connection.isClosed()) {
    		  	Class.forName("com.mysql.jdbc.Driver");
     			connection  = DriverManager.getConnection(jdbcUrl,dbUserName,dbPassword);
    	  	}
     	 }catch(SQLException | ClassNotFoundException e) {
     		 e.printStackTrace();
     	 }
		
		return connection;
     }
}
