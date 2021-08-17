<%@page import="java.util.Collection" %>
<%@ page import="com.metro.model.pojos.Card" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Swipe Out</title>
</head>
<body>
<h2>Welcome ${card.cardId}!</h2>

<h1>Swipe Out</h1>
<h3>Your Card [${card.cardId}] Balance is ${card.balance}/-</h3>
<form action="./cardSwipeOut" method="post">
    <h2>Select A Station to Swipe Out:</h2>
    <h3>[ Station ID -- Station Name ]</h3>

    <c:forEach items="${stations}" var="station">
        <label>
            <input type="radio" name="swipeOutStation" value="${station.stationId}">
        </label>
        <h3>[${station.stationId}  --  ${station.stationName } ]</h3><br><br>
    </c:forEach>
    <input type="submit" value="Swipe Out"><br><br>
</form>
<a href="menu" >Go Back to Menu</a><br><br>
<a href="./" >Go Back to Home</a><br><br>
</body>
</html>