<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container fade-in">
    <h2>Book Event: ${event.name}</h2>
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>
    <div class="event-details">
        <img src="${event.imageUrl}" alt="${event.name}" class="event-img-large">
        <div class="event-info">
            <p><strong>Description:</strong> ${event.description}</p>
            <p><strong>Date:</strong> ${event.date}</p>
            <p><strong>Category:</strong> ${event.category}</p>
            <p><strong>Ticket Price:</strong> $${event.ticketPrice}</p>
        </div>
    </div>
    <form method="POST" action="/book-event/${event.id}" onsubmit="return validateBookingForm(this)" class="form">
        <div class="form-group">
            <label for="numberOfTickets">Number of Tickets (Max 10):</label>
            <input type="number" id="numberOfTickets" name="numberOfTickets" min="1" max="10" required>
        </div>
        <button type="submit" class="btn btn-primary">Proceed to Checkout</button>
    </form>
</div>