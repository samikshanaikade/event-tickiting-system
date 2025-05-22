package com.eventticketing.service;

import com.eventticketing.model.Booking;
import com.eventticketing.model.User;
import java.util.List;

public interface BookingService {
    Booking createBooking(User user, Long eventId, int numberOfTickets);
    List<Booking> getBookingsByUser(User user);
    Booking getBookingById(Long id);
}