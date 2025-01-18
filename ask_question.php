<?php
// ask_question.php

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
$dbname = "faculty_expertise";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "<!DOCTYPE html>";
echo "<html>";
echo "<head>";
echo "<title>Ask Question</title>";
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
echo ".section {";
echo "  margin-bottom: 40px;";
echo "  padding: 20px;";
echo "  border: 1px solid #ccc;";
echo "  border-radius: 10px;";
echo "  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);";
echo "}";
echo ".question {";
echo "  margin-bottom: 20px;";
echo "  padding: 20px;";
echo "  border: 1px solid #ccc;";
echo "  border-radius: 10px;";
echo "  background-color: #f9f9f9;";
echo "}";
echo ".faculty-expertise {";
echo "  margin-bottom: 20px;";
echo "  padding: 20px;";
echo "  border: 1px solid #ccc;";
echo "  border-radius: 10px;";
echo "  background-color: #f9f9f9;";
echo "  text-align: center;"; // Center-align the faculty profile
echo "}";
echo ".faculty-expertise img {";
echo "  width: 150px;";
echo "  height: 150px;";
echo "  border-radius: 50%;";
echo "}";
echo ".discussion-forum {";
echo "  margin-bottom: 20px;";
echo "  padding: 20px;";
echo "  border: 1px solid #ccc;";
echo "  border-radius: 10px;";
echo "  background-color: #f9f9f9;";
echo "}";
echo "</style>";
echo "</head>";
echo "<body>";
echo "<div class='container'>";

// Handle form submission
if (isset($_POST['question'])) {
    $question_text = $_POST['question'];
    $subcategory_id = $_POST['subcategory'];

    $sql = "SELECT ec.id AS question_category_id
    FROM subcategory sc
    JOIN expertise_category ec ON sc.expertise_category_id = ec.id
    WHERE sc.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $subcategory_id);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
$question_category_id = $row['question_category_id'];

// ...

// Get the question category ID and category name from the subcategory ID
$sql = "SELECT ec.id AS question_category_id, ec.category_name
        FROM subcategory sc
        JOIN expertise_category ec ON sc.expertise_category_id = ec.id
        WHERE sc.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $subcategory_id);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
$question_category_id = $row['question_category_id'];
$category_name = $row['category_name'];

// Check if the question category ID exists in the question_category table
$sql = "SELECT id FROM question_category WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $question_category_id);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows == 0) {
    // If the question category ID does not exist, insert it into the question_category table
    $sql = "INSERT INTO question_category (id, category_name) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("is", $question_category_id, $category_name);
    $stmt->execute();
}

// Insert question into database
$sql = "INSERT INTO questions (question_text, question_category_id, question_subcategory_id) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sii", $question_text, $question_category_id, $subcategory_id);
$stmt->execute();

// ...

    // Display question and success message
    echo "<div class='section'>";
    echo "<h2 class='heading'>Your Question:</h2>";
    echo "<p class='question'>" . $question_text . "</p>";
    echo "<h2 class='heading'>Your Question Submitted Successfully!</h2>";
    echo "</div>";

    // Retrieve faculty expertise profile
    $sql = "SELECT f.*, ec.category_name
            FROM faculty f
            JOIN faculty_expertise fe ON f.id = fe.faculty_id
            JOIN expertise_category ec ON fe.expertise_category_id = ec.id
            WHERE ec.id = '$question_category_id' AND fe.subcategory_id = '$subcategory_id'";
    $result = $conn->query($sql);
    $faculty_expertise = array();
    while ($row = $result->fetch_assoc()) {
        $faculty_expertise[] = $row;
    }

    // Display faculty expertise profile
    echo "<div class='section'>";
    echo "<h2 class='heading'>Faculty Expertise Profile Based On Your Question:</h2>";
    foreach ($faculty_expertise as $faculty) {
        echo "<div class='faculty-expertise'>";
        echo "<p><img src='" . $faculty['photo'] . "' alt='Faculty Photo'></p>";
        echo "<p><strong>Name:</strong> " . $faculty['name'] . "</p>";
        echo "<p><strong>Department:</strong> " . $faculty['department'] . "</p>";
        echo "<p><strong>Email:</strong> " . $faculty['email'] . "</p>";
        echo "<p><strong>Phone:</strong> " . $faculty['phone'] . "</p>";
        echo "<p><strong>Office Hours:</strong> " . $faculty['office_hours'] . "</p>";
        echo "</div>";
        echo "<hr>";
    }
    echo "</div>";
}

// Display link to view and reply to questions
echo "<div class='section'>";
echo "<h2 class='heading'>DISCUSSION FORUM</h2>";
echo "<p style='text-align: center;'><a href='questions.php'>Click Here</a></p>";
echo "</div>";

echo "</div>";
echo "</body>";
echo "</html>";

$conn->close();
?>
