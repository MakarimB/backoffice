package springboot.projetfinal.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import springboot.projetfinal.model.Employee;


@Controller
public class HomeController {

    @GetMapping({"/", "/home"})
    public String homePage(HttpSession session, Model model) {
        Employee employee = (Employee) session.getAttribute("user");
        if (employee != null) {
            model.addAttribute("username", employee.getLogin());
        } else {
            model.addAttribute("username", null);
        }
        return "home";  // home.jsp
    }
}

