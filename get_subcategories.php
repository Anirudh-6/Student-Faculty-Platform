<?php
// get_subcategories.php

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

// Retrieve category ID from GET request
$category_id = $_GET['category_id'];

// Retrieve subcategories
$sql = "SELECT * FROM subcategory WHERE expertise_category_id = '$category_id'";
$result = $conn->query($sql);

// Display subcategories as options
while ($row = $result->fetch_assoc()) {
    echo "<option value='".$row['id']."'>".$row['subcategory_name']."</option>";
}

?>