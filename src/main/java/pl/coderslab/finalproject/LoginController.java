package pl.coderslab.finalproject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {
private final UserRepository userRepository;

    public LoginController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @RequestMapping("")
    public String home(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "login";
    }
    @PostMapping("")
    public String login(User user, HttpSession session, Model model){
        User userFromDb = userRepository.getUserByNickName(user.getNickName());
        if (userRepository.isValid(user.getNickName(), user.getPassword()) && !userFromDb.isBlocked()){
            session.setAttribute("user", userRepository.getUserByNickName(user.getNickName()));
            return "redirect:/app";
        } else {
            model.addAttribute("error", "Nieprawidłowy login lub hasło");
            user.setNickName("");
            user.setPassword("");
            model.addAttribute("user", user);
            return "login";
        }
    }
}