package springboot.projetfinal.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import springboot.projetfinal.model.*;
import springboot.projetfinal.repo.*;

import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/mvcStats")
public class MvcStatsController {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderLineRepository orderLineRepository;

    @Autowired
    private ReservationRepository reservationRepository;

    @GetMapping("")
    public ModelAndView showStats() {
        ModelAndView mv = new ModelAndView("stats/stats");

        List<Customer> allCustomers = customerRepository.findAll();
        List<Item> allItems = itemRepository.findAll();
        List<Order> allOrders = orderRepository.findAll();
        List<OrderLine> allOrderLines = orderLineRepository.findAll();
        List<Reservation> allReservations = reservationRepository.findAll();

        // --- Favoris : Items avec au moins un customer ---
        List<Item> favoris = allItems.stream()
                .filter(item -> !item.getCustomers().isEmpty())
                .collect(Collectors.toList());

        // --- Classement items les plus commandés ---
        Map<Item, Long> itemOrderCount = allOrderLines.stream()
                .collect(Collectors.groupingBy(OrderLine::getItem, Collectors.summingLong(OrderLine::getQuantity)));

        // Tri décroissant
        List<Map.Entry<Item, Long>> topItems = itemOrderCount.entrySet().stream()
                .sorted(Map.Entry.<Item, Long>comparingByValue().reversed())
                .limit(10)
                .collect(Collectors.toList());

        // --- Statistiques sur prix des commandes ---
        List<Double> prices = allOrders.stream()
                .map(Order::getTotalPrice)
                .sorted()
                .collect(Collectors.toList());

        double avgPrice = prices.stream().mapToDouble(Double::doubleValue).average().orElse(0);
        double maxPrice = prices.stream().mapToDouble(Double::doubleValue).max().orElse(0);
        double minPrice = prices.stream().mapToDouble(Double::doubleValue).min().orElse(0);

        double medianPrice = 0;
        int size = prices.size();
        if (size > 0) {
            if (size % 2 == 1) {
                medianPrice = prices.get(size / 2);
            } else {
                medianPrice = (prices.get(size / 2 - 1) + prices.get(size / 2)) / 2;
            }
        }

        // --- Nombre total clients ---
        int totalCustomers = allCustomers.size();

        // Clients ayant fait au moins une commande
        long customersWithOrders = allCustomers.stream()
                .filter(c -> c.getOrders() != null && !c.getOrders().isEmpty())
                .count();

        // Clients ayant fait au moins une réservation
        long customersWithReservations = allCustomers.stream()
                .filter(c -> c.getReservations() != null && !c.getReservations().isEmpty())
                .count();

        // Pourcentages
        double pctCustomersWithOrders = totalCustomers == 0 ? 0 : (customersWithOrders * 100.0 / totalCustomers);
        double pctCustomersWithReservations = totalCustomers == 0 ? 0 : (customersWithReservations * 100.0 / totalCustomers);

        // Envoi à la JSP
        mv.addObject("favoris", favoris);
        mv.addObject("topItems", topItems);
        mv.addObject("avgPrice", avgPrice);
        mv.addObject("maxPrice", maxPrice);
        mv.addObject("minPrice", minPrice);
        mv.addObject("medianPrice", medianPrice);
        mv.addObject("totalCustomers", totalCustomers);
        mv.addObject("customersWithOrders", customersWithOrders);
        mv.addObject("customersWithReservations", customersWithReservations);
        mv.addObject("pctCustomersWithOrders", pctCustomersWithOrders);
        mv.addObject("pctCustomersWithReservations", pctCustomersWithReservations);

        return mv;
    }
}
