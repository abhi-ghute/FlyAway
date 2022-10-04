package com.flyaway.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flyaway.service.RegisterCustomerService;

@WebServlet("/register")
public class RegisterCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	RegisterCustomerService customerService = new RegisterCustomerService();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String flightId = request.getParameter("flightId");
		String passenger = request.getParameter("passenger");
		String name  = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String mob = request.getParameter("mob");
		String age = request.getParameter("age");
		
		Random rand = new Random();
        
		String ticketID = rand.nextInt(1000000000)+"";
		
		boolean check = customerService.register(ticketID, flightId, passenger, name, email, password, mob, age);
				
		if (check) {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Passenger details added Successfully...');");
			out.println("</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("showTicket.jsp?ticketID="+ticketID);
			dispatcher.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Problem occured while Adding..please add again...');");
			out.println("location='SearchFlight.jsp';");
			out.println("</script>");
		}
		
	}

}
