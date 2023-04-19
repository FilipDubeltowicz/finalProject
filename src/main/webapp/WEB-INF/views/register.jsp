<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
</style>

<body>
<h1>Moja strona główna</h1>
<form:form method="post" modelAttribute="user"><br>
    FIRST NAME: <form:input path="firstName"/>
    <form:errors path="firstName"/><br>
    LAST NAME: <form:input path="lastName"/>
    <form:errors path="lastName"/><br>
    NICK NAME: <form:input path="nickName"/>
    <form:errors path="nickName"/><br>
    PASSWORD: <form:input path="password"/>
    <form:errors path="password"/><br>
    E-MAIL: <form:input path="email"/>
    <form:errors path="email"/><br>

    <input type="submit" value="REGISTER"><br>
</form:form>
</body>
</html>
