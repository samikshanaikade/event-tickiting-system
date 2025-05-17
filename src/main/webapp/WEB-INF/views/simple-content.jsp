<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Test Page</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom animation for fade-in effect */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .animate-fade-in {
            animation: fadeIn 1s ease-in-out;
        }
    </style>
</head>
<body class="bg-gray-900 min-h-screen flex items-center justify-center">
<div class="bg-gray-800 p-8 rounded-lg shadow-lg max-w-md mx-auto animate-fade-in">
    <h1 class="text-3xl font-bold mb-6 text-yellow-400 text-center">Simple Test Page</h1>
    <p class="text-gray-300 text-center">This is a test to verify JSP rendering.</p>
    <a href="/" class="block text-blue-400 mt-4 text-center hover:underline">Back to Home</a>
</div>
</body>
</html>