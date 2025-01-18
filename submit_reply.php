<?php
// Connect to the database
// ...

// Get the question ID and reply from the form
$question_id = $_POST['question_id'];
$reply = $_POST['reply'];

// Insert the reply into the database
// ...

// Redirect back to the questions page
header('Location: questions.php');
exit;
?>