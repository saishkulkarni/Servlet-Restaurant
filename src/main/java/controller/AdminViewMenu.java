package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.FoodItem;

@WebServlet("/viewmenu")
public class AdminViewMenu extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("admin") == null) {
			resp.getWriter().print("<h2>Invalid Session</h2>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			MyDao dao = new MyDao();
			List<FoodItem> items = dao.fetchAllFoodItem();
			if (items.isEmpty()) {
				resp.getWriter().print("<h2>No Items Found</h2>");
				req.getRequestDispatcher("AdminHome.html").include(req, resp);
			} else {
				req.setAttribute("list", items);
				req.getRequestDispatcher("ViewMenu.jsp").include(req, resp);
			}
		}
	}
}
