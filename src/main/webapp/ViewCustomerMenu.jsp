<%@page import="dto.CustomerFoodItem"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
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
	margin-left:100px;
	width: 90%;
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
	font-size: 30px;
}
</style>
</head>
<body>
	<h1>Menu</h1>
	<%
	List<FoodItem> items = (List<FoodItem>) request.getAttribute("list");
	List<CustomerFoodItem> cartitems = (List<CustomerFoodItem>) request.getAttribute("cartitems");
	%>

	<table border="1">
		<tr>
			<th>Picture</th>
			<th>Name</th>
			<th>Type</th>
			<th>Price</th>
			<th>Available</th>
			<th>Reduce</th>
			<th>Quantity</th>
			<th>Add</th>
		</tr>
		<%
		for (FoodItem item : items) {
		%>
		<tr>
			<td>
				<%
				String base64 = Base64.encodeBase64String(item.getPicture());
				%> <img alt="unknown" src="data:image/jpeg;base64,<%=base64%>">
			</td>
			<td><%=item.getName()%></td>
			<td><%=item.getType()%></td>
			<td><%=item.getPrice()%>&#8377</td>
			<td><%=item.getStock()%></td>
			<td><a href="removefromcart?id=<%=item.getId()%>">-</a></td>
			<td>
				<%
				if (cartitems == null) {
				%>0 <%
				} else {
				boolean flag = true;
				for (CustomerFoodItem foodItem : cartitems) {
					if (foodItem.getName().equals(item.getName())) {
				%> <%=foodItem.getQuantity()%> <%
 flag = false;
 }
 }
 if (flag) {
 %> <%=0%> <%
 }
 }
 %>
			</td>
			<td><a href="addtocart?id=<%=item.getId()%>">+</a></td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<a href="viewcart"><button>View Cart</button></a>
	<a href="CustomerHome.html"><button>Back</button></a>
	
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
