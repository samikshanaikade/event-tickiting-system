<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="bg-gray-800 p-8 rounded-lg shadow-lg max-w-md mx-auto animate-fade-in">
    <h2 class="text-3xl font-bold mb-6 text-yellow-400 text-center">Checkout</h2>
    <c:if test="${not empty booking}">
        <div class="space-y-4">
            <h3 class="text-xl font-semibold text-blue-400">Booking Confirmation</h3>
            <p class="text-gray-400">Event: ${booking.event.name}</p>
            <p class="text-gray-400">Category: ${booking.event.category}</p>
            <p class="text-gray-400">Date: ${booking.event.date}</p>
            <p class="text-gray-400">Location: ${booking.event.location}</p>
            <p class="text-gray-400">Quantity: ${booking.quantity}</p>
            <p class="text-gray-400">Total Price: $${booking.totalPrice}</p>
            <!-- Commented out PDF download link due to iText dependency issue -->
            <!--
            <div class="mt-6 flex justify-center">
                <a href="/download-invoice?bookingId=${booking.id}" class="bg-green-500 text-white px-6 py-3 rounded-full hover:bg-green-600 transition font-semibold">Download PDF Invoice</a>
            </div>
            -->
            <a href="/my-bookings" class="block text-blue-400 mt-4 text-center hover:underline">View My Bookings</a>
        </div>
    </c:if>
    <c:if test="${empty booking}">
        <p class="text-gray-400 text-center">Booking not found.</p>
    </c:if>
    <a href="/" class="block text-blue-400 mt-4 text-center hover:underline">Back to Home</a>
</div>