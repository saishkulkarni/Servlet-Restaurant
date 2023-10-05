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
import dto.CustomerFoodItem;
import dto.FoodItem;

@WebServlet("/viewcustomermenu")
public class CustomerViewMenu extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("customer") == null) {
			resp.getWriter().print("<h2>Invalid Session</h2>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {

			MyDao dao = new MyDao();
			List<FoodItem> items = dao.fetchAllFoodItem();
			if (items.isEmpty()) {
				resp.getWriter().print("<html><h2>No Items Found</h2>");
				req.getRequestDispatcher("CustomerHome.html").include(req, resp);
			} else {
				Customer customer=(Customer) req.getSession().getAttribute("customer");
				List<CustomerFoodItem> cartitems=null;
				if(customer.getCart()!=null && customer.getCart().getFoodItems()!=null)
				cartitems=customer.getCart().getFoodItems();
				req.setAttribute("cartitems", cartitems);
				req.setAttribute("list", items);
				req.getRequestDispatcher("ViewCustomerMenu.jsp").include(req, resp);
			}
		}

	}
}
