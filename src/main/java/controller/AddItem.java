package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.FoodItem;

@WebServlet("/additem")
@MultipartConfig
public class AddItem extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("admin") == null) {
			resp.getWriter().print("<html><h2>Invalid Session</h2>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			String name = req.getParameter("name");
			double price = Double.parseDouble(req.getParameter("price"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			String type = req.getParameter("type");

			byte[] picture = new byte[req.getPart("pic").getInputStream().available()];
			req.getPart("pic").getInputStream().read(picture);

			FoodItem item = new FoodItem();
			item.setName(name);
			item.setPicture(picture);
			item.setPrice(price);
			item.setStock(quantity);
			item.setType(type);

			MyDao dao = new MyDao();
			dao.save(item);

			resp.getWriter().print("<html><h3>Item Added Successfully</h3>");
			req.getRequestDispatcher("AdminHome.html").include(req, resp);

		}
	}
}