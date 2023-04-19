package pl.coderslab.finalproject.ranking;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.finalproject.game.GameRepository;
import pl.coderslab.finalproject.user.UserRepository;

import java.time.LocalDate;

@Controller
@RequestMapping("/rank")
public class RankingController {
    private final RankingRepository rankingRepository;
    private final UserRepository userRepository;
    private final GameRepository gameRepository;

    public RankingController(RankingRepository rankingRepository, UserRepository userRepository, GameRepository gameRepository) {
        this.rankingRepository = rankingRepository;
        this.userRepository = userRepository;
        this.gameRepository = gameRepository;
    }

    @PostMapping("/add")
    public String addRank(@RequestParam("score") int score,
                          @RequestParam("nickName") String nickName,
                          @RequestParam("gameId") long gameId) {

        Ranking ranking = new Ranking();

        ranking.setPoints(score);
        ranking.setUser(userRepository.getUserByNickName(nickName));
        ranking.setGame(gameRepository.getReferenceById(gameId));
        ranking.setDate(LocalDate.now());

        rankingRepository.save(ranking);

        return "redirect:/app";
    }
}