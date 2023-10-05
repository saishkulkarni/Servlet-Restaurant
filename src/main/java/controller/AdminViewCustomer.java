package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Customer;

@WebServlet("/viewcustomer")
public class AdminViewCustomer extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("admin")==null)
		{
			resp.getWriter().print("<html><h2>Invalid Session</h2>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		}
		else {
		MyDao dao = new MyDao();
		List<Customer> customers = dao.fetchAllCustomer();

		if (customers.isEmpty()) {
			resp.getWriter().print("<html><h2>No Customers Found</h2>");
			req.getRequestDispatcher("AdminHome.html").include(req, resp);
		} else {
			req.setAttribute("list", customers);
			req.getRequestDispatcher("ViewCustomer.jsp").include(req, resp);
		}
	}
	}
}
