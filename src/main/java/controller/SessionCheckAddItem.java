package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/additemsession")
public class SessionCheckAddItem extends HttpServlet
{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	if (req.getSession().getAttribute("admin") == null) {
		resp.getWriter().print("<html><h2>Invalid Session</h2>");
		req.getRequestDispatcher("Login.html").include(req, resp);
	} else {
		req.getRequestDispatcher("AddItem.html").include(req, resp);
	}
}
}
