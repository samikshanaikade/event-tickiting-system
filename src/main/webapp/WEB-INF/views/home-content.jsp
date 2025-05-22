<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
    <h1 class="fade-in">Welcome to Event Ticketing System</h1>
    <section class="upcoming-events">
        <h2 class="section-title slide-in-left">Upcoming Events</h2>
        <div class="event-grid">
            <c:if test="${not empty upcomingEvents}">
                <c:forEach var="event" items="${upcomingEvents}">
                    <div class="event-card fade-in">
                        <img src="${event.imageUrl}" alt="${event.name}" class="event-img">
                        <h3>${event.name}</h3>
                        <p>${event.description}</p>
                        <p><strong>Date:</strong> ${event.date}</p>
                        <p><strong>Category:</strong> ${event.category}</p>
                        <a href="/book-events" class="btn btn-primary">Book Now</a>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty upcomingEvents}">
                <p class="no-events">No upcoming events available.</p>
                <img src="/images/no-events.jpg" alt="No Events" class="no-events-img">
            </c:if>
        </div>
    </section>

    <section class="event-category">
        <h2 class="section-title slide-in-right">Concerts</h2>
        <div class="event-grid">
            <c:forEach var="event" items="${concerts}">
                <div class="event-card fade-in">
                    <img src="${event.imageUrl}" alt="${event.name}" class="event-img">
                    <h3>${event.name}</h3>
                    <p>${event.description}</p>
                    <p><strong>Date:</strong> ${event.date}</p>
                    <a href="/book-events" class="btn btn-primary">Book Now</a>
                </div>
            </c:forEach>
        </div>
    </section>

    <section class="event-category">
        <h2 class="section-title slide-in-left">Drama</h2>
        <div class="event-grid">
            <c:forEach var="event" items="${dramas}">
                <div class="event-card fade-in">
                    <img src="${event.imageUrl}" alt="${event.name}" class="event-img">
                    <h3>${event.name}</h3>
                    <p>${event.description}</p>
                    <p><strong>Date:</strong> ${event.date}</p>
                    <a href="/book-events" class="btn btn-primary">Book Now</a>
                </div>
            </c:forEach>
        </div>
    </section>

    <section class="event-category">
        <h2 class="section-title slide-in-right">Art Gallery</h2>
        <div class="event-grid">
            <c:forEach var="event" items="${artGalleries}">
                <div class="event-card fade-in">
                    <img src="${event.imageUrl}" alt="${event.name}" class="event-img">
                    <h3>${event.name}</h3>
                    <p>${event.description}</p>
                    <p><strong>Date:</strong> ${event.date}</p>
                    <a href="/book-events" class="btn btn-primary">Book Now</a>
                </div>
            </c:forEach>
        </div>
    </section>

    <section class="event-category">
        <h2 class="section-title slide-in-left">Folk</h2>
        <div class="event-grid">
            <c:forEach var="event" items="${folks}">
                <div class="event-card fade-in">
                    <img src="${event.imageUrl}" alt="${event.name}" class="event-img">
                    <h3>${event.name}</h3>
                    <p>${event.description}</p>
                    <p><strong>Date:</strong> ${event.date}</p>
                    <a href="/book-events" class="btn btn-primary">Book Now</a>
                </div>
            </c:forEach>
        </div>
    </section>

    <section class="event-category">
        <h2 class="section-title slide-in-right">Music</h2>
        <div class="event-grid">
            <c:forEach var="event" items="${music}">
                <div class="event-card fade-in">
                    <img src="${event.imageUrl}" alt="${event.name}" class="event-img">
                    <h3>${event.name}</h3>
                    <p>${event.description}</p>
                    <p><strong>Date:</strong> ${event.date}</p>
                    <a href="/book-events" class="btn btn-primary">Book Now</a>
                </div>
            </c:forEach>
        </div>
    </section>

    <section class="event-category">
        <h2 class="section-title slide-in-left">Exhibition</h2>
        <div class="event-grid">
            <c:forEach var="event" items="${exhibitions}">
                <div class="event-card fade-in">
                    <img src="${event.imageUrl}" alt="${event.name}" class="event-img">
                    <h3>${event.name}</h3>
                    <p>${event.description}</p>
                    <p><strong>Date:</strong> ${event.date}</p>
                    <a href="/book-events" class="btn btn-primary">Book Now</a>
                </div>
            </c:forEach>
        </div>
    </section>
</div>