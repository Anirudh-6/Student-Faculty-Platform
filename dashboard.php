<?php
// dashboard.php

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
    die("Connection failed: ". $conn->connect_error);
}

// Display welcome message
echo "<!DOCTYPE html>";
echo "<html>";
echo "<head>";
echo "<title>Dashboard</title>";
echo "<style>";
echo "/* Global Styles */";
echo "* {";
echo "  box-sizing: border-box;";
echo "  margin: 0;";
echo "  padding: 0;";
echo "}";
echo "body {";
echo "  font-family: Arial, sans-serif;";
echo "  background-color: #f0f0f0;";
echo "}";
echo ".container {";
echo "  max-width: 600px;";
echo "  margin: 40px auto;";
echo "  padding: 40px;";
echo "  background-color: #fff;";
echo "  border: 1px solid #ddd;";
echo "  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);";
echo "}";
echo ".welcome {";
echo "  text-align: center;";
echo "  margin-bottom: 20px;";
echo "  font-size: 24px;";
echo "  font-weight: bold;";
echo "  color: #337ab7;";
echo "}";
echo ".ask-question {";
echo "  background-color: #f9f9f9;";
echo "  padding: 20px;";
echo "  border: 1px solid #ccc;";
echo "  margin-bottom: 20px;";
echo "}";
echo ".ask-question h2 {";
echo "  margin-top: 0;";
echo "}";
echo ".ask-question label {";
echo "  display: block;";
echo "  margin-bottom: 10px;";
echo "}";
echo ".ask-question select,.ask-question textarea {";
echo "  width: 100%;";
echo "  padding: 10px;";
echo "  margin-bottom: 20px;";
echo "  border: 1px solid #ccc;";
echo "}";
echo ".ask-question input[type=\"submit\"] {";
echo "  background-color: #4CAF50;";
echo "  color: #fff;";
echo "  padding: 10px 20px;";
echo "  border: none;";
echo "  border-radius: 5px;";
echo "  cursor: pointer;";
echo "}";
echo ".ask-question input[type=\"submit\"]:hover {";
echo "  background-color: #3e8e41;";
echo "}";
echo ".faculty-expertise {";
echo "  background-color: #f9f9f9;";
echo "  padding: 20px;";
echo "  border: 1px solid #ccc;";
echo "  margin-bottom: 20px;";
echo "}";
echo ".faculty-expertise h2 {";
echo "  margin-top: 0;";
echo "}";
echo ".faculty-expertise p {";
echo "  margin-bottom: 10px;";
echo "}";
echo ".discussion-forum {";
echo "  background-color: #f9f9f9;";
echo "  padding: 30px;";
echo "  border: 1px solid #ccc;";
echo "  margin-bottom: 20px;";
echo "}";
echo "</style>";
echo "</head>";
echo "<body>";
echo "<div class='container'>";
echo "<h1 class='welcome'>Welcome, ".$_SESSION['username']."!</h1>";

// Display ask question form
echo "<div class='ask-question'>";
echo "<h2>Ask Your Question</h2>";
echo "<form action='ask_question.php' method='post'>";
echo "<label for='category'>Select Category:</label>";
echo "<select id='category' name='category' onchange='showSubcategories(this.value)'>";
$sql = "SELECT * FROM expertise_category";
$result = $conn->query($sql);
while ($row = $result->fetch_assoc()) {
    echo "<option value='".$row['id']."'>".$row['category_name']."</option>";
}
echo "</select>";
echo "<br><br>";


// Display subcategory dropdown
echo "<label for='subcategory'>Select Subcategory:</label>";
echo "<select id='subcategory' name='subcategory' onchange='showFacultyExpertise(this.value)'>";
echo "<option value=''>Select Subcategory</option>";
echo "</select>";
echo "<br><br>";

echo "<label for='question'>Enter Your Question:</label>";
echo "<textarea id='question' name='question'></textarea>";
echo "<br><br>";
echo "<input type='submit' value='Ask Question'>";
echo "</form>";

// JavaScript code to show subcategories based on selected category
echo "<script>";
echo "function showSubcategories(categoryId) {";
echo "    var xmlhttp = new XMLHttpRequest();";
echo "    xmlhttp.onreadystatechange = function() {";
echo "        if (this.readyState == 4 && this.status == 200) {";
echo "            document.getElementById('subcategory').innerHTML = this.responseText;";
echo "        }";
echo "    };";
echo "    xmlhttp.open('GET', 'get_subcategories.php?category_id=' + categoryId, true);";
echo "    xmlhttp.send();";
echo "}";
echo "</script>";

// JavaScript code to show faculty expertise based on selected subcategory
echo "<script>";
echo "function showFacultyExpertise(subcategoryId) {";
echo "    var xmlhttp = new XMLHttpRequest();";
echo "    xmlhttp.onreadystatechange = function() {";
echo "        if (this.readyState == 4 && this.status == 200) {";
echo "            document.getElementById('faculty-expertise').innerHTML = this.responseText;";
echo "        }";
echo "    };";
echo "    xmlhttp.open('GET', 'get_faculty_expertise.php?subcategory_id=' + subcategoryId, true);";
echo "    xmlhttp.send();";
echo "}";
echo "</script>";

// Display faculty expertise profile
echo "<div id='faculty-expertise'></div>";

// Add a text discussion forum
echo "<h2>Discussion Forum</h2>";

// Add a link to navigate to questions.php
echo "<p><a href='questions.php'>View Questions and Give Replies</a></p>";

?>