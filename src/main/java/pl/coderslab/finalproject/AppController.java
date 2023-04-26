package pl.coderslab.finalproject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.finalproject.game.Game;
import pl.coderslab.finalproject.game.GameRepository;
import pl.coderslab.finalproject.ranking.RankingRepository;
import pl.coderslab.finalproject.user.User;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {
    private final GameRepository gameRepository;
    private final RankingRepository rankingRepository;

    public AppController(GameRepository gameRepository, RankingRepository rankingRepository) {
        this.gameRepository = gameRepository;
        this.rankingRepository = rankingRepository;
    }

    @RequestMapping("")
    public String dashboard(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Game> games = gameRepository.findAll();
        model.addAttribute("user", user);
        model.addAttribute("games", games);
        List<Object[]> rankingResults = rankingRepository.generalRanking();
        model.addAttribute("rankingResults", rankingResults);
        return "dashboard";
    }
}