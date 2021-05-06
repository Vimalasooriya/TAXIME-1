package com.taxiMe.servlet.employee;

import java.io.IOException;
import java.util.InputMismatchException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.taxiMe.interfaces.Iemployee;
import com.taxiMe.model.Employee;
import com.taxiMe.services.Semployee;


/**
 * Servlet implementation class registerEmployee
 */ 
public class registerEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isTrue; 
		Employee employee= new Employee();
		Iemployee service  = new Semployee();				
		 
		int tp = Integer.parseInt(request.getParameter("tel")); 
		 
		String fname = request.getParameter("fName");
		String lname = request.getParameter("lName");
		
		String fullName = fname + " " + lname;
		
		employee.setName(fullName);
		employee.setMail(request.getParameter("email")); 
		employee.setTelephone(tp); 
		employee.setAge(Integer.parseInt(request.getParameter("age"))); 
		employee.setAddress(request.getParameter("address"));
		employee.setUserName( request.getParameter("uName")); 
		employee.setPassword(request.getParameter("password")); 
		
		  
		try {
			
			isTrue = service.addEmployee(employee);
			
			//if return value is true
			if(isTrue == true) {
			  
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
			else { 
				RequestDispatcher dispatcher = request.getRequestDispatcher("customerRegister.jsp");
				dispatcher.forward(request, response);
			}
			
		}
		catch ( InputMismatchException  e) {
			e.printStackTrace();
		}
		 
	}

}
