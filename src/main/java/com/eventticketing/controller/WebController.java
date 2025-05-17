package com.eventticketing.controller;

import com.eventticketing.entity.Booking;
import com.eventticketing.entity.Event;
import com.eventticketing.entity.User;
import com.eventticketing.service.BookingService;
import com.eventticketing.service.EventService;
import com.eventticketing.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class WebController {

    private static final Logger logger = LoggerFactory.getLogger(WebController.class);

    @Autowired
    private EventService eventService;

    @Autowired
    private UserService userService;

    @Autowired
    private BookingService bookingService;

    @GetMapping("/")
    public String home(Model model) {
        logger.info("Handling request for root URL (/) - Rendering home view");
        List<Event> upcomingEvents = eventService.getUpcomingEvents();
        List<Event> concerts = eventService.getEventsByCategory("Concert");
        List<Event> dramas = eventService.getEventsByCategory("Drama");
        List<Event> artGalleries = eventService.getEventsByCategory("Art Gallery");
        List<Event> folks = eventService.getEventsByCategory("Folk");
        List<Event> music = eventService.getEventsByCategory("Music");
        List<Event> exhibitions = eventService.getEventsByCategory("Exhibition");
        model.addAttribute("upcomingEvents", upcomingEvents);
        model.addAttribute("concerts", concerts);
        model.addAttribute("dramas", dramas);
        model.addAttribute("artGalleries", artGalleries);
        model.addAttribute("folks", folks);
        model.addAttribute("music", music);
        model.addAttribute("exhibitions", exhibitions);
        return "home";
    }

    @GetMapping("/register")
    public String register() {
        logger.info("Handling request for /register - Rendering register view");
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            Model model) {
        logger.info("Handling register form submission for email: {}", email);
        try {
            // Validate email format
            if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                throw new IllegalArgumentException("Invalid email format.");
            }
            // Validate password strength
            if (password.length() < 8 || !password.matches(".*[A-Z].*") || !password.matches(".*[0-9].*")) {
                throw new IllegalArgumentException("Password must be at least 8 characters long, contain at least one uppercase letter, and one number.");
            }
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            userService.createUser(user);
            logger.info("User registered successfully: {}", email);
            return "redirect:/login";
        } catch (Exception e) {
            logger.error("Error during registration for email: {}", email, e);
            model.addAttribute("error", e.getMessage());
            return "register";
        }
    }

    @GetMapping("/login")
    public String login() {
        logger.info("Handling request for /login - Rendering login view");
        return "login";
    }

    @GetMapping("/test")
    @ResponseBody
    public String test() {
        return "Test endpoint is working!";
    }

    @GetMapping("/book-events")
    public String bookEvents(Model model) {
        logger.info("Handling request for /book-events - Rendering book-events view");
        List<Event> allEvents = eventService.getAllEvents();
        List<Event> movies = eventService.getEventsByCategory("Movie");
        List<String> categories = new ArrayList<>();
        categories.add("All");
        categories.add("Concert");
        categories.add("Drama");
        categories.add("Art Gallery");
        categories.add("Folk");
        categories.add("Music");
        categories.add("Exhibition");
        categories.add("Movie");
        model.addAttribute("events", allEvents);
        model.addAttribute("movies", movies);
        model.addAttribute("categories", categories);
        return "book-events";
    }

    @PostMapping("/book")
    public String bookEvent(
            @RequestParam Long eventId,
            @RequestParam Integer quantity,
            Model model) {
        logger.info("Handling booking form submission for eventId: {}", eventId);
        try {
            // Validate quantity
            if (quantity < 1) {
                throw new IllegalArgumentException("Quantity must be at least 1.");
            }
            if (quantity > 10) {
                throw new IllegalArgumentException("You can book a maximum of 10 tickets per booking.");
            }
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String email = authentication.getName();
            User user = userService.getUserByEmail(email)
                    .orElseThrow(() -> new RuntimeException("User not found: " + email));
            Event event = eventService.getEventById(eventId)
                    .orElseThrow(() -> new RuntimeException("Event not found: " + eventId));
            Booking booking = new Booking();
            booking.setUser(user);
            booking.setEvent(event);
            booking.setQuantity(quantity);
            booking.setTotalPrice(event.getPrice() * quantity);
            bookingService.createBooking(booking);
            logger.info("Booking created successfully for event: {}", eventId);
            return "redirect:/checkout?bookingId=" + booking.getId();
        } catch (Exception e) {
            logger.error("Error during booking for eventId: {}", eventId, e);
            model.addAttribute("error", e.getMessage());
            model.addAttribute("event", eventService.getEventById(eventId).orElse(null));
            return "book-events";
        }
    }

    @GetMapping("/checkout")
    public String checkout(@RequestParam Long bookingId, Model model) {
        logger.info("Handling request for /checkout with bookingId: {}", bookingId);
        model.addAttribute("booking", bookingService.getBookingById(bookingId).orElse(null));
        return "checkout";
    }

    @GetMapping("/my-bookings")
    public String myBookings(Model model) {
        logger.info("Handling request for /my-bookings - Rendering my-bookings view");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        User user = userService.getUserByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found: " + email));
        model.addAttribute("bookings", bookingService.getBookingsByUser(user));
        return "my-bookings";
    }
}