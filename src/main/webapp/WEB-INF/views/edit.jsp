<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="app-header.jsp" %>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@ include file="app-leftnav.jsp" %>
        <div>
            <div class="container w-25">

                <form:form method="post" modelAttribute="user">
                    <form:hidden path="id"/>
                    <label for="firstName">FIRST NAME:</label>
                    <form:input path="firstName"/>
                    <form:errors path="firstName"/>
                    <br>
                    <label for="lastName">LAST NAME:</label>
                    <form:input path="lastName"/>
                    <form:errors path="lastName"/>
                    <br>
                    <label for="nickName">NICK NAME:</label>
                    <form:input path="nickName"/>
                    <form:errors path="nickName"/>
                    <br>
                    <label for="password">PASSWORD:</label>
                    <form:input path="password"/>
                    <form:errors path="password"/>
                    <br>
                    <label for="email">E-MAIL:</label>
                    <form:input path="email"/>
                    <form:errors path="email"/>
                    <br>
                    <input type="submit" value="SAVE">
                </form:form>
            </div>
        </div>
    </div>
</section>
