<?php

    $servername = "shareddb-i.hosting.stackcp.net";
    $username = "bitservices-333797ec";
    $password = "8letters";
    $dbname = "bitservices-333797ec";

    // Create the connection to the database with the above credentials
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check the status of the connection and return a message if failed or connected
    if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    }
	

?>
