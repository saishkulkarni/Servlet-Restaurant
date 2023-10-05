package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.MyDao;
import dto.Customer;

@WebServlet("/signup")
@MultipartConfig
public class CustomerSignup extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullName = req.getParameter("fullname");
		String password = req.getParameter("password");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String country = req.getParameter("country");
		LocalDate dob = LocalDate.parse(req.getParameter("dob"));
		int age = Period.between(dob, LocalDate.now()).getYears();

		Part pic = req.getPart("picture");
		byte[] picture = null;
		picture = new byte[pic.getInputStream().available()];
		pic.getInputStream().read(picture);

		MyDao dao = new MyDao();

		if (dao.fetchByEmail(email) == null && dao.fetchByMobile(mobile) == null) {
			Customer customer = new Customer();
			customer.setAge(age);
			customer.setCountry(country);
			customer.setDob(dob);
			customer.setEmail(email);
			customer.setFullName(fullName);
			customer.setGender(gender);
			customer.setMobile(mobile);
			customer.setPassword(password);
			customer.setPicture(picture);

			dao.save(customer);

			resp.getWriter().print("<html><h3>Account Created Successfully</h3>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			resp.getWriter().print("<html><h2>Email and Mobile should be Unique</h2>");
			req.getRequestDispatcher("Signup.html").include(req, resp);
		}
	}
}