package com.eventticketing.service;

import com.eventticketing.model.Event;
import java.util.List;

public interface EventService {
    List<Event> getAllEvents();
    List<Event> getUpcomingEvents();
    List<Event> getEventsByCategory(String category);
    Event getEventById(Long id);
}