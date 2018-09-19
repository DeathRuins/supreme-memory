<?php

    $servername = "ServerName";
    $username = "username";
    $password = "password";
    $dbname = "database name";

    // Create the connection to the database with the above credentials
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check the status of the connection and return a message if failed or connected
    if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    } 
    echo "Connected successfully";

?>
