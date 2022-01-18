-- 1) Mostrar el título y el nombre del género de todas las series.

SELECT genres.name, series.title
FROM series
JOIN genres
ON series.genre_id = genres.id

-- 2) Mostrar el título de los episodios, el nombre y apellido de los actores que trabajan en cada uno de ellos.

SELECT episodes.title, actors.first_name, actors.last_name
FROM actor_episode
JOIN actors ON actors.id = actor_episode.actor_id
JOIN episodes ON episodes.id = actor_episode.episode_id

-- 3) Mostrar el título de todas las series y el total de temporadas que tiene cada una de ellas.

SELECT series.title AS Serie, count(seasons.serie_id) AS Temporadas
FROM series JOIN seasons ON series.id = seasons.Serie_id
GROUP BY serie_id

-- 4) Mostrar el nombre de todos los géneros y la cantidad total de películas por cada uno, siempre que sea mayor o igual a 3.

SELECT genres.name, COUNT(movies.genre_id) AS cantidad
FROM genres
JOIN movies ON genres.id = movies.genre_id
GROUP BY genre_id
HAVING cantidad >= 3

-- 5) Mostrar sólo el nombre y apellido de los actores que trabajan en todas las películas de la guerra de las galaxias y que estos no se repitan.

SELECT DISTINCT actors.first_name, actors.last_name
FROM actor_movie
LEFT JOIN actors ON actors.id = actor_movie.actor_id
LEFT JOIN movies ON movies.id = actor_movie.movie_id
WHERE movies.title LIKE 'La Guerra de las Galaxias%'