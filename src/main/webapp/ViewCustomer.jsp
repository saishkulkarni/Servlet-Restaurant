<%@page import="dto.Customer"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
</head>
<body>
	<%
	List<Customer> customers = (List<Customer>) request.getAttribute("list");
	%>

	<table border="1">
		<tr>
			<th>Id</th>
			<th>Full Name</th>
			<th>Picture</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Gender</th>
			<th>Date of Birth</th>
			<th>Delete</th>
		</tr>
		<%for(Customer customer:customers) {%>
		<tr>
			<th><%=customer.getId()%></th>
			<th><%=customer.getFullName()%></th>
			<th>
			<%String base64 = Base64.encodeBase64String(customer.getPicture());%> 
			<img height="100px" width="100px" alt="unknown"
						src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><%=customer.getEmail()%></th>
			<th><%=customer.getMobile()%></th>
			<th><%=customer.getGender()%></th>
			<th><%=customer.getDob()%></th>
			<th><a href="deletecustomer?id=<%=customer.getId()%>"><button>Delete</button></a></th>
		</tr>
		<%} %>
	</table>
<br>
<a href="AdminHome.html"><button>Back</button></a>
</body>
</html>