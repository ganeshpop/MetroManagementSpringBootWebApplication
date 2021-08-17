<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: venom
  Date: 8/15/2021
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Password Change</title>
</head>
<body>
<h2>Welcome ${card.cardId}!</h2>
<h3>Enter The Following Details</h3>

<spring:form action="./changePassword" method="post" modelAttribute="password">
    Old Password: <spring:input type="password" path="oldPassword"/>
    <spring:errors path="oldPassword" cssClass="error"/><br><br>
    New Password : <spring:input type="password" path="newPasswordOne"/>
    <spring:errors path="newPasswordOne" cssClass="error"/><br><br>
    Conform New Password : <spring:input type="password" path="newPasswordTwo"/>
    <spring:errors path="newPasswordTwo" cssClass="error"/><br><br>
    <input type="submit" value="Change Password">
</spring:form><br><br>

<a href="menu" >Go Back to Menu</a><br><br>
<a href="./" >Go Back to Home</a><br><br>
</body>
</html>
