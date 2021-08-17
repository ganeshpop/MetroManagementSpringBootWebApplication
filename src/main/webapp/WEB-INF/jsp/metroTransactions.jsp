<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Transactions</title>
</head>
<body>
<h2>Welcome ${card.cardId}!</h2>

<h1>Transactions</h1>

<c:if test="${not empty transactions}">
<table border="1">
    <tr>
        <td>Card ID </td>
        <td>Swipe In Time </td>
        <td>Source Station ID</td>
        <td>Source Station Name</td>
        <td>Destination Station ID</td>
        <td>Destination Station Name</td>
        <td>Swipe Out Time </td>
        <td>Travel Fare </td>
        <td>Fine  </td>
        <td>Total Fare </td>
        <td>Travel Duration </td>
    </tr>
    <c:forEach items="${transactions}" var="transaction">
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
    </c:forEach>
</table>
</c:if>
<c:if test="${empty transactions}">
    <h3>No Transactions Found</h3>
</c:if>
<a href="menu" >Go Back to Menu</a><br><br>
<a href="./" >Go Back to Home</a><br><br>
</body>
</html>