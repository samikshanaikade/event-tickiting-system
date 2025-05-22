package com.eventticketing.repository;

import com.eventticketing.model.Booking;
import com.eventticketing.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {
    List<Booking> findByUser(User user);
}
