function validateRegisterForm() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const emailRegex = /^[A-Za-z0-9+_.-]+@(.+)$/;
    if (!emailRegex.test(email)) {
        alert('Please enter a valid email address.');
        return false;
    }
    if (password.length < 8 || !/[A-Z]/.test(password) || !/[0-9]/.test(password)) {
        alert('Password must be at least 8 characters long, contain at least one uppercase letter, and one number.');
        return false;
    }
    return true;
}

function validateBookingForm(form) {
    const quantity = form.querySelector('input[name="quantity"]').value;
    if (quantity < 1) {
        alert('Quantity must be at least 1.');
        return false;
    }
    if (quantity > 10) {
        alert('You can book a maximum of 10 tickets per booking.');
        return false;
    }
    return true;
}

function filterEvents() {
    const category = document.getElementById('categoryFilter').value;
    const eventCards = document.querySelectorAll('.event-card');
    eventCards.forEach(card => {
        const cardCategory = card.getAttribute('data-category');
        if (category === 'All' || cardCategory === category) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });
}

document.addEventListener('DOMContentLoaded', function () {
    filterEvents();
});