<?php
$servername = "New con";
$username = "root";
$password = "1234";
$dbname = "vvn_movies";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
