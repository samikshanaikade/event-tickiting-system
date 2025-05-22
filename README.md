Event Ticketing System Workflow and Implementation Guide
Project Overview
The Event Ticketing System is a Java-based web application built with Spring Boot, using PostgreSQL as the database, IntelliJ IDEA as the IDE, and REST APIs for communication. It supports user registration, event browsing, ticket booking, payment processing, email notifications, and an admin panel. The system leverages multi-threading for concurrent tasks, ensures thread safety for concurrency, and adopts a microservices architecture for scalability.

Overview

The Event Ticketing System is a Spring Boot web application designed to allow users to browse, book, and manage events such as concerts, dramas, art galleries, and more. It provides user authentication, event categorization, booking management, and a checkout process. The application uses a PostgreSQL database (with an alternative H2 in-memory database configuration), Spring Security for authentication, and JSP for rendering views. 

Tools Required (License-Free)
IDE: IntelliJ IDEA Community Edition (Free, supports Spring Boot, Java, and PostgreSQL integration).
Backend Framework: Spring Boot (Free, Apache 2.0 license, includes Spring MVC, Spring Data JPA, Spring Security).
Database: PostgreSQL (Free, PostgreSQL License, open-source relational database).
Build Tool: Maven (Free, Apache 2.0 license, for dependency management).
Email: Spring Mail with Gmail SMTP (Free, requires Gmail account for SMTP).
Payment Gateway: Stripe Java SDK (Free to integrate, transaction fees apply per Stripe’s terms).
Containerization: Docker (Free, Apache 2.0 license, for microservices deployment).
API Testing: Postman (Free tier, for testing REST APIs).

Set Up Environment:
Install IntelliJ IDEA Community Edition.
Install PostgreSQL and create a database (ticketing_db).
Install Docker and Docker Compose for microservices.
Install Maven for dependency management.
Create Spring Boot Projects:
Use Spring Initializr (via IntelliJ) to create projects for each microservice.
Include dependencies: Spring Web, Spring Data JPA, Spring Security, Spring Boot Starter Mail, PostgreSQL Driver.


# 🎟️ Event Ticketing System

The **Event Ticketing System** is a web-based platform developed using **Spring Boot** that allows users to register, browse events, and book tickets online. The system also supports administrative capabilities to manage users, events, and bookings.

This project follows a layered architecture based on **MVC (Model-View-Controller)** and is designed with scalability and maintainability in mind.

---

## 🚀 Key Features

- 🔐 **User Authentication** with Spring Security (login/registration)
- 📅 **Event Management**: Create, update, and list events
- 🎫 **Ticket Booking**: Book tickets for events and view existing bookings
- 🧑‍💼 **Admin Features**: Admins can manage events and users
- 📊 **Database Integration** using Spring Data JPA
- 🖥️ **Responsive Web UI** using Thymeleaf (or alternative templating engine)
- 🔄 **RESTful Architecture** (easily extendable to REST APIs)

---

## 🧰 Tech Stack


## 🔧 Tech Stack

- **Backend**: Spring Boot 3.2+, Spring Security
- **Frontend**: JSP (with `header.jsp`, `footer.jsp` layout includes)
- **Database**: PostgreSQL (with optional H2 for testing)
- **PDF Generation**: iText PDF
- **IDE**: IntelliJ IDEA
- **Build Tool**: Maven

---

## 📁 Project Structure Overview

event-ticketing-system/
EventTicketingSystem/
├── src/
│ ├── main/
│ │ ├── java/com/eventticketing/
│ │ │ ├── config/
│ │ │ ├── controller/
│ │ │ ├── model/
│ │ │ ├── repository/
│ │ │ ├── service/
│ │ │ └── EventTicketingApplication.java
│ │ ├── resources/application.properties
│ │ └── webapp/
│ │ ├── css/, js/, images/
│ │ └── WEB-INF/views/*.jsp
├── pom.xml


---

## ⚙️ Features

- 👤 User registration and login
- 🗂️ Event browsing and categorization
- 📝 Ticket booking and checkout
- 🧾 PDF ticket generation
- 🛡️ Secure authentication with BCrypt
- 📬 Email notifications (extendable)
- 🧠 Multi-threaded and thread-safe
- 📊 Admin panel (future scope)

---

## 🛠 Setup Instructions

### 📌 Prerequisites

- Java 17+
- Maven
- PostgreSQL with a database named `ticketingdb`
  - **Username**: `postgres`
  - **Password**: `password`

### 🧪 Steps

1. **Clone the repository** or extract the project zip:
   ```bash
   git clone https://github.com/samikshanaikade/event-tickiting-system.git

---

Configure PostgreSQL:
Run these SQL commands:

CREATE DATABASE ticketingdb;

CREATE TABLE "user" (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  password VARCHAR(255)
);

CREATE TABLE event (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  date TIMESTAMP,
  location VARCHAR(255),
  category VARCHAR(50),
  price DECIMAL(10,2),
  image_url VARCHAR(255)
);

CREATE TABLE booking (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES "user"(id),
  event_id INT REFERENCES event(id),
  quantity INT,
  total_price DECIMAL(10,2),
  booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--

Build and run:
mvn clean install
mvn spring-boot:run

--

Access the app:
Visit http://localhost:8081

--

🌐 Endpoints Overview
URL	Description
/	Home page
/register	User registration
/login	Login
/book-events	Browse and book events
/my-bookings	View user’s bookings
/checkout	Final booking confirmation
/download-ticket	Download PDF ticket (if added)

📄 Key JSP Views
home-content.jsp: Event showcase

register-content.jsp: Signup form

login-content.jsp: Login form

book-events-content.jsp: Event list

booking-form-content.jsp: Booking form

checkout-content.jsp: Booking summary

my-bookings-content.jsp: Booking history

layout.jsp: Combines header.jsp + footer.jsp

error-content.jsp: Custom error display

📦 Notable Dependencies
spring-boot-starter-web

spring-boot-starter-security

spring-boot-starter-data-jpa

postgresql

itextpdf

JSP support for embedded Tomcat

🛡️ Security
Login secured using Spring Security

BCrypt password hashing

URL-based access control in SecurityConfig.java

📝 Notes
Apache Tiles was removed for simplicity; JSP includes now manage layout.

SLF4J conflict resolved with consistent versioning and Logback.

PostgreSQL can be swapped with H2 for testing purposes.

📬 License
This project is built for academic and learning purposes. Contact the authors for reuse or extensions.





