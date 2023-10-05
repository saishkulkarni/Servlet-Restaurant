package controller;

import java.io.IOException;
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
import dto.FoodItem;

@WebServlet("/removefromcart")
public class RemoveFromCart extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("customer") == null) {
			resp.getWriter().print("<html><h2>Invalid Session</h2>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			int id = Integer.parseInt(req.getParameter("id"));
			MyDao dao = new MyDao();
			FoodItem foodItem = dao.find(id);
			Customer customer = (Customer) req.getSession().getAttribute("customer");
			Cart cart = customer.getCart();
			if(cart==null)
			{
				resp.getWriter().print("<html><h2>No Item in Cart</h2>");
				req.getRequestDispatcher("viewcustomermenu").include(req, resp);
			}
			else {
				List<CustomerFoodItem> list=cart.getFoodItems();
				if(list==null)
				{
					resp.getWriter().print("<html><h2>No Item in Cart</h2>");
					req.getRequestDispatcher("viewcustomermenu").include(req, resp);
				}
				else {
					CustomerFoodItem foodItem2=null;
					for(CustomerFoodItem item:list)
					{
						if(item.getName().equals(foodItem.getName()))
						{
							foodItem2=item;
							break;
						}
					}
					if(foodItem2==null)
					{
						resp.getWriter().print("<html><h2>No Item in Cart</h2>");
						req.getRequestDispatcher("viewcustomermenu").include(req, resp);
					}
					else {
						if(foodItem2.getQuantity()>1)
						{
							foodItem2.setQuantity(foodItem2.getQuantity()-1);
							foodItem2.setPrice(foodItem2.getPrice()-foodItem.getPrice());
							foodItem.setStock(foodItem.getStock()+1);
							dao.update(foodItem);
							dao.update(foodItem2);
						}
						else{
							list.remove(foodItem2);
							foodItem.setStock(foodItem.getStock()+1);
							dao.update(foodItem);
							dao.update(cart);
						}
						req.getSession().removeAttribute("customer");
						req.getSession().setAttribute("customer", dao.findCustomer(customer.getId()));
						
						resp.getWriter().print("<html><h3>Item Removed From Cart Success</h3>");
						req.getRequestDispatcher("viewcustomermenu").include(req, resp);
					}
				}
			}
			
		}
	}
}
