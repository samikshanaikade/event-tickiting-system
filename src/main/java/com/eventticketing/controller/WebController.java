package com.eventticketing.controller;

import com.eventticketing.model.Event;
import com.eventticketing.service.EventService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class WebController {

    private static final Logger logger = LoggerFactory.getLogger(WebController.class);

    @Autowired
    private EventService eventService;

    @GetMapping("/")
    public String home(Model model) {
        logger.info("Handling request for root URL (/) - Rendering home view");
        try {
            List<Event> upcomingEvents = eventService.getUpcomingEvents();
            List<Event> concerts = eventService.getEventsByCategory("Concert");
            List<Event> dramas = eventService.getEventsByCategory("Drama");
            List<Event> artGalleries = eventService.getEventsByCategory("Art Gallery");
            List<Event> folks = eventService.getEventsByCategory("Folk");
            List<Event> music = eventService.getEventsByCategory("Music");
            List<Event> exhibitions = eventService.getEventsByCategory("Exhibition");
            logger.debug("Fetched upcomingEvents: {}", upcomingEvents);
            model.addAttribute("upcomingEvents", upcomingEvents);
            model.addAttribute("concerts", concerts);
            model.addAttribute("dramas", dramas);
            model.addAttribute("artGalleries", artGalleries);
            model.addAttribute("folks", folks);
            model.addAttribute("music", music);
            model.addAttribute("exhibitions", exhibitions);
            logger.info("Returning view name: home");
            return "home";
        } catch (Exception e) {
            logger.error("Error while handling request for root URL (/)", e);
            throw e;
        }
    }

    @GetMapping("/login")
    public String login(Model model) {
        logger.info("Handling request for /login - Rendering login view");
        return "login";
    }

    @GetMapping("/register")
    public String register(Model model) {
        logger.info("Handling request for /register - Rendering registration view");
        return "register";
    }

    @GetMapping("/book-events")
    public String bookEvents(Model model) {
        logger.info("Handling request for /book-events - Rendering book events view");
        List<Event> events = eventService.getAllEvents();
        model.addAttribute("events", events);
        return "book-events";
    }
}