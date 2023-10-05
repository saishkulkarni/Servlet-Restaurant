package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Customer;

@WebServlet("/login")
public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("pass");

		MyDao dao = new MyDao();
		if (email.equals("admin@jsp.com") && password.equals("admin")) {
			resp.getWriter().print("<html><h3>Login Success</h3>");

			req.getSession().setAttribute("admin", "admin");

			req.getRequestDispatcher("AdminHome.html").include(req, resp);
		} else {
			Customer customer = dao.fetchByEmail(email);
			if (customer == null) {
				resp.getWriter().print("<html><h2>Invalid Email</h2>");
				req.getRequestDispatcher("Login.html").include(req, resp);
			} else {
				if (password.equals(customer.getPassword())) {
					resp.getWriter().print("<html><h3>Login Success</h3>");

					req.getSession().setAttribute("customer", customer);

					req.getRequestDispatcher("CustomerHome.html").include(req, resp);
				} else {
					resp.getWriter().print("<html><h2>Invalid Password</h2>");
					req.getRequestDispatcher("Login.html").include(req, resp);
				}
			}
		}
	}
}
