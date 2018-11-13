package kg.todolist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class TodoRestController {

    @Autowired
    private ListItemRepository items;

    @GetMapping("/items/{id}")
    ListItem getItemById(@PathVariable Integer id){
        return items.getOne(id);
    }

    @DeleteMapping("/items/{id}")
    void deleteItemById(@PathVariable Integer id){
        items.deleteById(id);
    }

    @GetMapping("/items/listall")
    Iterable<ListItem> all(){
        return items.findAll();
    }

    @PostMapping("/items")
    ListItem newItem(@RequestBody ListItem newItem) {
        return items.save(newItem);
    }



}
