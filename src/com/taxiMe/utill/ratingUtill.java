package com.taxiMe.utill;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Connection;
import java.sql.Statement; 

public class ratingUtill {
	private static Connection connection;
	private static Statement statement ;
	
 public int getStarCount(int star) {
	 int starCount =0;
	 try {
     	
         connection =   DBConnection.getConnection();
         statement =    connection.createStatement();
         
         String sql = "SELECT id FROM rating WHERE rating.stars = '"+star+"'";
         PreparedStatement statement =  connection.prepareStatement(sql);
    
         ResultSet result = statement.executeQuery();
         while(result.next()){
        	 starCount++;
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
	 return starCount;
 
 }
 public float getAvgRating() {
	 float starAvg =0;
	 int counte=0;
	 try {
     	
         connection =   DBConnection.getConnection();
         statement =    connection.createStatement();
         
         String sql = "SELECT stars  FROM rating ";
         PreparedStatement statement =  connection.prepareStatement(sql);
    
         ResultSet result = statement.executeQuery();
         while(result.next()){
        	 counte++;
         starAvg = starAvg + result.getInt("stars");
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
	return (starAvg/counte);
	 
 }
 
 public int getAvgStarCount (float avg) {
	 int count =0;
	 int output = 0;
	 count = (int) ((avg * 10)*2);
	 
	 if (count == 100) 
		 output = 5;
	 else if(count >= 80) 
		 output = 4;
	 else if(count >=60)
		 output = 3;
	 else if(count>=40)
		 output = 2;
	 else if(count >=1)
		 output = 1;
	 else
		 output = 0;
	 
	 return output;
 }
 
 public boolean isUserHasRating(int uid) {
	 boolean returnStatement = false;
	 try {
			
			connection =  DBConnection.getConnection();
			statement = connection.createStatement();
			
			 String sql = "SELECT *  FROM taxime.rating where customerId = '"+uid+"' ";
	            PreparedStatement statement =  connection.prepareStatement(sql);
	       
	            ResultSet result = statement.executeQuery();
	            if(result.next()) {
	            	returnStatement = true;
	            	 
	            }
	            else {
	            	returnStatement = false;
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
		return returnStatement;
 }
}
