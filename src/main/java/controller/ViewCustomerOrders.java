package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Customer;
import dto.CustomerOrder;

@WebServlet("/viewcustomerorders")
public class ViewCustomerOrders extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("customer") == null) {
			resp.getWriter().print("<html><h2>Invalid Session</h2>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			Customer customer = (Customer) req.getSession().getAttribute("customer");
			List<CustomerOrder> list = customer.getCustomerOrders();
			if (list == null || list.isEmpty()) {
				resp.getWriter().print("<html><h2>No Orders Found</h2>");
				req.getRequestDispatcher("CustomerHome.html").include(req, resp);
			} else {
				req.setAttribute("list", list);
				req.getRequestDispatcher("ViewOrders.jsp").forward(req, resp);
			}
		}
	}
}
