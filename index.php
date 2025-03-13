<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VVN Movies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        .card img, .card-title {
            transition: opacity 0.3s ease;
        }
        .card:hover img, .card:hover .card-title {
            opacity: 0.7;
        }
        .card-title a {
            text-decoration: none;
            color: inherit;
        }
        .card-title a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header class="bg-dark text-white text-center py-4">
        <h1>🎬 VVN Movies</h1>
    </header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#latest-movies">Последни филми</a></li>
                    <li class="nav-item"><a class="nav-link" href="#top-rated">Ревюта</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Контакти</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <main>
        <section id="latest-movies" class="py-5">
            <div class="container">
                <h2 class="text-center">🎥 Последни филми</h2>
                <div class="row mt-4">
                    <?php
                    $servername = "localhost";
                    $username = "root";
                    $password = "";
                    $dbname = "vvn_movies";

                    $conn = new mysqli($servername, $username, $password, $dbname);
                    if ($conn->connect_error) {
                        die("Грешка при свързване: " . $conn->connect_error);
                    }

                    $sql = "SELECT * FROM movies";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "
                            <div class='col-md-4'>
                                <div class='card'>
                                    <a href='movie-details.html?movie={$row['id']}'>
                                        <img src='{$row['image']}' class='card-img-top' alt='{$row['title']}'>
                                    </a>
                                    <div class='card-body'>
                                        <h5 class='card-title'><a href='movie-details.html?movie={$row['id']}'>{$row['title']}</a></h5>
                                        <p class='card-text'>{$row['description']}</p>
                                    </div>
                                </div>
                            </div>";
                        }
                    } else {
                        echo "<p>Няма налични филми.</p>";
                    }

                    $conn->close();
                    ?>
                </div>
            </div>
        </section>
        <section id="top-rated" class="py-5 bg-light">
            <div class="container">
                <h2 class="text-center">⭐ Ревюта</h2>
                <table class="table table-striped mt-4">
                    <thead>
                        <tr>
                            <th>Филм</th>
                            <th>Рейтинг</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $conn = new mysqli($servername, $username, $password, $dbname);
                        $sql = "SELECT m.title, r.rating 
                                FROM reviews r 
                                JOIN movies m ON r.movie_id = m.id 
                                ORDER BY r.rating DESC";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                echo "<tr>
                                    <td>{$row['title']}</td>
                                    <td>{$row['rating']}</td>
                                </tr>";
                            }
                        } else {
                            echo "<tr><td colspan='2'>Няма налични ревюта.</td></tr>";
                        }

                        $conn->close();
                        ?>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    <footer id="contact" class="bg-dark text-white text-center py-4">
        <p>Контакти:</p>
        <p>
            <a href="https://www.facebook.com/" class="text-white me-3"><i class="fab fa-facebook"></i></a>
            <a href="https://www.instagram.com/" class="text-white"><i class="fab fa-instagram"></i></a>
        </p>
    </footer>
</body>
</html>
