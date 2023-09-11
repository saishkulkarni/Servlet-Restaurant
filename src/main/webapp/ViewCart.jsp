<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.CustomerFoodItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
</head>
<body>
	<%
	List<CustomerFoodItem> list = (List<CustomerFoodItem>) request.getAttribute("list");
	%>

	<table border="1">

		<tr>
			<th>Picture</th>
			<th>Name</th>
			<th>Type</th>
			<th>Cost</th>
			<th>Quantity</th>
			<th>Price</th>
		</tr>
<%double sum=0; %>
		<%
		for (CustomerFoodItem item : list) {
			sum=sum+item.getPrice();
		%>
		<tr>
			<th>
				<%
				String base64 = Base64.encodeBase64String(item.getPicture());
				%> <img
				height="100px" width="100px" alt="unknown"
				src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><%=item.getName()%></th>
			<th><%=item.getType()%></th>
			<th><%=item.getPrice()/item.getQuantity()%>&#8377</th>
			<th><%=item.getQuantity()%></th>
			<th><%=item.getPrice()%>&#8377</th>
		</tr>
		<%
		}
		%>
	<tr>
	<th colspan="5">Total Price is :</th>
	<th><%=sum %>&#8377</th>
	</tr>
	</table>
	<br>
	<a href="viewcustomermenu"><button>Back</button></a>
	<a href="placeorder"><button>Place Order</button></a>
</body>
</html>