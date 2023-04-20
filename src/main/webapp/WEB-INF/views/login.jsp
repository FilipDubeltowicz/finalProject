<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    form {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    form label {
        margin-right: 10px;
    }

    form input {
        margin-bottom: 10px;
    }
</style>

<body>
<h1>Moja strona główna</h1>
<form:form method="post" modelAttribute="user"><br>
    NICK NAME: <form:input path="nickName"/>
    <form:errors path="nickName"/><br>
    PASSWORD: <form:input path="password"/>
    <form:errors path="password"/><br>

    <input type="submit" value="LOGIN"><br>
</form:form>
<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>
</body>
</html>
