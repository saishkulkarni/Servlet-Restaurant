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
		<%for(FoodItem item:items) {%>
		<tr>
			<th><%=item.getId()%></th>
			<th><%=item.getName()%></th>
			<th>
			<%String base64 = Base64.encodeBase64String(item.getPicture());%> 
			<img height="100px" width="100px" alt="unknown"
						src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><%=item.getType()%></th>
			<th><%=item.getPrice()%></th>
			<th><%=item.getStock()%></th>
			<th><a href="edit?id=<%=item.getId()%>"><button>Edit</button></a></th>
			<th><a href="delete?id=<%=item.getId()%>"><button>Delete</button></a></th>
		</tr>
		<%} %>
	</table>
<br>
<a href="AdminHome.html"><button>Back</button></a>
</body>
</html>