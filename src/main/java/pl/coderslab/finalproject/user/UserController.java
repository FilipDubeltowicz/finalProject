package pl.coderslab.finalproject.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @RequestMapping("/register")
    public String showRegisterForm(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register")
    public String saveUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "register";
        } else {
            user.setBlocked(false);
            user.setAdmin(false);
            userRepository.save(user);
            return "redirect:/user/login";
        }
    }

    @RequestMapping("/login")
    public String showLoginForm(Model model, HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "redirect:/app";
        } else {
            User user = new User();
            model.addAttribute("user", user);
            return "login";
        }
    }

    @PostMapping("/login")
    public String loginUser(User user, HttpSession session, Model model) {
        User userFromDb = userRepository.getUserByEmail(user.getEmail());
        if (userRepository.isValid(user.getEmail(), user.getPassword()) && !userFromDb.isBlocked()) {
            session.setAttribute("user", userRepository.getUserByEmail(user.getEmail()));
            return "redirect:/app";
        } else {
            model.addAttribute("error", "Nieprawidłowy login lub hasło");
            user.setNickName("");
            user.setPassword("");
            model.addAttribute("user", user);
            return "login";
        }
    }

    @RequestMapping("/edit")
    public String showEditForm(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Long userId = user.getId();
        model.addAttribute("user", userRepository.getUserById(userId));
        return "edit";
    }

    @PostMapping("/edit")
    public String editUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "edit";
        } else {
            userRepository.save(user);
            return "redirect:/app";
        }
    }

    @RequestMapping("/logout")
    public String logoutUser(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/user/login";
    }

    @RequestMapping("/list")
    public String listAll(Model model) {
        List<User> allUsers = userRepository.findAll();
        model.addAttribute("allUsers", allUsers);
        return "list";
    }
}