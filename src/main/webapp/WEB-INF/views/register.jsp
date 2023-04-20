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

<form:form method="post" modelAttribute="user">
    <label for="firstName">FIRST NAME:</label>
    <form:input path="firstName"/>
    <form:errors path="firstName"/>

    <label for="lastName">LAST NAME:</label>
    <form:input path="lastName"/>
    <form:errors path="lastName"/>

    <label for="nickName">NICK NAME:</label>
    <form:input path="nickName"/>
    <form:errors path="nickName"/>

    <label for="password">PASSWORD:</label>
    <form:input path="password"/>
    <form:errors path="password"/>

    <label for="email">E-MAIL:</label>
    <form:input path="email"/>
    <form:errors path="email"/>

    <input type="submit" value="REGISTER">
</form:form>

</body>
</html>
