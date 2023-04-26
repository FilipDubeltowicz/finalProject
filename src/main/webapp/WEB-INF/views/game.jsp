<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="app-header.jsp" %>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@ include file="app-leftnav.jsp" %>

        <div class="m-4 p-4 width-medium">
            <h2>Hello ${user.firstName}, choose your game:</h2>
            <ul>
                <c:forEach items="${games}" var="game">
                    <li>
                        <a href="/app/game/${game.id}">${game.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</section>
