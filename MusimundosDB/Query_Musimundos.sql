USE musimundos;
-- 1. Listar las canciones cuya duración sea mayor a 2 minutos.
DESCRIBE canciones;

SELECT *
FROM canciones 
WHERE milisegundos > 12000;

 


-- 2. Listar las canciones cuyo nombre comience con una vocal.
SELECT *
FROM canciones
WHERE nombre REGEXP "^[AEIOU]";

-- 3. Listar las canciones ordenadas por compositor en forma descendente.
SELECT * 
FROM canciones
ORDER BY compositor DESC;

-- Luego, por nombre en forma ascendente. Incluir únicamente aquellas
-- canciones que tengan compositor.
SELECT *
FROM canciones
WHERE compositor != ""
ORDER BY nombre;

-- 4. a) Listar la cantidad de canciones de cada compositor.
SELECT compositor, COUNT(id)
FROM canciones
GROUP BY compositor;


-- b) Modificar la consulta para incluir únicamente los compositores que
-- tengan más de 10 canciones.
SELECT compositor, COUNT(id) AS cantidad
FROM canciones
GROUP BY compositor
HAVING cantidad > 10;

-- 5. a) Listar el total facturado agrupado por ciudad.
SELECT pais_de_facturacion, SUM(total)
FROM facturas
GROUP BY pais_de_facturacion;

-- b) Modificar el listado del punto (a) mostrando únicamente las ciudades de Canadá.
SELECT pais_de_facturacion, SUM(total) AS Total
FROM facturas
GROUP BY pais_de_facturacion
HAVING pais_de_facturacion = "Canada";

-- c) Modificar el listado del punto (a) mostrando únicamente las ciudades con una facturación mayor a 38.
SELECT pais_de_facturacion, SUM(total) AS Total
FROM facturas
GROUP BY pais_de_facturacion
HAVING Total > 38;

-- d) Modificar el listado del punto (a) agrupando la facturación por país, y luego por ciudad.
SELECT ciudad_de_facturacion, COUNT(id)
FROM facturas
GROUP BY ciudad_de_facturacion;
DESCRIBE facturas;

-- 6. a) Listar la duración mínima, máxima y promedio de las canciones.
SELECT MIN(milisegundos) AS MINIMA, MAX(milisegundos) AS MAXIMA, AVG(milisegundos) AS PROMEDIO
FROM canciones;


-- b) Modificar el punto (a) mostrando la información agrupada por género.
SELECT id_genero, MIN(milisegundos) AS MINIMA, MAX(milisegundos) AS MAXIMA, AVG(milisegundos) AS PROMEDIO
FROM canciones
INNER JOIN generos
ON canciones.id_genero = generos.id
GROUP BY id_genero;


DESCRIBE canciones;