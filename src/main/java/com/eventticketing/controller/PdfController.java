package com.eventticketing.controller;

import com.eventticketing.model.Booking;
import com.eventticketing.service.BookingService;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class PdfController {

    @Autowired
    private BookingService bookingService;

    @GetMapping("/download-ticket")
    public void downloadTicket(@RequestParam("bookingId") Long bookingId, HttpServletResponse response)
            throws DocumentException, IOException {

        Booking booking = bookingService.getBookingById(bookingId);
        if (booking == null) {
            response.sendRedirect("/my-bookings?error=BookingNotFound");
            return;
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=ticket_" + bookingId + ".pdf");

        Document document = new Document();
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();
        document.add(new Paragraph("Event Ticketing System - Booking Confirmation"));
        document.add(new Paragraph("--------------------------------------------------"));
        document.add(new Paragraph("Booking ID: " + booking.getId()));
        document.add(new Paragraph("Event: " + booking.getEvent().getName()));
        document.add(new Paragraph("Category: " + booking.getEvent().getCategory()));
        document.add(new Paragraph("Date: " + booking.getEvent().getDate()));
        document.add(new Paragraph("Number of Tickets: " + booking.getNumberOfTickets()));
        document.add(new Paragraph("Total Amount: $" + booking.getTotalAmount()));
        document.add(new Paragraph("Booking Date: " + booking.getBookingDate()));
        document.add(new Paragraph("--------------------------------------------------"));
        document.add(new Paragraph("Thank you for booking with us!"));

        document.close();
    }
}
