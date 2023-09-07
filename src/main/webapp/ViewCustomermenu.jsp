<%@page import="dto.CustomerFoodItem"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
	<th>Reduce</th>
	<th>Quantity</th>
	<th>Add</th>
	</tr>
	
	<%for(FoodItem item:items) {%>
		<tr>
			<th>
			<%String base64 = Base64.encodeBase64String(item.getPicture());%> 
			<img height="100px" width="100px" alt="unknown"
						src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><%=item.getName()%></th>
			<th><%=item.getType()%></th>
			<th><%=item.getPrice()%>&#8377</th>
			<th><a href="removefromcart?id=<%=item.getId()%>"><button>-</button></a></th>
			<th>
		<%if(cartitems==null){ %>0<%}else{
			for(CustomerFoodItem foodItem:cartitems)
			{
				if(foodItem.getName().equals(item.getName())){%>
					<%=foodItem.getQuantity()%>
			<%}
			}
		} %>
			</th>
			<th><a href="addtocart?id=<%=item.getId()%>"><button>+</button></a></th>
		</tr>
		<%} %>
		
	</table>
	<br>
	<a href=""><button>View Cart</button></a>
	<a href="CustomerHome.html"><button>Back</button></a>
</body>
</html>