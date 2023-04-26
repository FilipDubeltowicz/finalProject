<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="app-header.jsp" %>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@ include file="app-leftnav.jsp" %>
        <div>
            <h3>Klasyfikacja generalna:</h3>
            <table>
                <thead>
                <tr>
                    <th>Użytkownik</th>
                    <th>Suma punktów</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="result" items="${rankingResults}">
                    <tr>
                        <td>${result[0].nickName}</td>
                        <td>${result[1]}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
