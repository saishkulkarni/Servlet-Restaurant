<%@page import="dto.Customer"%>
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
	width: 90%;
	margin-left:100px;
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
	background-color: red;
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
	<h1>Customers</h1>
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
		<%
		for (Customer customer : customers) {
		%>
		<tr>
			<td><%=customer.getId()%></td>
			<td><%=customer.getFullName()%></td>
			<td>
				<%
				String base64 = Base64.encodeBase64String(customer.getPicture());
				%> <img alt="unknown" src="data:image/jpeg;base64,<%=base64%>">
			</td>
			<td><%=customer.getEmail()%></td>
			<td><%=customer.getMobile()%></td>
			<td><%=customer.getGender()%></td>
			<td><%=customer.getDob()%></td>
			<td><a class="delete-button"
				href="deletecustomer?id=<%=customer.getId()%>"><button>Delete</button></a></td>
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
