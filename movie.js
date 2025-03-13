document.addEventListener("DOMContentLoaded", async () => {
    const params = new URLSearchParams(window.location.search);
    const movieId = params.get("movie");
    const response = await fetch(`get_movie.php?id=${movieId}`);
    const movie = await response.json();

    const movieDetails = document.getElementById("movie-details");
    if (movie) {
        movieDetails.innerHTML = `
            <h1>${movie.title}</h1>
            <img src="${movie.image}" class="img-fluid" alt="${movie.title}">
            <p>${movie.description}</p>
            <iframe width="560" height="315" src="${movie.video_url}" frameborder="0" allowfullscreen></iframe>
        `;
    } else {
        movieDetails.innerHTML = "<h2>Филмът не е намерен</h2>";
    }
});
