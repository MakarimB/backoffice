package springboot.projetfinal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import springboot.projetfinal.enums.Role;
import springboot.projetfinal.model.Employee;
import springboot.projetfinal.repo.EmployeeRepository;

import java.util.Arrays;
import java.util.Optional;

@Controller
@RequestMapping("/mvcEmployees")
public class EmployeesController {

    @Autowired
    private EmployeeRepository employeeRepository;

    // Liste des employés
    @GetMapping("/findall")
    public ModelAndView findAll() {
        return new ModelAndView("admin/employees", "liste", employeeRepository.findAll());
    }
    // Affiche le formulaire de création
    @GetMapping("/create")
    public ModelAndView showCreateForm() {
        ModelAndView mv = new ModelAndView("admin/employee");
        mv.addObject("employee", new Employee());
        mv.addObject("roles", Arrays.asList(Role.values())); // pour le select
        return mv;
    }

    //  Traite la création d'un nouvel employé
    @PostMapping("/create")
    public String createEmployee(@ModelAttribute Employee employee,
                                 @RequestParam String confirmPassword,
                                 ModelAndView mv) {
        // Vérification simple du mot de passe
        if (!employee.getPassword().equals(confirmPassword)) {
            mv.addObject("error", "Les mots de passe ne correspondent pas.");
            mv.addObject("roles", Role.values());
            mv.setViewName("admin/employee");
            return mv.getViewName();
        }
        employeeRepository.save(employee);
        return "redirect:/mvcEmployees/findall";
    }

    // Supprime un employé par ID
    @GetMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable int id) {
        employeeRepository.deleteById(id);
        return "redirect:/mvcEmployees/findall";
    }
}
