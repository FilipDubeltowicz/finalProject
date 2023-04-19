<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
    <h3>Top 5 scores in ${game.name}:</h3>
    <tr>
        <th>Nick</th>
        <th>Points</th>
    </tr>
    <tr>
        <c:forEach items="${ranks}" var="rank">
        <td>${rank.user.nickName}</td>
        <td>${rank.points}</td>
    </tr>
    </c:forEach>
</table>