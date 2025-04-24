<?php
header('Content-Type: application/json');

$movieId = isset($_GET['movie_id']) ? intval($_GET['movie_id']) : 0;

$host = 'localhost';
$db   = 'vvn_movies';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $stmt = $pdo->prepare("SELECT rating FROM reviews WHERE movie_id = ?");
    $stmt->execute([$movieId]);
    $reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($reviews);
} catch (PDOException $e) {
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
?>