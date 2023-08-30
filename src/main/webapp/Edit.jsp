<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
<%FoodItem item=(FoodItem)request.getAttribute("item"); %>

<form action="update" method="post" enctype="multipart/form-data">
	<input type="text" name="id" value="<%=item.getId()%>" hidden=""><br>
	Name:<input type="text" name="name" value="<%=item.getName()%>"><br>
	Price:<input type="text" name="price" value="<%=item.getPrice()%>"><br>
	Food Type: 
	<%if(item.getType().equals("veg")){ %>
	<input type="radio" name="type" value="veg" checked="checked" >Veg<br>
	<input type="radio" name="type" value="non-veg">Non-Veg
	<%}else{ %>
	<input type="radio" name="type" value="veg" >Veg<br>
	<input type="radio" name="type" value="non-veg" checked="checked" >Non-Veg
	<%} %>
	<br>
	Quantity:<input type="text" name="quantity" value="<%=item.getQuantity()%>"><br>
	Picture:
	<%String base64 = Base64.encodeBase64String(item.getPicture());%> 
			<img height="50px" width="50px" alt="unknown"
						src="data:image/jpeg;base64,<%=base64%>">
	<input type="file" name="pic"><br>
	<button>Update</button>
	<button type="reset">Cancel</button>
</form>


</body>
</html>