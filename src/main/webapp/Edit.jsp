<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit</title>
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
        
        h2{
			color: red;
			font-size: 25px;
		}
        
        h3{
			color: green;
			font-size: 25px;
		}

        form {
            background-color: #fff;
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            text-align: left;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="file"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="radio"] {
            margin-right: 10px;
        }

        img {
            height: 50px;
            width: 50px;
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

        button[type="reset"] {
            background-color: #ccc;
        }

        button:hover {
            background-color: #005bb7;
        }

        a {
            text-decoration: none;
        }

        a button {
            background-color: #ccc;
        }
    </style>
</head>
<body>
    <h1>Edit</h1>
    <% FoodItem item = (FoodItem) request.getAttribute("item"); %>
    <form action="update" method="post" enctype="multipart/form-data">
        <input type="text" name="id" value="<%=item.getId()%>" hidden=""><br>
        <label for="name">Name:</label>
        <input type="text" name="name" value="<%=item.getName()%>"><br>
        <label for="price">Price:</label>
        <input type="text" name="price" value="<%=item.getPrice()%>"><br>
        <label>Food Type:</label>
        <% if (item.getType().equals("veg")) { %>
            <input type="radio" name="type" value="veg" checked="checked">Veg<br>
            <input type="radio" name="type" value="non-veg">Non-Veg
        <% } else { %>
            <input type="radio" name="type" value="veg">Veg<br>
            <input type="radio" name="type" value="non-veg" checked="checked">Non-Veg
        <% } %>
        <br>
        <label for="quantity">Quantity:</label>
        <input type="text" name="quantity" value="<%=item.getStock()%>"><br>
        <label for="pic">Picture:</label>
        <% String base64 = Base64.encodeBase64String(item.getPicture()); %>
        <img alt="unknown" src="data:image/jpeg;base64,<%=base64%>"><br>
        <input type="file" name="pic"><br>
        <button>Update</button>
        <button type="reset">Cancel</button>
    </form>
    <br>
    <a href="viewmenu"><button>Back</button></a>
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