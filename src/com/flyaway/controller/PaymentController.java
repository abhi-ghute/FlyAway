package com.flyaway.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flyaway.service.PaymentService;

/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/payment")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PaymentService service = new PaymentService();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean check = service.payment(request.getParameter("ticketID"));
		
		if (check) {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Payment done Successfully...');");
			out.println("</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("FinalTicket.jsp");
			dispatcher.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Problem occured while Adding..please add again...');");
			out.println("location='addFlight.jsp';");
			out.println("</script>");
		}
	}

}
