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
	margin: 0;
	padding: 0;
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
	margin: 5px;
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

.edit-button {
	background-color: #00cc00;
}

.delete-button {
	background-color: #ff0000;
}
</style>
</head>
<body>
	<h1>Menu</h1>
	<%
	List<FoodItem> items = (List<FoodItem>) request.getAttribute("list");
	%>

	<table border="1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Picture</th>
			<th>Type</th>
			<th>Price</th>
			<th>Stock</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<%
		for (FoodItem item : items) {
		%>
		<tr>
			<td><%=item.getId()%></td>
			<td><%=item.getName()%></td>
			<td>
				<%
				String base64 = Base64.encodeBase64String(item.getPicture());
				%> <img height="100px" width="100px" alt="unknown"
				src="data:image/jpeg;base64,<%=base64%>">
			</td>
			<td><%=item.getType()%></td>
			<td><%=item.getPrice()%></td>
			<td><%=item.getStock()%></td>
			<td><a href="edit?id=<%=item.getId()%>"><button
						class="edit-button">Edit</button></a></td>
			<td><a href="delete?id=<%=item.getId()%>"><button
						class="delete-button">Delete</button></a></td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<a href="AdminHome.html"><button>Back</button></a>
	
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
