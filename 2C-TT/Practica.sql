-- 1) Explicar el concepto de normalización y para que se utiliza.

-- La normalización de bases de datos es un proceso que consiste en designar
-- y aplicar una serie de reglas a las relaciones obtenidas tras el paso del
-- modelo entidad-relación al modelo relacional con objeto de minimizar la
-- redundancia de datos, facilitando su gestión posterior

-- 2) Agregar una película a la tabla movies.

INSERT INTO movies (title, rating, awards, release_date, length, genre_id)
VALUES('The Witch', 10.0, 33, '2017-9-28', 120, 6) 

-- 3) Agregar un género a la tabla genres.

INSERT INTO genres (name, ranking, active)
VALUES('Deportes', 13, 1)

-- 4) Asociar a la película del Ej 2. con el género creado en el Ej. 3.

UPDATE movies
SET genre_id = 13
WHERE id = 22

-- 5) Modificar la tabla actors para que al menos un actor tenga como favorita la película agregada en el Ej.2.

UPDATE actors
SET favorite_movie_id = 22
WHERE id = 14 

-- 6) Crear una tabla temporal copia de la tabla movies.

CREATE TEMPORARY TABLE temporal_movies
SELECT *
FROM movies

-- 7) Eliminar de esa tabla temporal todas las películas que hayan ganado menos de 5 awards.

DELETE FROM temporal_movies
WHERE awards < 5

-- 8) Obtener la lista de todos los géneros que tengan al menos una película.

SELECT DISTINCT genres.name
FROM genres
JOIN movies ON movies.genre_id = genres.id

-- 9) Obtener la lista de actores cuya película favorita haya ganado más de 3 awards. 

SELECT actors.first_name, actors.last_name
FROM actors
LEFT JOIN movies ON actors.favorite_movie_id = movies.id
WHERE movies.awards > 3

-- 10) Utilizar el explain plan para analizar las consultas del Ej.6 y 7.



-- 11) ¿Qué son los índices? ¿Para qué sirven?

-- Son un mecanismo que nos permiten optimizar las consultas en una Base de Datos.

-- 12) Crear un índice sobre el nombre en la tabla movies.

CREATE INDEX movies_name_idx
ON movies(title)

-- 13) Chequee que el índice fue creado correctamente.

SHOW INDEX FROM movies