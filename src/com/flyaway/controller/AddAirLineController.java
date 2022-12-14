package com.flyaway.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.service.AirLineService;

/**
 * Servlet implementation class AddAirLineController
 */
@WebServlet("/addairline")
public class AddAirLineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AirLineService airLineService = new AirLineService();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String admin = (String)session.getAttribute("user");
		if(admin==null || !admin.equals("admin")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		boolean check = airLineService.addAirLine(request.getParameter("airlineName"), request.getParameter("airlineNo"));
		
		if (check) {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('AirLine added Successfully...');");
			out.println("location='addFlight.jsp';");
			out.println("</script>");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Problem occured while Adding..please add again...');");
			out.println("location='home.jsp';");
			out.println("</script>");
		}
	}

}
