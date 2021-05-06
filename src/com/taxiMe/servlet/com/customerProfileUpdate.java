package com.taxiMe.servlet.com;

import java.io.IOException;
import java.util.InputMismatchException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.taxiMe.interfaces.Icustomer;
import com.taxiMe.model.Customer;
import com.taxiMe.model.User;
import com.taxiMe.services.Scustomer;

/**
 * Servlet implementation class customerProfileUpdate
 */ 
public class customerProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerProfileUpdate() {
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
		Customer customer= new Customer();
		Icustomer service  = new Scustomer();				
		 
		int tp = Integer.parseInt(request.getParameter("tel")); 
		int id = Integer.parseInt(request.getParameter("id")); 
		 
		customer.setId(id);
		customer.setName(request.getParameter("name"));
		customer.setMail(request.getParameter("email")); 
		customer.setTelephone(tp); 
		customer.setGender(request.getParameter("gender")); 
		customer.setAddress(request.getParameter("address"));
		customer.setUserName( request.getParameter("uName")); 
		customer.setPassword(request.getParameter("password")); 
		
		  
		try {
			
			isTrue = service.updateCustomer(customer);
			
			//if return value is true
			if(isTrue == true) {
				User user = new User();
				user.setId(customer.getId());
				user.setUserName(customer.getUserName());
				user.setPassword(customer.getPassword());
				user.setUserType("customer");
				
				 HttpSession session = request.getSession();
	             session.setAttribute("user", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
				dispatcher.forward(request, response);
			}
			else { 
				RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
				dispatcher.forward(request, response);
			}
			
		}
		catch ( InputMismatchException  e) {
			e.printStackTrace();
		}
	}

}
