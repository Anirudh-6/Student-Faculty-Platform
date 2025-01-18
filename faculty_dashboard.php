<?php
// faculty_dashboard.php

// Check if user is logged in
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit;
}

// Display welcome message
echo "<html>
<head>
    <title>Faculty Dashboard</title>
    <style>
        /* Add CSS styles here */
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .dashboard {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            color: #333;
        }
        a {
            text-decoration: none;
            color: #337ab7;
        }
        a:hover {
            color: #23527c;
        }
    </style>
</head>
<body>
    <div class='dashboard'>
        <h1>Welcome, ".$_SESSION['username']."!</h1>
        <h2>Give Replies to Qestion based on Your Expertise Category</h2>
        <p><a href='questions.php'>View Questions and Give Replies</a></p>
    </div>
</body>
</html>";
?>