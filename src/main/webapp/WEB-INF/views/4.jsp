<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${game.name}</title>
    <style>
        input[type="text"] {
            width: 50px;
            font-size: 20px;
            text-align: center;
        }
        button {
            font-size: 20px;
            margin-left: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>${game.name}</h1>
<p>${game.description}</p>
<p>Score: <span id="score">100</span></p>
<p>Time Remaining: <span id="timer">999</span> seconds</p>
<p>Your Guess: <input type="text" id="guess" maxlength="3" autocomplete="off"> <button onclick="guess()">Guess</button></p>
<p id="feedback"></p>
<form action="/rank/add" method="post">
    <button class="button" type="submit">Save my score</button>
    <input type="hidden" name="score" id="hidden-score" value="">
    <input type="hidden" name="gameId" id="gameId" value="${game.id}">
    <input type="hidden" name="nickName" id="nickName" value="${user.nickName}">
</form>

<%@ include file="top5scores.jsp" %>

<script>
    let max = 1000;
    let secretNumber = Math.floor(Math.random() * max) + 1;
    let score = 100;
    let timer = 999;
    let feedbackEl = document.getElementById("feedback");
    let scoreEl = document.getElementById("score");
    let timerEl = document.getElementById("timer");
    let guessEl = document.getElementById("guess");
    let hiddenScoreInput = document.getElementById("hidden-score");

    guessEl.addEventListener("keydown", function(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            guess();
        }
    });

    function guess() {
        let guess = parseInt(guessEl.value);

        if (isNaN(guess) || guess < 1 || guess > max) {
            feedbackEl.innerHTML = "Please enter a number between 1 and " + max;
            return;
        }

        if (guess === secretNumber) {
            clearInterval(countdown);
            scoreEl.innerHTML = score;
            hiddenScoreInput.value = score;
            feedbackEl.innerHTML = "Congratulations! You guessed the number!";
            guessEl.disabled = true;
        } else {
            score--;
            scoreEl.innerHTML = score;
            hiddenScoreInput.value = score;
            if (guess < secretNumber) {
                feedbackEl.innerHTML = guess + " is too low!";
            } else {
                feedbackEl.innerHTML = guess + " is too high!";
            }
            guessEl.value = "";
            guessEl.focus();
        }

        if (score <= 0) {
            clearInterval(countdown);
            feedbackEl.innerHTML = "Game over! The secret number was " + secretNumber;
            guessEl.disabled = true;
        }
    }

    let countdown = setInterval(function() {
        timer--;
        timerEl.innerHTML = timer;
        if (timer <= 0) {
            clearInterval(countdown);
            feedbackEl.innerHTML = "Time's up! The secret number was " + secretNumber;
            guessEl.disabled = true;
        }
    }, 1000);
</script>
</body>
</html>