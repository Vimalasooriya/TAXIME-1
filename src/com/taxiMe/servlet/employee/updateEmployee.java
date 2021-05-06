package com.taxiMe.servlet.employee;

import java.io.IOException;
import java.util.InputMismatchException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.taxiMe.interfaces.Iemployee;
import com.taxiMe.model.Employee;
import com.taxiMe.model.User;
import com.taxiMe.services.Semployee;

/**
 * Servlet implementation class updateEmployee
 */ 
public class updateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isTrue; 
		Employee employee= new Employee();
		Iemployee service  = new Semployee();				
		 
		int tp = Integer.parseInt(request.getParameter("tel")); 
		int id = Integer.parseInt(request.getParameter("id")); 
		 
		employee.setId(id);
		employee.setName(request.getParameter("name"));
		employee.setMail(request.getParameter("email")); 
		employee.setTelephone(tp); 
		employee.setAge(Integer.parseInt(request.getParameter("age"))); 
		employee.setAddress(request.getParameter("address"));
		employee.setUserName( request.getParameter("uName")); 
		employee.setPassword(request.getParameter("password")); 
		
		  
		try {
			
			isTrue = service.updateEmployee(employee);
			
			//if return value is true
			if(isTrue == true) {
			  
				RequestDispatcher dispatcher = request.getRequestDispatcher("employeeManegment.jsp");
				dispatcher.forward(request, response);
			}
			else { 
				RequestDispatcher dispatcher = request.getRequestDispatcher("employeeManegment.jsp");
				dispatcher.forward(request, response);
			}
			
		}
		catch ( InputMismatchException  e) {
			e.printStackTrace();
		}
	}

}
