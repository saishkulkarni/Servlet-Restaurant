package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.MyDao;
import dto.FoodItem;

@WebServlet("/update")
@MultipartConfig
public class UpdateItem extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (req.getSession().getAttribute("admin") == null) {
			resp.getWriter().print("<html><h2>Invalid Session</h2>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			double price = Double.parseDouble(req.getParameter("price"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			String type = req.getParameter("type");
			Part part = req.getPart("pic");
			byte[] picture = new byte[part.getInputStream().available()];
			part.getInputStream().read(picture);

			MyDao dao = new MyDao();

			FoodItem item = new FoodItem();
			item.setId(id);
			item.setName(name);
			if (picture.length == 0) {
				item.setPicture(dao.find(id).getPicture());
			} else {
				item.setPicture(picture);
			}
			item.setPrice(price);
			item.setStock(quantity);
			item.setType(type);
			dao.update(item);
			resp.getWriter().print("<html><h3>Data Updated Successfully</h3>");
			req.getRequestDispatcher("viewmenu").include(req, resp);

		}
	}
}