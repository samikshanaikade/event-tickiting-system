<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container fade-in">
    <h2>Checkout</h2>
    <div class="booking-details">
        <h3>Booking Confirmation</h3>
        <p><strong>Event:</strong> ${booking.event.name}</p>
        <p><strong>Category:</strong> ${booking.event.category}</p>
        <p><strong>Date:</strong> ${booking.event.date}</p>
        <p><strong>Number of Tickets:</strong> ${booking.numberOfTickets}</p>
        <p><strong>Total Amount:</strong> $${booking.totalAmount}</p>
        <p><strong>Booking Date:</strong> ${booking.bookingDate}</p>
    </div>
    <a href="/download-ticket?bookingId=${booking.id}" class="btn btn-primary">Download Ticket (PDF)</a>
    <a href="/my-bookings" class="btn btn-secondary">View My Bookings</a>
</div>