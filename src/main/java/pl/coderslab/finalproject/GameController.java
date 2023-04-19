package pl.coderslab.finalproject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/game")
public class GameController {

    private final GameRepository gameRepository;
    private final RankingRepository rankingRepository;

    public GameController(GameRepository gameRepository, RankingRepository rankingRepository) {
        this.gameRepository = gameRepository;
        this.rankingRepository = rankingRepository;
    }

    @RequestMapping("/{id}")
    public String home(@PathVariable long id, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("ranks", rankingRepository.findTop5ByGameIdOrderByPointsDesc(id));
        model.addAttribute("game",gameRepository.findById(id));
        model.addAttribute("user", user);

        return Long.toString(id);
    }
}