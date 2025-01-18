<?php
// question_details.php

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

// Get question ID from URL parameter
$question_id = $_GET['question_id'];

// Fetch question details
$sql = "SELECT * FROM questions WHERE id =?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $question_id);
$stmt->execute();
$result = $stmt->get_result();
$question = $result->fetch_assoc();

// Fetch replies for this question
$sql = "SELECT * FROM replies WHERE question_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $question_id);
$stmt->execute();
$result = $stmt->get_result();
$replies = $result->fetch_all(MYSQLI_ASSOC);

// Display question details and replies
?>
<html>
<head>
    <title>Question Details</title>
    <style>
        /* Add CSS styles here */
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .question-details {
            border: 1px solid #ccc;
            padding: 20px;
            margin: 40px auto;
            width: 80%;
            text-align: left;
        }
        h1, h2 {
            color: #333;
        }
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        li {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        li:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <div class="question-details">
        <h1>Question Details</h1>
        <p><strong>Question:</strong> <?= $question['question_text'] ?></p>
        <h2>Replies:</h2>
        <ul>
            <?php foreach ($replies as $reply) { ?>
                <li><?= $reply['reply_text'] ?></li>
            <?php } ?>
        </ul>
    </div>
</body>
</html>