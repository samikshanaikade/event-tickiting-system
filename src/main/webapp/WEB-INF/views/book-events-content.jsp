<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="space-y-10">
    <h2 class="text-3xl font-bold mb-6 text-yellow-400 animate-fade-in">Book Events</h2>

    <!-- Filter by Category -->
    <div class="bg-gray-800 p-4 rounded-lg shadow-lg animate-slide-up">
        <label for="categoryFilter" class="text-gray-200 mr-2">Filter by Category:</label>
        <select id="categoryFilter" onchange="filterEvents()" class="p-2 bg-gray-700 text-white rounded focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
            <c:forEach var="category" items="${categories}">
                <option value="${category}">${category}</option>
            </c:forEach>
        </select>
    </div>

    <!-- Events List -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <c:forEach var="event" items="${events}">
            <div class="event-card bg-gray-800 p-4 rounded-lg shadow-lg hover:shadow-xl transition transform hover:-translate-y-2 animate-slide-up" data-category="${event.category}">
                <img src="${event.imageUrl}" alt="${event.name}" class="w-full h-48 object-cover rounded-t-lg">
                <div class="p-4">
                    <h3 class="text-xl font-bold text-blue-400">${event.name}</h3>
                    <p class="text-gray-400 mt-2">${event.description}</p>
                    <p class="text-gray-400 mt-1">Category: ${event.category}</p>
                    <p class="text-gray-400 mt-1">Date: ${event.date}</p>
                    <p class="text-gray-400 mt-1">Location: ${event.location}</p>
                    <p class="text-gray-400 mt-1">Price: $${event.price}</p>
                    <form action="/book" method="post" class="mt-4 space-y-2" onsubmit="return validateBookingForm(this)">
                        <input type="hidden" name="eventId" value="${event.id}">
                        <div>
                            <label for="quantity-${event.id}" class="block text-gray-200">Quantity:</label>
                            <input type="number" id="quantity-${event.id}" name="quantity" min="1" max="10" class="w-full p-2 bg-gray-700 text-white rounded focus:outline-none focus:ring-2 focus:ring-blue-500 transition" required>
                        </div>
                        <button type="submit" class="w-full bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Book Now</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Movies Section -->
    <div class="animate-slide-up">
        <h2 class="text-3xl font-bold mb-6 text-yellow-400">Movies</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="movie" items="${movies}">
                <div class="event-card bg-gray-800 p-4 rounded-lg shadow-lg hover:shadow-xl transition transform hover:-translate-y-2" data-category="Movie">
                    <img src="${movie.imageUrl}" alt="${movie.name}" class="w-full h-48 object-cover rounded-t-lg">
                    <div class="p-4">
                        <h3 class="text-xl font-bold text-blue-400">${movie.name}</h3>
                        <p class="text-gray-400 mt-2">${movie.description}</p>
                        <p class="text-gray-400 mt-1">Category: ${movie.category}</p>
                        <p class="text-gray-400 mt-1">Date: ${movie.date}</p>
                        <p class="text-gray-400 mt-1">Location: ${movie.location}</p>
                        <p class="text-gray-400 mt-1">Price: $${movie.price}</p>
                        <form action="/book" method="post" class="mt-4 space-y-2" onsubmit="return validateBookingForm(this)">
                            <input type="hidden" name="eventId" value="${movie.id}">
                            <div>
                                <label for="quantity-${movie.id}" class="block text-gray-200">Quantity:</label>
                                <input type="number" id="quantity-${movie.id}" name="quantity" min="1" max="10" class="w-full p-2 bg-gray-700 text-white rounded focus:outline-none focus:ring-2 focus:ring-blue-500 transition" required>
                            </div>
                            <button type="submit" class="w-full bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Book Now</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>