package com.taxiMe.utill;

import java.sql.Connection;
import java.sql.Statement;
 

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.taxiMe.model.User;
 
 
public class utill {
	private static Connection connection;
	private static Statement statement ;
    
	public User loginEmployee(String userName , String password) {
		User user = new User();
		try {
			
			connection = DBConnection.getConnection();
			statement = connection.createStatement();
			
			 String sql = "SELECT *  FROM taxime.employee where userName = '"+userName+"' and password = '"+password+"'";
	            PreparedStatement statement =  connection.prepareStatement(sql);
	       
	            ResultSet result = statement.executeQuery();
	            while(result.next()) {
	            	user.setId(result.getInt("id"));
	            	user.setUserName(result.getString("userName"));
	            	user.setPassword(result.getString("password"));
	            	 
	            }
	        }catch(Exception e) {
	        	e.printStackTrace();
	        } finally {
				
				try {
					
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return user;
		
	}
	
	public User loginCustomer(String userName , String password) {
		User user = new User();
		try {
			
			connection = DBConnection.getConnection();
			statement = connection.createStatement();
			
			 String sql = "SELECT *  FROM taxime.customer where userName = '"+userName+"' and password = '"+password+"'";
	            PreparedStatement statement =  connection.prepareStatement(sql);
	       
	            ResultSet result = statement.executeQuery();
	            while(result.next()) {
	            	user.setId(result.getInt("id"));
	            	user.setUserName(result.getString("userName"));
	            	user.setPassword(result.getString("password"));
	            }
	        }catch(Exception e) {
	        	e.printStackTrace();
	        } finally {
				
				try {
					
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return user;
		
	}
	public User login(String userName , String password) {
		User user = loginCustomer(userName,password);
		
		if(user.getId() == 0 ) {
			user = loginEmployee(userName, password);
			user.setUserType("employee");
			return user;
		}
		else {
			user.setUserType("customer");
			return user;
		}
		
		
	}

}
