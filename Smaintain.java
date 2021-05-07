package com.taxiMe.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.taxiMe.interfaces.Imaintain;
import com.taxiMe.model.Maintaine; 
import com.taxiMe.utill.DBConnection;

public class Smaintain implements Imaintain{
	
	private static Connection connection;
	private static Statement statement ;
	
	@Override
	public ArrayList<Maintaine> getMaintaineList() {
		ArrayList<Maintaine> list = new ArrayList<Maintaine>();
		try {
	        	
	            connection = (Connection) DBConnection.getConnection();
	            statement =  (Statement) connection.createStatement();
	            
	            String sql = "SELECT * FROM taxime.maintaines  ";
	            PreparedStatement statement =  connection.prepareStatement(sql);
	       
	            ResultSet result = statement.executeQuery();
	
	            while(result.next()){
	            	
	            	 
	            	Maintaine maintaine = new Maintaine(); 
	            	maintaine.setId(result.getInt("id"));
	            	maintaine.setVehicleId(result.getString("vehicalId"));
	            	maintaine.setQty(result.getInt("qty"));
	            	maintaine.setPartId(result.getInt("partId")); 
	            	maintaine.setDate(result.getString("date"));
	            	maintaine.setStatus(result.getString("status")); 
	            	maintaine.setDescription(result.getString("description")); 
	            	list.add(maintaine);
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
	        return list;
	
	}

	@Override
	public ArrayList<Maintaine> getMaintaineByVehicleId(String id) {
		ArrayList<Maintaine> list = new ArrayList<Maintaine>();
		try {
	        	
	            connection = (Connection) DBConnection.getConnection();
	            statement =  (Statement) connection.createStatement();
	            
	            String sql = "SELECT * FROM taxime.maintaines  WHERE vehicalId = '"+id+"'";
	            PreparedStatement statement =  connection.prepareStatement(sql);
	       
	            ResultSet result = statement.executeQuery();
	
	            while(result.next()){
	            	
	            	 
	            	Maintaine maintaine = new Maintaine(); 
	            	maintaine.setId(result.getInt("id"));
	            	maintaine.setVehicleId(result.getString("vehicalId"));
	            	maintaine.setQty(result.getInt("qty"));
	            	maintaine.setPartId(result.getInt("partId")); 
	            	maintaine.setDate(result.getString("date"));
	            	maintaine.setStatus(result.getString("status")); 
	            	maintaine.setDescription(result.getString("description")); 
	            	list.add(maintaine);
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
	        return list;
	
	}

	@Override
	public Maintaine getMaintaine(int id) {
		Maintaine maintaine = new Maintaine(); 
		
		try {
	        	
	            connection = (Connection) DBConnection.getConnection();
	            statement =  (Statement) connection.createStatement();
	            
	            String sql = "SELECT * FROM taxime.maintaines  WHERE id = '"+id+"'";
	            PreparedStatement statement =  connection.prepareStatement(sql);
	       
	            ResultSet result = statement.executeQuery();
	
	            while(result.next()){
	             
	            	maintaine.setId(result.getInt("id"));
	            	maintaine.setVehicleId(result.getString("vehicalId"));
	            	maintaine.setQty(result.getInt("qty"));
	            	maintaine.setPartId(result.getInt("partId")); 
	            	maintaine.setDate(result.getString("date"));
	            	maintaine.setStatus(result.getString("status")); 
	            	maintaine.setDescription(result.getString("description")); 
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
	        return maintaine;
	}

	@Override
	public boolean addMaintaine(Maintaine maintaine) {
		boolean isSuccess = false;
		
		try {
			 
			//create db connection
	       	connection = (Connection) DBConnection.getConnection();
	        statement = (Statement) connection.createStatement();
	        
	         //sql query
	        String sql = " INSERT INTO taxime.maintaines  (  `vehicalId`,`status`, `qty`, `partId`, `description`, `date`) VALUES"
	        		+ " ( '"+maintaine.getVehicleId()+"', '"+maintaine.getStatus()+"' ,'"+maintaine.getQty()+"', "
	        				+ "'"+maintaine.getPartId()+"', '"+maintaine.getDescription()+"' , '"+maintaine.getDate()+"') ";
	    		   
	       //execute query
	         int result = statement.executeUpdate(sql);
	   		 
	   		 if(result > 0) {
	   			 isSuccess = true;
	   		 }else {
	   			 isSuccess = false;
	   		 }
	   		 
	       }catch(SQLException  e) {
	    	   e.printStackTrace();
	       } finally {
				//close connection
				try {
					if(statement != null) {
						statement.close();
					}
					
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	    //return output
		return isSuccess;
	}

	@Override
	public boolean updateMaintaine(Maintaine maintaine) {
		//create return statement
		boolean isSuccess = false;
		
		//set object value to local variables
        
  	  try {
  	   
	  		  //create db connection
	         connection = (Connection) DBConnection.getConnection();
	         statement =  (Statement) connection.createStatement();
	          //create sql query
	          String sql ="UPDATE taxime.maintaines SET  `vehicalId` = '"+maintaine.getVehicleId()+"', `status` = '"+maintaine.getStatus()+"'"
	          		+ ", `qty` = '"+maintaine.getQty()+"', `partId` = '"+maintaine.getPartId()+"', `description` = '"+maintaine.getDescription()+"'"
	          				+ ", `date` = '"+maintaine.getDate()+"'"
	          				+ "  WHERE (`id` = '"+maintaine.getId()+"');";
	        		  //
	          
	          int result =  statement.executeUpdate(sql);
	          
	          //if output have any value set return value true else set false
	          if(result>0) {
	              isSuccess = true;	
	          }
	          else {
	          	isSuccess = false;
	          }
          
	  	}catch(SQLException | NullPointerException  e) {  
	        e.printStackTrace();    
		} finally {
			//close connection
			try {
				if(statement != null) {
					statement.close();
				}
				
				if (connection != null) {
					connection.close();
				}
			} catch ( SQLException e) {
				e.printStackTrace();
			}
		}
		//return isSuccess as true or false
	      return isSuccess;
	}

	@Override
	public boolean deleteMaintaine(int id) {
		boolean isSuccess = false ;
		try {
    		//create db connection
    	    connection = (Connection) DBConnection.getConnection();
            statement =  (Statement) connection.createStatement();
            //sql query statement
            String sql = "DELETE FROM taxime.maintaines WHERE (`id` = '"+id+"');";
            //execute delete query
            int result =  statement.executeUpdate(sql);
            //if query execute success return true and if not return false	
            if (result > 0) {
            	isSuccess = true;
            }
            else {
            	isSuccess = false;
            }
            
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
			//close connection
			try {
				if(statement != null) {
					statement.close();
				}
				
				if (connection != null) {
					connection.close();
				}
			} catch ( SQLException e) {
				e.printStackTrace();
			}
    	}
    	
	return isSuccess;
	}
	

}
