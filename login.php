<?php
// login.php

function validate_credentials($username, $password) {
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

  // Query to check if username and password exist in the database
  $sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    return true;
  } else {
    return false;
  }
}

if (isset($_POST['username']) && isset($_POST['password']) && isset($_POST['usertype'])) {
  $username = $_POST['username'];
  $password = $_POST['password'];
  $usertype = $_POST['usertype'];

  if (validate_credentials($username, $password)) {
    session_start();
    $_SESSION['username'] = $username;
    $_SESSION['usertype'] = $usertype;

    if ($usertype == 'student' || $usertype == 'admin') {
      header('Location: dashboard.php');
      exit;
    } elseif ($usertype == 'faculty') {
      header('Location: faculty_dashboard.php');
      exit;
    } else {
      echo 'Invalid user type selected.';
    }
  } else {
    echo 'Invalid username or password.';
  }
}
?>