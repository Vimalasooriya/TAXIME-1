package com.taxiMe.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.taxiMe.interfaces.Iemployee;
import com.taxiMe.model.Employee; 
import com.taxiMe.utill.DBConnection;
 

public class Semployee implements Iemployee{

	private static Connection connection;
	private static Statement statement ;
	
	@Override
	public ArrayList<Employee> getEmployeeList() {
		ArrayList<Employee> list = new ArrayList<Employee>();
		try {
	        	
	            connection = (Connection) DBConnection.getConnection();
	            statement =  (Statement) connection.createStatement();
	            
	            String sql = "SELECT * FROM taxime.employee  ";
	            PreparedStatement statement =  connection.prepareStatement(sql);
	       
	            ResultSet result = statement.executeQuery();
	
	            while(result.next()){
	            	
	            	 
	            	Employee employee = new Employee(); 
	            	employee.setId(result.getInt("id"));
	            	employee.setName(result.getString("name"));
	            	employee.setMail(result.getString("mail"));
	            	employee.setTelephone(result.getInt("telephone")); 
	            	employee.setAge(result.getInt("age"));
	            	employee.setAddress(result.getString("address")); 
	            	employee.setUserName(result.getString("userName")); 
	            	employee.setPassword(result.getString("password")); 
	            	list.add(employee);
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
	public Employee getEmployee(int id) {
		Employee employee = new Employee(); 
		
		try {
	        	
	            connection = (Connection) DBConnection.getConnection();
	            statement =  (Statement) connection.createStatement();
	            
	            String sql = "SELECT * FROM taxime.employee  WHERE id = '"+id+"'";
	            PreparedStatement statement =  connection.prepareStatement(sql);
	       
	            ResultSet result = statement.executeQuery();
	
	            while(result.next()){
	             
	            	
	            	employee.setId(result.getInt("id"));
	            	employee.setName(result.getString("name"));
	            	employee.setMail(result.getString("mail"));
	            	employee.setTelephone(result.getInt("telephone")); 
	            	employee.setAge(result.getInt("age"));
	            	employee.setAddress(result.getString("address")); 
	            	employee.setUserName(result.getString("userName")); 
	            	employee.setPassword(result.getString("password")); 
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
	        return employee;
	}

	@Override
	public boolean addEmployee(Employee employee) {
		boolean isSuccess = false;
		
		try {
			 
			//create db connection
	       	connection = (Connection) DBConnection.getConnection();
	        statement = (Statement) connection.createStatement();
	        
	         //sql query
	        String sql = " INSERT INTO taxime.employee  (  `name`,`mail`, `telephone`, `age`, `address`, `userName`, `password`) VALUES"
	        		+ " ( '"+employee.getName()+"', '"+employee.getMail()+"','"+employee.getTelephone()+"', "
	        				+ "'"+employee.getAge()+"', '"+employee.getAddress()+"' , '"+employee.getUserName()+"', '"+employee.getPassword()+"') ";
	    		   
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
	public boolean updateEmployee(Employee employee) {
		//create return statement
				boolean isSuccess = false;
				
				//set object value to local variables
		        
		  	  try {
		  	   
			  		  //create db connection
			         connection = (Connection) DBConnection.getConnection();
			         statement =  (Statement) connection.createStatement();
			          //create sql query
			          String sql ="UPDATE taxime.employee SET  `name` = '"+employee.getName()+"', `mail` = '"+employee.getMail()+"'"
			          		+ ", `telephone` = '"+employee.getTelephone()+"', `age` = '"+employee.getAge()+"', `address` = '"+employee.getAddress()+"'"
			          				+ ", `userName` = '"+employee.getUserName()+"', `password` = '"+employee.getPassword()+"'"
			          				+ "  WHERE (`id` = '"+employee.getId()+"');";
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
	public boolean deleteEmployee(int id) {
		boolean isSuccess = false ;
		try {
    		//create db connection
    	    connection = (Connection) DBConnection.getConnection();
            statement =  (Statement) connection.createStatement();
            //sql query statement
            String sql = "DELETE FROM taxime.employee WHERE (`id` = '"+id+"');";
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
