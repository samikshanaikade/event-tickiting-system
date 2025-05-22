<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
    <h1 class="fade-in">Book Events</h1>
    <section>
        <h2 class="section-title slide-in-left">All Events</h2>
        <div class="event-grid">
            <c:if test="${not empty events}">
                <c:forEach var="event" items="${events}">
                    <div class="event-card fade-in">
                        <img src="${event.imageUrl}" alt="${event.name}" class="event-img">
                        <h3>${event.name}</h3>
                        <p>${event.description}</p>
                        <p><strong>Date:</strong> ${event.date}</p>
                        <p><strong>Category:</strong> ${event.category}</p>
                        <p><strong>Ticket Price:</strong> $${event.ticketPrice}</p>
                        <a href="/book-event/${event.id}" class="btn btn-primary">Book Now</a>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty events}">
                <p class="no-events">No events available.</p>
                <img src="/images/no-events.jpg" alt="No Events" class="no-events-img">
            </c:if>
        </div>
    </section>
</div>