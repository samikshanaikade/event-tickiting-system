<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container fade-in">
    <h2>My Bookings</h2>
    <c:if test="${not empty bookings}">
        <div class="booking-grid">
            <c:forEach var="booking" items="${bookings}">
                <div class="booking-card">
                    <h3>${booking.event.name}</h3>
                    <p><strong>Category:</strong> ${booking.event.category}</p>
                    <p><strong>Date:</strong> ${booking.event.date}</p>
                    <p><strong>Number of Tickets:</strong> ${booking.numberOfTickets}</p>
                    <p><strong>Total Amount:</strong> $${booking.totalAmount}</p>
                    <p><strong>Booking Date:</strong> ${booking.bookingDate}</p>
                    <a href="/download-ticket?bookingId=${booking.id}" class="btn btn-primary">Download Ticket</a>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty bookings}">
        <p class="no-bookings">No bookings found.</p>
    </c:if>
</div>