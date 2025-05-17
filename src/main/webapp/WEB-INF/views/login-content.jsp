<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-900 min-h-screen flex items-center justify-center">
<div class="bg-gray-800 p-8 rounded-lg shadow-lg max-w-md mx-auto animate-fade-in">
    <h2 class="text-3xl font-bold mb-6 text-yellow-400 text-center">Login</h2>
    <form method="post" action="/login" class="space-y-4">
        <div>
            <label for="email" class="block text-gray-400">Email</label>
            <input type="email" id="email" name="username" class="w-full p-2 rounded bg-gray-700 text-white focus:outline-none focus:ring-2 focus:ring-blue-400" required />
        </div>
        <div>
            <label for="password" class="block text-gray-400">Password</label>
            <input type="password" id="password" name="password" class="w-full p-2 rounded bg-gray-700 text-white focus:outline-none focus:ring-2 focus:ring-blue-400" required />
        </div>
        <button type="submit" class="w-full bg-blue-500 text-white p-2 rounded hover:bg-blue-600 transition">Login</button>
    </form>
    <c:if test="${not empty param.error}">
        <p class="text-red-500 mt-4 text-center">Invalid email or password.</p>
    </c:if>
    <p class="text-gray-400 mt-4 text-center">Don't have an account? <a href="/register" class="text-blue-400 hover:underline">Register</a></p>
    <a href="/" class="block text-blue-400 mt-4 text-center hover:underline">Back to Home</a>
</div>
</body>
</html>