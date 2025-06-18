package springboot.projetfinal.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import springboot.projetfinal.model.Employee;
import springboot.projetfinal.repo.EmployeeRepository;

import java.util.Optional;

@Controller
public class LoginController {

    @Autowired
    private EmployeeRepository employeeRepository;

    @GetMapping("/login")
    public String loginPage(HttpSession session) {
        System.out.println("je suis la dans le get");
        if (session.getAttribute("user") != null) {
            return "redirect:/home"; // déja connecté
        }
        return "login"; // page login.jsp
    }



    @PostMapping("/login")
    public String doLogin(@RequestParam String login,
                          @RequestParam String password,
                          HttpSession session,
                          Model model) {




        if (login == null || password == null || login.isBlank() || password.isBlank()) {
            model.addAttribute("error", "Veuillez remplir tous les champs.");
            System.out.println("ERROR ERROE NULL");
            return "login";

        }

        // Recherche par username (login)
        Optional<Employee> employee = employeeRepository.findByLogin(login);
        System.out.println("mon employee "+login+employee.get().getPassword());

        if (employee.isPresent() && password.equals(employee.get().getPassword())) {
            // Auth OK : on stocke l'objet Employee en session
            System.out.println("Connexion reussie");
            session.setAttribute("user", employee.get());
            return "redirect:/home";
        } else {
            model.addAttribute("error", "Nom d'utilisateur ou mot de passe incorrect.");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
