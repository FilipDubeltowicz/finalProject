<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="app-header.jsp" %>

<style>
    #score {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    #click-me {
        padding: 10px;
        font-size: 16px;
        cursor: pointer;
        position: absolute;
        top: 50%;
        left: 50%;
        width: 150px;
        height: 150px;
    }
    #click-me img {
        width: 100%;
        height: 100%;
    }
    .button {
        padding: 10px;
        font-size: 16px;
        cursor: pointer;
    }
    form {
        display: inline-block;
    }
</style>

<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <%@ include file="app-leftnav.jsp" %>

        <div class="m-4 p-4 width-medium">
            <h1>${game.name}</h1>
            <h2>${game.description}</h2>
            <div id="score">Score: 0</div>
            <h3 id="countdown">Time remaining: 30</h3>
            <button id="click-me" ><img src="https://www.freepnglogos.com/uploads/minecraft-png/creeper-minecraft-image-pixabay-14.png" /></button>

            <form action="/rank/add" method="post">
                <button class="button" type="submit">Save my score</button>
                <input type="hidden" name="score" id="hidden-score" value="${score}">
                <input type="hidden" name="gameId" id="gameId" value="${game.id}">
                <input type="hidden" name="nickName" id="nickName" value="${user.nickName}">
            </form>
            <br>
            <%@ include file="top5scores.jsp" %>

            <script>
                let score = +0;
                let scoreEl = document.getElementById("score");
                const clickMeBtn = document.getElementById("click-me");
                const hiddenScoreInput = document.getElementById("hidden-score");
                const countdownEl = document.getElementById("countdown");

                let timeLeft = 30;
                let timer;

                const startTimer = function() {
                    timer = setInterval(function() {
                        timeLeft--;
                        countdownEl.innerHTML = "Time remaining: " + timeLeft;
                        if (timeLeft <= 0) {
                            clearInterval(timer);
                            clickMeBtn.removeEventListener("click", clickHandler);
                            alert("Time's up! You scored " + score + " points. Remember to save your score.");
                        }
                    }, 1000);
                };

                const clickHandler = function() {
                    score++;
                    scoreEl.innerHTML = "Score: " + score;
                    hiddenScoreInput.value = score;
                    if (!timer) {
                        startTimer();
                    }
                    clickMeBtn.style.top = Math.random() * (window.innerHeight - 100) + 50 + "px";
                    clickMeBtn.style.left = Math.random() * (window.innerHeight - 50) + 50 + "px";
                };

                clickMeBtn.addEventListener("click", clickHandler);
            </script>
        </div>
    </div>
</section>
