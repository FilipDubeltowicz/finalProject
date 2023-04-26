<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<ul class="nav flex-column long-bg">
    <li class="nav-item">
        <a class="nav-link" href="/app">
            <span>Pulpit</span>
            <i class="fas fa-angle-right"></i>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/app/game">
            <span>Gry</span>
            <i class="fas fa-angle-right"></i>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/user/edit">
            <span>Edytuj dane</span>
            <i class="fas fa-angle-right"></i>
        </a>
    <li class="nav-item">
        <a class="nav-link disabled" href="/user/logout">
            <span>Wyloguj</span>
            <i class="fas fa-angle-right"></i>
        </a>
    </li>
<%--    to get the isAdmin parameter, needed to modify the @Getter from lombok--%>
    <c:if test="${sessionScope.user.isAdmin == true}">
        <li class="nav-item">
            <a class="nav-link" href="/user/list">
                <span>Użytkownicy</span>
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
    </c:if>
</ul>
