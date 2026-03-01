// Function to show welcome message
function welcomeMessage() {
    alert("Welcome to Zero Waste Zero Hunger Initiative!");
}

// Call welcome message when page loads
window.onload = welcomeMessage;


// Food Donation Form Function
function donateFood() {

    let name = document.getElementById("name").value;
    let food = document.getElementById("food").value;
    let quantity = document.getElementById("quantity").value;

    if (name === "" || food === "" || quantity === "") {
        alert("Please fill all the details!");
        return false;
    }

    document.getElementById("result").innerHTML =
        "✅ Thank you " + name +
        "! Your donation of " + quantity +
        " plates of " + food +
        " has been successfully registered.";

    return false;
}


// Change Theme Button
function changeTheme() {
    document.body.style.backgroundColor = "#e8f5e9";
    document.body.style.color = "green";
}
