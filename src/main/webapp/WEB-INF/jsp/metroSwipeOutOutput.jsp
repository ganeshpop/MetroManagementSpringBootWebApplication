<%--
  Created by IntelliJ IDEA.
  User: venom
  Date: 8/15/2021
  Time: 10:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Swipe Out Status</title>
</head>
<body>
<h2>Welcome ${card.cardId}!</h2>


<h3>${message}</h3>
<table border="1">
    <tr>
        <td>Card ID</td>
        <td>Swipe In Time</td>
        <td>Source Station ID</td>
        <td>Source Station Name</td>
        <td>Destination Station ID</td>
        <td>Destination Station Name</td>
        <td>Swipe Out Time</td>
        <td>Travel Fare</td>
        <td>Fine</td>
        <td>Total Fare</td>
        <td>Travel Duration</td>
    </tr>
    <tr>
        <td>${transaction.cardId }</td>
        <td>${transaction.swipeInTimeStamp}</td>
        <td>${transaction.sourceStation.stationId}</td>
        <td>${transaction.sourceStation.stationName}</td>
        <td>${transaction.destinationStation.stationId}</td>
        <td>${transaction.destinationStation.stationName}</td>
        <td>${transaction.swipeOutTimeStamp}</td>
        <td>${transaction.fare}</td>
        <td>${transaction.fine}</td>
        <td>${transaction.fare + transaction.fine}</td>
        <td>${transaction.duration}</td>
    </tr>
</table>
<a href="menu">Go Back to Menu</a><br><br>
<a href="./">Go Back to Home</a><br><br>
</body>
</html>
