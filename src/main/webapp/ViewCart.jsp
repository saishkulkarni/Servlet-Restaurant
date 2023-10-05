<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.CustomerFoodItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	text-align: center;
}

h1 {
	color: #0073e6;
	margin-top: 30px;
}

h2 {
	color: red;
	font-size: 25px;
}

h3 {
	color: green;
	font-size: 25px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #0073e6;
	color: #fff;
}

img {
	height: 100px;
	width: 100px;
}

button {
	background-color: #0073e6;
	color: #fff;
	border: none;
	padding: 10px 20px;
	margin-top: 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #005bb7;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<h1>Cart</h1>
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
		<%
		double sum = 0;
		for (CustomerFoodItem item : list) {
			sum = sum + item.getPrice();
		%>
		<tr>
			<td>
				<%
				String base64 = Base64.encodeBase64String(item.getPicture());
				%> <img alt="unknown" src="data:image/jpeg;base64,<%=base64%>">
			</td>
			<td><%=item.getName()%></td>
			<td><%=item.getType()%></td>
			<td><%=item.getPrice() / item.getQuantity()%>₹</td>
			<td><%=item.getQuantity()%></td>
			<td><%=item.getPrice()%>&#8377</td>
		</tr>
		<%
		}
		%>
		<tr>
			<td colspan="5">Total Price is :</td>
			<th><%=sum%>&#8377</th>
		</tr>
	</table>
	<br>
	<a href="viewcustomermenu"><button>Back</button></a>
	<a href="placeorder"><button>Place Order</button></a>
	<script>
        setTimeout(function () {
            // Select h2 and h3 elements and hide them
            var h2Element = document.querySelector('h2');
            var h3Element = document.querySelector('h3');
            
            if (h2Element) {
                h2Element.style.display = 'none';
            }
            
            if (h3Element) {
                h3Element.style.display = 'none';
            }
        }, 1000); // 1000 milliseconds = 1 second
    </script>
</body>
</html>
