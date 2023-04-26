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
public class IndexController {
    public String index() {
        return "index";
    }
}