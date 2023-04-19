package pl.coderslab.finalproject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("")
public class AppController {
    private final GameRepository gameRepository;
    private final RankingRepository rankingRepository;

    public AppController(GameRepository gameRepository, RankingRepository rankingRepository) {
        this.gameRepository = gameRepository;
        this.rankingRepository = rankingRepository;
    }

    @RequestMapping("/app")
    public String home(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Game> games = gameRepository.findAll();
        model.addAttribute("user", user);
        model.addAttribute("games", games);
        return "main";
    }
}