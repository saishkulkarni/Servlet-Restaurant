package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Customer;

@WebServlet("/deletecustomer")
public class DeleteCustomer extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("admin") == null) {
			resp.getWriter().print("<html><h2>Invalid Session</h2>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {

			int id = Integer.parseInt(req.getParameter("id"));
			MyDao dao = new MyDao();
			Customer customer = dao.findCustomer(id);
			if(customer!=null)
			dao.delete(customer);
			resp.getWriter().print("<html><h3>Data Deleted Successfully</h3>");
			req.getRequestDispatcher("viewcustomer").include(req, resp);
		}
	}
}
