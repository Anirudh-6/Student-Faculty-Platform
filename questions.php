<?php
// questions.php

// Check if user is logged in
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit;
}

// MySQL credentials
$servername = "localhost";
$username = "root";
$password = ""; // update this with your MySQL root password
$dbname = "faculty_expertise"; // update this with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Display page heading
echo "<!DOCTYPE html>";
echo "<html>";
echo "<head>";
echo "<title>Discussion Forum</title>";
echo "<style>";
echo "body {";
echo "  font-family: Arial, sans-serif;";
echo "  background-color: #f0f0f0;";
echo "}";
echo ".container {";
echo "  max-width: 800px;";
echo "  margin: 40px auto;";
echo "  padding: 20px;";
echo "  background-color: #fff;";
echo "  border: 1px solid #ddd;";
echo "  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);";
echo "}";
echo ".heading {";
echo "  text-align: center;";
echo "  margin-bottom: 20px;";
echo "  font-size: 24px;";
echo "  font-weight: bold;";
echo "  color: #337ab7;";
echo "}";
echo ".search-bar {";
echo "  margin-bottom: 20px;";
echo "}";
echo ".search-bar label {";
echo "  display: block;";
echo "  margin-bottom: 10px;";
echo "}";
echo ".search-bar select {";
echo "  width: 100%;";
echo "  padding: 10px;";
echo "  margin-bottom: 20px;";
echo "  border: 1px solid #ccc;";
echo "}";
echo ".search-bar input[type=\"submit\"] {";
echo "  background-color: #4CAF50;";
echo "  color: #fff;";
echo "  padding: 10px 20px;";
echo "  border: none;";
echo "  border-radius: 5px;";
echo "  cursor: pointer;";
echo "}";
echo ".search-bar input[type=\"submit\"]:hover {";
echo "  background-color: #3e8e41;";
echo "}";
echo ".question {";
echo "  margin-bottom: 20px;";
echo "  padding: 20px;";
echo "  border: 1px solid #ccc;";
echo "}";
echo ".question strong {";
echo "  font-weight: bold;";
echo "}";
echo ".reply {";
echo "  margin-bottom: 20px;";
echo "  padding: 20px;";
echo "  border: 1px solid #ccc;";
echo "}";
echo ".reply textarea {";
echo "  width: 100%;";
echo "  padding: 10px;";
echo "  margin-bottom: 20px;";
echo "  border: 1px solid #ccc;";
echo "}";
echo ".reply input[type=\"submit\"] {";
echo "  background-color: #4CAF50;";
echo "  color: #fff;";
echo "  padding: 10px 20px;";
echo "  border: none;";
echo "  border-radius: 5px;";
echo "  cursor: pointer;";
echo "}";
echo ".reply input[type=\"submit\"]:hover {";
echo "  background-color: #3e8e41;";
echo "}";
echo "</style>";
echo "</head>";
echo "<body>";
echo "<div class='container'>";
echo "<h1 class='heading'>DISCUSSION FORUM</h1>";
echo "<h2>Select Category to see Category Based Questions</h2>";

// Display search bar
echo "<form action='' method='post'>";
echo "<label for='category'>Select Category:</label>";
echo "<select id='category' name='category'>";
echo "<option value='all'>All Categories</option>";

// Fetch categories from database
$sql = "SELECT * FROM expertise_category";
$result = $conn->query($sql);
while ($row = $result->fetch_assoc()) {
    echo "<option value='" . $row['id'] . "'>" . $row['category_name'] . "</option>";
}

echo "</select>";
echo "<br><br>";
echo "<input type='submit' name='search' value='Search'>";
echo "</form>";

// Handle search form submission
if (isset($_POST['search'])) {
    $category_id = $_POST['category'];

 

// Display questions based on selected category
if ($category_id != 'all') {
    $sql = "SELECT q.*, ec.category_name, sc.subcategory_name
            FROM questions q
            JOIN expertise_category ec ON q.question_category_id = ec.id
            JOIN subcategory sc ON q.question_subcategory_id = sc.id
            WHERE q.question_category_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $category_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $category_name_sql = "SELECT category_name FROM expertise_category WHERE id = ?";
    $category_name_stmt = $conn->prepare($category_name_sql);
    $category_name_stmt->bind_param("i", $category_id);
    $category_name_stmt->execute();
    $category_name_result = $category_name_stmt->get_result();
    $category_name_row = $category_name_result->fetch_assoc();
    $category_name = $category_name_row['category_name'];
    echo "<h2>Questions related to $category_name:</h2>";
} else {
    // Display all questions
    $sql = "SELECT q.*, ec.category_name, sc.subcategory_name
            FROM questions q
            JOIN expertise_category ec ON q.question_category_id = ec.id
            JOIN subcategory sc ON q.question_subcategory_id = sc.id";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $result = $stmt->get_result();
    echo "<h2>All Questions:</h2>";
}

while ($row = $result->fetch_assoc()) {
    echo "<p><strong>Question:</strong> " . htmlspecialchars($row['question_text']) . "</p>";
    echo "<p><strong>Category:</strong> " . htmlspecialchars($row['category_name']) . "</p>";
    echo "<p><strong>Subcategory:</strong> " . htmlspecialchars($row['subcategory_name']) . "</p>";

    // Display replies
    echo "<h3>Replies:</h3>";
    $reply_sql = "SELECT reply_text FROM replies WHERE question_id = ?";
    $reply_stmt = $conn->prepare($reply_sql);
    $reply_stmt->bind_param("i", $row['id']);
    $reply_stmt->execute();
    $reply_result = $reply_stmt->get_result();
    while ($reply_row = $reply_result->fetch_assoc()) {
        echo "<p>" . htmlspecialchars($reply_row['reply_text']) . "</p>";
    }

    // Display reply box
    echo "<form action='reply.php' method='post'>";
    echo "<input type='hidden' name='question_id' value='" . $row['id'] . "'>";
    echo "<textarea name='reply_text' placeholder='Enter your reply...'></textarea>";
    echo "<br><br>";
    echo "<input type='submit' value='Reply'>";
    echo "</form>";

    echo "<hr>";
}

}

// Close database connection
$conn->close();
?>