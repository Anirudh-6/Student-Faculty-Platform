<?php
// reply.php

// MySQL credentials
$servername = "localhost";
$username = "root";
$password = ""; // update this with your MySQL root password
$dbname = "faculty_expertise"; // update this with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: ". $conn->connect_error);
}

// Handle reply form submission
if (isset($_POST['question_id']) && isset($_POST['reply_text'])) {
    $question_id = $_POST['question_id'];
    $reply_text = $_POST['reply_text'];

    $sql = "INSERT INTO replies (reply_text, question_id) VALUES (?,?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("si", $reply_text, $question_id);
    $stmt->execute();

    // Redirect to question details page
    header('Location: question_details.php?question_id='. $question_id);
    exit;
}
?>