<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="space-y-10">
    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-blue-600 to-purple-600 text-white p-8 rounded-lg shadow-lg animate-fade-in">
        <h1 class="text-4xl font-bold mb-4">Discover Amazing Events</h1>
        <p class="text-lg">Book tickets for concerts, dramas, art galleries, and more!</p>
        <a href="/book-events" class="mt-4 inline-block bg-yellow-500 text-black px-6 py-3 rounded-full font-semibold hover:bg-yellow-400 transition">Explore Events</a>
    </div>

    <!-- Upcoming Events -->
    <div class="animate-slide-up">
        <h2 class="text-3xl font-bold mb-6 text-yellow-400">Upcoming Events</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="event" items="${upcomingEvents}">
                <div class="event-card bg-gray-800 p-4 rounded-lg shadow-lg hover:shadow-xl transition transform hover:-translate-y-2">
                    <img src="${event.imageUrl}" alt="${event.name}" class="w-full h-48 object-cover rounded-t-lg">
                    <div class="p-4">
                        <h3 class="text-xl font-bold text-blue-400">${event.name}</h3>
                        <p class="text-gray-400 mt-2">${event.description}</p>
                        <p class="text-gray-400 mt-1">Date: ${event.date}</p>
                        <p class="text-gray-400 mt-1">Location: ${event.location}</p>
                        <p class="text-gray-400 mt-1">Price: $${event.price}</p>
                        <a href="/book-events" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Book Now</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Concerts -->
    <div class="animate-slide-up">
        <h2 class="text-3xl font-bold mb-6 text-yellow-400">Concerts</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="event" items="${concerts}">
                <div class="event-card bg-gray-800 p-4 rounded-lg shadow-lg hover:shadow-xl transition transform hover:-translate-y-2">
                    <img src="${event.imageUrl}" alt="${event.name}" class="w-full h-48 object-cover rounded-t-lg">
                    <div class="p-4">
                        <h3 class="text-xl font-bold text-blue-400">${event.name}</h3>
                        <p class="text-gray-400 mt-2">${event.description}</p>
                        <p class="text-gray-400 mt-1">Date: ${event.date}</p>
                        <p class="text-gray-400 mt-1">Location: ${event.location}</p>
                        <p class="text-gray-400 mt-1">Price: $${event.price}</p>
                        <a href="/book-events" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Book Now</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Dramas -->
    <div class="animate-slide-up">
        <h2 class="text-3xl font-bold mb-6 text-yellow-400">Dramas</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="event" items="${dramas}">
                <div class="event-card bg-gray-800 p-4 rounded-lg shadow-lg hover:shadow-xl transition transform hover:-translate-y-2">
                    <img src="${event.imageUrl}" alt="${event.name}" class="w-full h-48 object-cover rounded-t-lg">
                    <div class="p-4">
                        <h3 class="text-xl font-bold text-blue-400">${event.name}</h3>
                        <p class="text-gray-400 mt-2">${event.description}</p>
                        <p class="text-gray-400 mt-1">Date: ${event.date}</p>
                        <p class="text-gray-400 mt-1">Location: ${event.location}</p>
                        <p class="text-gray-400 mt-1">Price: $${event.price}</p>
                        <a href="/book-events" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Book Now</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Art Galleries -->
    <div class="animate-slide-up">
        <h2 class="text-3xl font-bold mb-6 text-yellow-400">Art Galleries</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="event" items="${artGalleries}">
                <div class="event-card bg-gray-800 p-4 rounded-lg shadow-lg hover:shadow-xl transition transform hover:-translate-y-2">
                    <img src="${event.imageUrl}" alt="${event.name}" class="w-full h-48 object-cover rounded-t-lg">
                    <div class="p-4">
                        <h3 class="text-xl font-bold text-blue-400">${event.name}</h3>
                        <p class="text-gray-400 mt-2">${event.description}</p>
                        <p class="text-gray-400 mt-1">Date: ${event.date}</p>
                        <p class="text-gray-400 mt-1">Location: ${event.location}</p>
                        <p class="text-gray-400 mt-1">Price: $${event.price}</p>
                        <a href="/book-events" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Book Now</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Folk Events -->
    <div class="animate-slide-up">
        <h2 class="text-3xl font-bold mb-6 text-yellow-400">Folk Events</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="event" items="${folks}">
                <div class="event-card bg-gray-800 p-4 rounded-lg shadow-lg hover:shadow-xl transition transform hover:-translate-y-2">
                    <img src="${event.imageUrl}" alt="${event.name}" class="w-full h-48 object-cover rounded-t-lg">
                    <div class="p-4">
                        <h3 class="text-xl font-bold text-blue-400">${event.name}</h3>
                        <p class="text-gray-400 mt-2">${event.description}</p>
                        <p class="text-gray-400 mt-1">Date: ${event.date}</p>
                        <p class="text-gray-400 mt-1">Location: ${event.location}</p>
                        <p class="text-gray-400 mt-1">Price: $${event.price}</p>
                        <a href="/book-events" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Book Now</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Music Events -->
    <div class="animate-slide-up">
        <h2 class="text-3xl font-bold mb-6 text-yellow-400">Music Events</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="event" items="${music}">
                <div class="event-card bg-gray-800 p-4 rounded-lg shadow-lg hover:shadow-xl transition transform hover:-translate-y-2">
                    <img src="${event.imageUrl}" alt="${event.name}" class="w-full h-48 object-cover rounded-t-lg">
                    <div class="p-4">
                        <h3 class="text-xl font-bold text-blue-400">${event.name}</h3>
                        <p class="text-gray-400 mt-2">${event.description}</p>
                        <p class="text-gray-400 mt-1">Date: ${event.date}</p>
                        <p class="text-gray-400 mt-1">Location: ${event.location}</p>
                        <p class="text-gray-400 mt-1">Price: $${event.price}</p>
                        <a href="/book-events" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Book Now</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Exhibitions -->
    <div class="animate-slide-up">
        <h2 class="text-3xl font-bold mb-6 text-yellow-400">Exhibitions</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="event" items="${exhibitions}">
                <div class="event-card bg-gray-800 p-4 rounded-lg shadow-lg hover:shadow-xl transition transform hover:-translate-y-2">
                    <img src="${event.imageUrl}" alt="${event.name}" class="w-full h-48 object-cover rounded-t-lg">
                    <div class="p-4">
                        <h3 class="text-xl font-bold text-blue-400">${event.name}</h3>
                        <p class="text-gray-400 mt-2">${event.description}</p>
                        <p class="text-gray-400 mt-1">Date: ${event.date}</p>
                        <p class="text-gray-400 mt-1">Location: ${event.location}</p>
                        <p class="text-gray-400 mt-1">Price: $${event.price}</p>
                        <a href="/book-events" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">Book Now</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>