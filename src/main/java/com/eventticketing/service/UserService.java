package com.eventticketing.service;

import com.eventticketing.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    void registerUser(User user);
    User findByUsername(String username);
}