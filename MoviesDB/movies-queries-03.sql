USE movies_db;
-- Funciones de agregación, GROUP BY y HAVING
-- 1. ¿Cuántas películas hay?
SELECT COUNT(id) AS cantidad
FROM movies;
-- 2. ¿Cuántas películas tienen entre 3 y 7 premios?
SELECT *
FROM movies
WHERE awards BETWEEN 3 AND 7
ORDER BY awards;
-- 3. ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?
SELECT COUNT(id)
FROM movies
WHERE awards BETWEEN 3 AND 7 AND rating > 7;
-- 4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
-- cantidad de películas por id. de género.
SELECT Count(movies.id) AS CANT_MOVIES, genres.name
FROM movies 
INNER JOIN genres ON movies.genre_id = genres.id
GROUP BY genres.id;


-- 5. De la consulta anterior, listar sólo aquellos géneros que tengan como suma
-- de premios un número mayor a 5.
SELECT Count(movies.awards) AS CANT_premios, genres.name
FROM movies 
INNER JOIN genres ON movies.genre_id = genres.id
GROUP BY genres.id
HAVING COUNT(movies.awards) > 4;


select * from movies;
