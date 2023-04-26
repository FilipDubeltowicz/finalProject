<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="header.jsp" %>
<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                <form:form method="post" modelAttribute="user"><br>
                    E-MAIL: <form:input path="email"/>
                    <form:errors path="email"/><br>
                    PASSWORD: <form:input path="password" type="password"/>
                    <form:errors path="password"/><br>
                    <input type="submit" value="LOGIN"><br>
                </form:form>
            </div>
        </div>
    </div>
</section>
<%@ include file="footer.jsp" %>
