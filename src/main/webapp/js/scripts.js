function validateLoginForm(form) {
    const username = form.username.value;
    const password = form.password.value;

    if (username.length < 3) {
        alert("Username must be at least 3 characters long.");
        return false;
    }

    if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        return false;
    }

    return true;
}

function validateRegisterForm(form) {
    const username = form.username.value;
    const email = form.email.value;
    const password = form.password.value;

    if (username.length < 3) {
        alert("Username must be at least 3 characters long.");
        return false;
    }

    if (!email.includes('@') || !email.includes('.')) {
        alert("Please enter a valid email address.");
        return false;
    }

    if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        return false;
    }

    return true;
}

function validateBookingForm(form) {
    const numberOfTickets = parseInt(form.numberOfTickets.value);

    if (numberOfTickets < 1) {
        alert("Please select at least 1 ticket.");
        return false;
    }

    if (numberOfTickets > 10) {
        alert("You cannot book more than 10 tickets at a time.");
        return false;
    }

    return true;
}