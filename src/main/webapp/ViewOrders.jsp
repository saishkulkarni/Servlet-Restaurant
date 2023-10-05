<%@page import="dto.CustomerFoodItem"%>
<%@page import="dto.CustomerOrder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Orders</title>
    <style>
        /* Reset default margin and padding */
        body, table {
            margin: 0;
            padding: 0;
        }

        /* Page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            text-align: center;
        }

        /* Table styling */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: #fff;
        }

        /* Back button */
        .back-button {
            text-align: center;
            margin-top: 20px;
        }

        /* Hide elements after 1 second */
        .hidden {
            display: none;
        }
    </style>
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
            <th>Total Price (₹)</th>
            <th>Items</th>
        </tr>
        <%
        for (CustomerOrder order : list) {
        %>
        <tr>
            <td><%=order.getId()%></td>
            <td><%=order.getOrderTime()%></td>
            <td><%=order.getDeliveryTime()%></td>
            <td><%=order.getTotalPrice()%></td>
            <td>
                <%
                for (CustomerFoodItem foodItem : order.getFoodItems()) {
                %>
                <%=foodItem.getName() %>-<%=foodItem.getQuantity() %>,
                <%
                }
                %>
            </td>
        </tr>
        <%
        }
        %>
    </table>
    <br>
    <div class="back-button">
        <a href="CustomerHome.html"><button>Back</button></a>
    </div>

    <!-- JavaScript to hide elements after 1 second -->
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
