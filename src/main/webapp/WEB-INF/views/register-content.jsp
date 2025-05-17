<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="bg-gray-800 p-8 rounded-lg shadow-lg max-w-md mx-auto animate-fade-in">
    <h2 class="text-3xl font-bold mb-6 text-yellow-400 text-center">Register</h2>
    <c:if test="${not empty error}">
        <p class="text-red-500 mb-4 text-center">${error}</p>
    </c:if>
    <form action="/register" method="post" class="space-y-6" onsubmit="return validateRegisterForm()">
        <div>
            <label for="name" class="block text-gray-200">Name:</label>
            <input type="text" id="name" name="name" class="w-full p-3 bg-gray-700 text-white rounded focus:outline-none focus:ring-2 focus:ring-blue-500 transition" required>
        </div>
        <div>
            <label for="email" class="block text-gray-200">Email:</label>
            <input type="email" id="email" name="email" class="w-full p-3 bg-gray-700 text-white rounded focus:outline-none focus:ring-2 focus:ring-blue-500 transition" required>
        </div>
        <div>
            <label for="password" class="block text-gray-200">Password:</label>
            <input type="password" id="password" name="password" class="w-full p-3 bg-gray-700 text-white rounded focus:outline-none focus:ring-2 focus:ring-blue-500 transition" required>
        </div>
        <button type="submit" class="w-full bg-blue-500 text-white px-4 py-3 rounded hover:bg-blue-600 transition font-semibold">Register</button>
    </form>
    <p class="mt-4 text-center text-gray-400">Already have an account? <a href="/login" class="text-blue-400 hover:underline">Login</a></p>
</div>