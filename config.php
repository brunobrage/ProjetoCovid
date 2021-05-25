<?php

    $severname = "localhost";
    $username = "covid";
    $password = "Covid2021";
    $dbname ="db_cidadão";

    $conn = new mysqli($severname, $username, $password, $dbname);

    if($conn->connect_error){
        die("Conection Failed: " . $conn->connect_error);
        return;
    }