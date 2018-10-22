package kg.todolist;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @Value("${home.message}")
    private String message;

    @GetMapping("/")
    public String welcome(Map<String, Object> model) {
        model.put("message", this.message);
        return "/home";
    }

}