package springboot.projetfinal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import springboot.projetfinal.enums.Category;
import springboot.projetfinal.model.Item;

import java.util.Arrays;

@Controller
@RequestMapping("/test")
public class TestController {

    @GetMapping("")
    public ModelAndView showCreateForm() {
        ModelAndView mv = new ModelAndView("test");
        return mv;
    }
}
