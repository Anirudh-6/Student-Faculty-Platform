<?php
// register.php

// MySQL credentials
$servername = "localhost";
$username_db = "root";
$password_db = ""; // update this with your MySQL root password
$dbname = "faculty_expertise";

// Create connection
$conn = new mysqli($servername, $username_db, $password_db, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: ". $conn->connect_error);
}

if (isset($_POST['username']) && isset($_POST['email']) && isset($_POST['password']) && isset($_POST['role'])) {
  $username = $_POST['username'];
  $email = $_POST['email'];
  $password = $_POST['password'];
  $role = $_POST['role'];

  // Check if username already exists
  $sql = "SELECT * FROM users WHERE username = '$username'";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    echo '<script>alert("Username already exists. Please choose a different username.");</script>';
  } else {
    // Insert new user into database
    $sql = "INSERT INTO users (username, email, password, role) VALUES ('$username', '$email', '$password', '$role')";
    if ($conn->query($sql) === TRUE) {
      echo '<script>alert("Registration successful. Please login to continue."); window.location.href="login.html";</script>';
    } else {
      echo 'Error: '. $sql. '<br>'. $conn->error;
    }
  }
}

$conn->close();
?>