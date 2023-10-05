package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Cart;
import dto.Customer;
import dto.CustomerFoodItem;
import dto.CustomerOrder;

@WebServlet("/placeorder")
public class PlaceOrder extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("customer") == null) {
			resp.getWriter().print("<html><h2>Invalid Session</h2>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			MyDao dao = new MyDao();
			Customer customer = (Customer) req.getSession().getAttribute("customer");
			Cart cart = customer.getCart();
			if (cart == null) {
				resp.getWriter().print("<html><h2>No Item in Cart</h2>");
				req.getRequestDispatcher("viewcustomermenu").include(req, resp);
			} else {
				CustomerOrder order = new CustomerOrder();
				order.setOrderTime(LocalDateTime.now());
				order.setDeliveryTime(LocalDateTime.now().plusHours(1));

				List<CustomerFoodItem> foodItems = cart.getFoodItems();
				double sum = foodItems.stream().mapToDouble(x -> x.getPrice()).sum();
				order.setTotalPrice(sum);
				order.setFoodItems(foodItems);

				List<CustomerOrder> list = customer.getCustomerOrders();

				if (list == null)
					list = new ArrayList<CustomerOrder>();

				list.add(order);
				customer.setCustomerOrders(list);
				customer.setCart(null);

				dao.update(customer);

				req.getSession().removeAttribute("customer");
				req.getSession().setAttribute("customer", dao.findCustomer(customer.getId()));

				resp.getWriter().print("<html><h3>Order Placed Success</h3>");
				req.getRequestDispatcher("CustomerHome.html").include(req, resp);

			}
		}
	}
}
