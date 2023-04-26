<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../css/style.css">
</head>
<body>

<h1>MAIN PAGE</h1>
<h2>Hello ${user.firstName}, choose your game:</h2>
<ul>
    <c:forEach items="${games}" var="game">
        <li>
            <a href="/app/game/${game.id}">${game.name}</a>
        </li>
    </c:forEach>
</ul>
</body>
</html>
