<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="space-y-10">
    <h2 class="text-3xl font-bold mb-6 text-yellow-400 animate-fade-in">My Bookings</h2>
    <c:if test="${not empty bookings}">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="booking" items="${bookings}">
                <div class="bg-gray-800 p-4 rounded-lg shadow-lg hover:shadow-xl transition transform hover:-translate-y-2 animate-slide-up">
                    <h3 class="text-xl font-bold text-blue-400">Booking ID: ${booking.id}</h3>
                    <p class="text-gray-400 mt-2">Event: ${booking.event.name}</p>
                    <p class="text-gray-400 mt-1">Category: ${booking.event.category}</p>
                    <p class="text-gray-400 mt-1">Date: ${booking.event.date}</p>
                    <p class="text-gray-400 mt-1">Location: ${booking.event.location}</p>
                    <p class="text-gray-400 mt-1">Quantity: ${booking.quantity}</p>
                    <p class="text-gray-400 mt-1">Total Price: $${booking.totalPrice}</p>
                    <!-- Commented out PDF download link due to iText dependency issue -->
                    <!--
                    <div class="mt-4 flex justify-center">
                        <a href="/download-invoice?bookingId=${booking.id}" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition">Download PDF Invoice</a>
                    </div>
                    -->
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty bookings}">
        <p class="text-gray-400 text-center">You have no bookings yet.</p>
    </c:if>
    <a href="/" class="block text-blue-400 mt-4 text-center hover:underline">Back to Home</a>
</div>