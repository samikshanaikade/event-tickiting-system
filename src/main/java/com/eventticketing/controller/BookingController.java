package com.eventticketing.controller;

import com.eventticketing.model.Booking;
import com.eventticketing.model.Event;
import com.eventticketing.model.User;
import com.eventticketing.service.BookingService;
import com.eventticketing.service.EventService;
import com.eventticketing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BookingController {

    @Autowired
    private EventService eventService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private UserService userService;

    @GetMapping("/book-event/{id}")
    public String showBookingForm(@PathVariable Long id, Model model, Authentication authentication) {
        Event event = eventService.getEventById(id);
        if (event == null) {
            return "redirect:/book-events?error=EventNotFound";
        }
        model.addAttribute("event", event);
        return "booking-form";
    }

    @PostMapping("/book-event/{id}")
    public String bookEvent(@PathVariable Long id, @RequestParam int numberOfTickets, Model model, Authentication authentication) {
        Event event = eventService.getEventById(id);
        if (event == null) {
            return "redirect:/book-events?error=EventNotFound";
        }

        String username = authentication.getName();
        User user = userService.findByUsername(username);

        try {
            Booking booking = bookingService.createBooking(user, id, numberOfTickets);
            return "redirect:/checkout?bookingId=" + booking.getId();
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("event", event);
            return "booking-form";
        }
    }

    @GetMapping("/checkout")
    public String showCheckout(@RequestParam Long bookingId, Model model) {
        Booking booking = bookingService.getBookingById(bookingId);
        if (booking == null) {
            return "redirect:/book-events?error=BookingNotFound";
        }
        model.addAttribute("booking", booking);
        return "checkout";
    }

    @GetMapping("/my-bookings")
    public String showMyBookings(Model model, Authentication authentication) {
        String username = authentication.getName();
        User user = userService.findByUsername(username);
        List<Booking> bookings = bookingService.getBookingsByUser(user);
        model.addAttribute("bookings", bookings);
        return "my-bookings";
    }
}