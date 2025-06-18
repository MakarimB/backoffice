package springboot.projetfinal.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import springboot.projetfinal.model.Employee;
import springboot.projetfinal.repo.EmployeeRepository;
@Controller
@RequestMapping("/mvcAccount")
public class AccountController {

    @Autowired
    private EmployeeRepository employeeRepository;

    @GetMapping("")
    public String accountPage(HttpSession session, Model model) {
        Employee loggedUser = (Employee) session.getAttribute("user");
        if (loggedUser == null) {
            return "redirect:/login";
        }
        model.addAttribute("employee", loggedUser);
        return "employee/account";  // account.jsp
    }

    @PostMapping("/update")
    public String updateAccount(@RequestParam String firstname,
                                @RequestParam String lastname,
                                @RequestParam(required = false) String currentPassword,
                                @RequestParam(required = false) String newPassword,
                                @RequestParam(required = false) String confirmPassword,
                                HttpSession session,
                                Model model) {

        Employee loggedUser = (Employee) session.getAttribute("user");
        if (loggedUser == null) {
            return "redirect:/login";
        }

        // Vérifie que le prénom et nom ne sont pas vides
        if (firstname == null || firstname.isBlank() || lastname == null || lastname.isBlank()) {
            model.addAttribute("error", "Le prénom et le nom ne peuvent pas être vides.");
            model.addAttribute("employee", loggedUser);
            return "employee/account";
        }

        // Gestion du mot de passe uniquement si l'utilisateur a rempli les champs
        if (currentPassword != null && !currentPassword.isBlank()) {

            // Vérifie si l'ancien mot de passe est correct
            if (!currentPassword.equals(loggedUser.getPassword())) {
                model.addAttribute("error", "Le mot de passe actuel est incorrect.");
                model.addAttribute("employee", loggedUser);
                return "employee/account";
            }

            // Vérifie si le nouveau mot de passe est correctement confirmé
            if (newPassword == null || confirmPassword == null || !newPassword.equals(confirmPassword)) {
                model.addAttribute("error", "Le nouveau mot de passe et sa confirmation ne correspondent pas.");
                model.addAttribute("employee", loggedUser);
                return "employee/account";
            }

            // Mise à jour du mot de passe
            loggedUser.setPassword(newPassword); // ⚠️ À hasher si projet réel
        }

        // Mise à jour des infos de base
        loggedUser.setFirstname(firstname);
        loggedUser.setLastname(lastname);

        employeeRepository.save(loggedUser);
        session.setAttribute("user", loggedUser);

        return "redirect:/home";
    }
}