<%@ page import="com.epam.lowcost.util.Endpoints" %><%--
  Created by IntelliJ IDEA.
  User: Ilia_Stepanov
  Date: 13-Feb-19
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h3>${message}</h3>--%>

<%--<form action="<%=Endpoints.REGISTRATION%>" method="post">--%>
    <%--<input type="email" name="email"/>--%>
    <%--<input type="password" name="password"/>--%>
    <%--<input type="text" name="firstName"/>--%>
    <%--<input type="text" name="lastName"/>--%>
    <%--<input type="text" name="documentInfo"/>--%>
    <%--<input type="datetime-local" name="birthday"/>--%>
    <%--<input type="submit" value="signIn"/>--%>
<%--</form>--%>

<%--<form action=/logout method="post">--%>
    <%--<input type="submit" value="Sign Out"/>--%>
<%--</form>--%>


<%--</body>--%>
<%--</html>--%>


<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>

<div class="container">

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading">Create your account</h2>
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="username" class="form-control" placeholder="Username"
                            autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="passwordConfirm">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="passwordConfirm" class="form-control"
                            placeholder="Confirm your password"></form:input>
                <form:errors path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>