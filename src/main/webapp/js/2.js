let score = 0;
let scoreEl = document.getElementById("score");
const clickMeBtn = document.getElementById("click-me");
const hiddenScoreInput = document.getElementById("hidden-score");

clickMeBtn.addEventListener("click", function() {
    score++;
    scoreEl.innerHTML = "Score: " + score;
    hiddenScoreInput.value = score;
    clickMeBtn.style.top = Math.random() * window.innerHeight + "px";
    clickMeBtn.style.left = Math.random() * window.innerWidth + "px";
});