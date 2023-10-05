package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Cart;
import dto.Customer;
import dto.CustomerFoodItem;

@WebServlet("/viewcart")
public class CustomerViewCart extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("customer") == null) {
			resp.getWriter().print("<html><h2>Invalid Session</h2>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			Customer customer = (Customer) req.getSession().getAttribute("customer");
			Cart cart = customer.getCart();
			if (cart == null) {
				resp.getWriter().print("<html><h2>No Items in Cart</h2>");
				req.getRequestDispatcher("viewcustomermenu").include(req, resp);
			} else {
				List<CustomerFoodItem> list = cart.getFoodItems();
				if (list == null) {
					resp.getWriter().print("<html><h2>No Items in Cart</h2>");
					req.getRequestDispatcher("viewcustomermenu").include(req, resp);
				} else {
					boolean flag = false;
					for (CustomerFoodItem foodItem : list) {
						if (foodItem.getQuantity() > 0) {
							flag = true;
							break;
						}
					}
					if (flag) {
						req.setAttribute("list", list);
						req.getRequestDispatcher("ViewCart.jsp").forward(req, resp);
					} else {
						resp.getWriter().print("<html><h2>No Items in Cart</h2>");
						req.getRequestDispatcher("viewcustomermenu").include(req, resp);
					}
				}
			}
		}
	}
}
