package pl.coderslab.finalproject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/register")
public class RegisterController {

    private final UserRepository userRepository;

    public RegisterController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @RequestMapping("")
    public String showForm(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }
    @PostMapping("")
    public String saveUser(@Valid User user, BindingResult result, Model model){
//        if(result.hasErrors()) {
//            model.addAttribute("users", userRepository.findAll());
//            return "user/addAdmin";
//        }
        userRepository.save(user);
        return "redirect:/login";
    }
}
