package kg.todolist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {
    @Autowired
    private ListItemRepository items;

    @GetMapping("/")
    public String welcome(ModelMap modelMap) {
      //  modelMap.pu("list_items", items.findAll());
        modelMap.put("items", items.findAll());
        return "/home";
    }
}