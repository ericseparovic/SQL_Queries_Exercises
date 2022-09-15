USE musimundos;

-- 1. Listar las canciones cuya duración sea mayor a 2 minutos.
SHOW TABLES;

SELECT *
FROM canciones
WHERE milisegundos > 12000;

-- 2. Listar las canciones cuyo nombre comience con una vocal.
SELECT * 
FROM canciones
WHERE nombre REGEXP '^[aeiou]';
-- 3. Listar las canciones ordenadas por compositor en forma descendente.
SELECT *
FROM canciones
ORDER BY compositor DESC;
-- Luego, por nombre en forma ascendente. Incluir únicamente aquellas
-- canciones que tengan compositor.
SELECT *
FROM canciones
ORDER BY compositor DESC, nombre ASC;
-- 4. a) Listar la cantidad de canciones de cada compositor.
SELECT COUNT(id), compositor
FROM canciones
GROUP BY compositor;

SELECT count(*)
FROM canciones
WHERE compositor LIKE 'Roy Z%';
-- b) Modificar la consulta para incluir únicamente los compositores que
-- tengan más de 10 canciones.
SELECT COUNT(id) AS cantidad, compositor
FROM canciones
GROUP BY compositor
HAVING cantidad > 10
ORDER BY cantidad DESC;

-- 5. a) Listar el total facturado agrupado por ciudad.
SELECT SUM(total), ciudad_de_facturacion
FROM facturas
GROUP BY ciudad_de_facturacion;

-- b) Modificar el listado del punto (a) mostrando únicamente las ciudades
-- de Canadá.
SELECT SUM(total), ciudad_de_facturacion, pais_de_facturacion
FROM facturas
WHERE pais_de_facturacion IN ('Canada')
GROUP BY ciudad_de_facturacion;

SELECT * FROM facturas;
-- c) Modificar el listado del punto (a) mostrando únicamente las ciudades
-- con una facturación mayor a 38.
SELECT SUM(total),  pais_de_facturacion
FROM facturas
GROUP BY ciudad_de_facturacion
HAVING SUM(total) > 38;
-- d) Modificar el listado del punto (a) agrupando la facturación por país, y
-- luego por ciudad.
SELECT SUM(total), pais_de_facturacion, ciudad_de_facturacion
FROM facturas
GROUP BY pais_de_facturacion, ciudad_de_facturacion ;
-- 6. a) Listar la duración mínima, máxima y promedio de las canciones.
SELECT MAX(milisegundos), MIN(milisegundos), AVG(milisegundos), nombre
FROM  canciones
GROUP BY id;
-- b) Modificar el punto (a) mostrando la información agrupada por género.

