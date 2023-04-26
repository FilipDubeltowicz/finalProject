<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="app-header.jsp" %>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@ include file="app-leftnav.jsp" %>
        <div>
            <h3>List of all users:</h3>
            <table>
                <thead>
                <tr>
                    <th>Nick</th>
                    <th>Forst Name</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${allUsers}">
                    <tr>
                        <td>${user.nickName}</td>
                        <td>${user.firstName}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
