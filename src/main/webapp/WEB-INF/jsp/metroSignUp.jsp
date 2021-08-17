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
    <title>SignUp</title>
</head>
<body>
<h3>Welcome</h3>
<h3>Enter The Following Details</h3>

<spring:form action="./createCard" method="post" modelAttribute="signup">
    Enter Your Name: <spring:input path="userName"/>
    <spring:errors path="userName" cssClass="error"/><br><br>
    Enter initial Balance: <spring:input path="balance"/>
    <spring:errors path="balance" cssClass="error"/><br><br>
    Password : <spring:input type="password" path="passwordOne"/>
    <spring:errors path="passwordOne" cssClass="error"/><br><br>
    Conform Password : <spring:input type="password" path="passwordTwo"/>
    <spring:errors path="passwordTwo" cssClass="error"/><br><br>
    <input type="submit" value="Sign Up">
</spring:form><br><br>

<a href="./" >Go Back to Home</a><br><br>
</body>
</html>
