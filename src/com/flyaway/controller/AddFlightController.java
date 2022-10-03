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

import com.flyaway.service.AddFlightService;

/**
 * Servlet implementation class AddFlightController
 */
@WebServlet("/AddFlightController")
public class AddFlightController extends HttpServlet {

	AddFlightService addFlightService = new AddFlightService();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		HttpSession session = request.getSession();
		String admin = (String)session.getAttribute("user");
		if(admin==null || !admin.equals("admin")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		String airline =request.getParameter("name");
		String dfrom = request.getParameter("from");
		String dto = request.getParameter("to");
		String ddate = request.getParameter("departure");
		String dtime = request.getParameter("time");
		String price =request.getParameter("price");
		
		boolean check = addFlightService.addFlight(airline, dfrom, dto, ddate, dtime, price);
		
		if (check) {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('AirLine added Successfully...');");
			out.println("location='home.jsp';");
			out.println("</script>");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Problem occured while Adding..please add again...');");
			out.println("location='changepassword.jsp';");
			out.println("</script>");
		}
	}
	
}
