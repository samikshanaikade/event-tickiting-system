package com.eventticketing.service;

import com.eventticketing.model.Booking;
import com.eventticketing.model.Event;
import com.eventticketing.model.User;
import com.eventticketing.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class BookingServiceImpl implements BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private EventService eventService;

    @Override
    public Booking createBooking(User user, Long eventId, int numberOfTickets) {
        if (numberOfTickets > 10) {
            throw new IllegalArgumentException("Cannot book more than 10 tickets at a time.");
        }

        Event event = eventService.getEventById(eventId);
        if (event == null) {
            throw new IllegalArgumentException("Event not found.");
        }

        Booking booking = new Booking();
        booking.setUser(user);
        booking.setEvent(event);
        booking.setNumberOfTickets(numberOfTickets);
        booking.setBookingDate(LocalDateTime.now());
        booking.setTotalAmount(numberOfTickets * event.getTicketPrice());

        return bookingRepository.save(booking);
    }

    @Override
    public List<Booking> getBookingsByUser(User user) {
        return bookingRepository.findByUser(user);
    }

    @Override
    public Booking getBookingById(Long id) {
        return bookingRepository.findById(id).orElse(null);
    }
}