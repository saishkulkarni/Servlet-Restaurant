<%@page import="dto.CustomerFoodItem"%>
<%@page import="dto.CustomerOrder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Orders</title>
</head>
<body>
	<%
	List<CustomerOrder> list = (List<CustomerOrder>) request.getAttribute("list");
	%>
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Order Time</th>
			<th>Delivery Time</th>
			<th>Total Price</th>
			<th>Items</th>
		</tr>
		<%
		for (CustomerOrder order : list) {
		%>
		<tr>
			<td><%=order.getId()%></td>
			<td><%=order.getOrderTime()%></td>
			<td><%=order.getDeliveryTime()%></td>
			<td><%=order.getTotalPrice()%>&#8377</td>
			<td>
			<%for(CustomerFoodItem foodItem:order.getFoodItems()){ %>
			<%=foodItem.getName() %>-<%=foodItem.getQuantity() %>,
			<%} %>
			</td>
			<%} %>
	</table>
	<br>
	<a href="CustomerHome.html"><button>Back</button></a>
</body>
</html>