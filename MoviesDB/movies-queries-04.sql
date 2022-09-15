-- 1. Utilizando la base de datos de movies, queremos conocer, por un lado, los
-- títulos y el nombre del género de todas las series de la base de datos.
SELECT series.title, genres.name
FROM series 
INNER JOIN genres ON series.genre_id = genres.id;


-- 2. Por otro, necesitamos listar los títulos de los episodios junto con el nombre y
-- apellido de los actores que trabajan en cada uno de ellos.
SHOW TABLES;
SELECT * FROM actor_episode;


SELECT episodes.title, CONCAT(actors.first_name, ' ', actors.last_name) AS nombre
FROM actor_episode
INNER JOIN episodes ON actor_episode.episode_id = episodes.id
INNER JOIN actors ON actor_episode.actor_id = actors.id;

SELECT * from actors;


-- 3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o
-- actrices (mostrar nombre y apellido) que han trabajado en cualquier película
-- de la saga de La Guerra de las galaxias
SELECT DISTINCT concat( actors.first_name," ", actors.last_name) AS NOMBRE, movies.title
FROM actor_movie
INNER JOIN actors ON actors.id = actor_movie.actor_id
INNER JOIN movies ON movies.id = actor_movie.movie_id
WHERE movies.title LIKE '%Guerra%';

-- 4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
-- cantidad de películas por nombre de género.
SELECT COUNT(movies.id), genre_id, genres.name
FROM movies 
INNER JOIN genres ON movies.genre_id = genres.id
GROUP BY genre_id;