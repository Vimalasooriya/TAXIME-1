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

import com.taxiMe.model.User;
import com.taxiMe.utill.utill;



/**
 * Servlet implementation class login
 */ 
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		//create variables for get parameter value
				
				 
				 
		    	User user = new User();
		    	utill login = new utill();
		    	
		    	String uname = request.getParameter("uname");
				String pass = request.getParameter("password");
		    	 
		    	
				user = login.login(uname, pass);
		    	if(user.getId() != 0) {
		    		//create sessions 
	                HttpSession session = request.getSession();
	                session.setAttribute("user", user);
	                
		    		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
					dispatcher.forward(request, response);
			        
		    	}else { 
			        	
			            	//if email or password invalid send back to login page
			                boolean chk=false;
			    			chk = true ;
			    			String msg = "Invalid username or password";
			    			request.setAttribute("msg", msg);
			    			request.setAttribute("chk", chk);
			    			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
							dispatcher.forward(request, response);
		    	}
		        		    	
	}

}
