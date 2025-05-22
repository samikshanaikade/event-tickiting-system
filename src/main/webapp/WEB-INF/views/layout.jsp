<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><tiles:getAsString name="title"/></title>
    <link rel="stylesheet" href="/css/styles.css">
    <script src="/js/scripts.js" defer></script>
</head>
<body>
<header>
    <nav class="navbar">
        <div class="logo">
            <img src="/images/logo.png" alt="Event Ticketing Logo" class="logo-img">
            <span>EventTicketing</span>
        </div>
        <ul class="nav-links">
            <li><a href="/">Home</a></li>
            <li><a href="/book-events">Book Events</a></li>
            <c:if test="${not empty sessionScope.user}">
                <li><a href="/my-bookings">My Bookings</a></li>
                <li><a href="/logout">Logout</a></li>
            </c:if>
            <c:if test="${empty sessionScope.user}">
                <li><a href="/login">Login</a></li>
                <li><a href="/register">Register</a></li>
            </c:if>
        </ul>
    </nav>
</header>
<main>
    <tiles:insertAttribute name="content"/>
</main>
<footer>
    <p>© 2025 Event Ticketing System. All rights reserved.</p>
</footer>
</body>
</html>