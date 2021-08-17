<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: venom
  Date: 8/15/2021
  Time: 3:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

<h3>Enter Your Details</h3>


<spring:form action="./verifyCard" method="post" modelAttribute="login">
    Card ID : <spring:input path="cardId"/><br><br>
    Password : <spring:input type="password" path="password"/>
    <spring:errors path="password" cssClass="error"/><br><br>
    <input type="submit" value="Login">
</spring:form><br><br>

<a href="./" >Go Back to Home</a><br><br>
</body>
</html>
