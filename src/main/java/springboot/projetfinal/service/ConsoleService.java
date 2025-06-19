package springboot.projetfinal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;
import springboot.projetfinal.enums.Category;
import springboot.projetfinal.enums.Role;
import springboot.projetfinal.enums.Slot;
import springboot.projetfinal.enums.Status;
import springboot.projetfinal.model.*;
import springboot.projetfinal.repo.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ConsoleService implements CommandLineRunner {


    @Override
    public void run(String... args) throws Exception {

    }
}