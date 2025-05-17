package com.eventticketing.repository;

import com.eventticketing.entity.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface EventRepository extends JpaRepository<Event, Long> {
    List<Event> findByDateAfterOrderByDateAsc(LocalDateTime date);
    List<Event> findByCategory(String category);
}