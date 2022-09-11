USE sakila;
SHOW TABLES;
-- 1. Obtener el nombre y apellido de los primeros 5 actores disponibles. Utilizar  alias para mostrar los nombres de las columnas en español. 
DESCRIBE actor;

SELECT first_name AS nombre, last_name AS apellido 
FROM actor
LIMIT 5;

-- 2. Obtener un listado que incluya nombre, apellido y correo electrónico de los  clientes (customers) inactivos. Utilizar alias para mostrar los nombres de las 
-- columnas en español.

DESCRIBE customer;
 
SELECT first_name, last_name, email
FROM customer
WHERE active = 1;
-- 3. Obtener un listado de films incluyendo título, año y descripción de los films 
-- que tienen un rental_duration mayor a cinco. Ordenar por rental_duration de 
-- mayor a menor. Utilizar alias para mostrar los nombres de las columnas en español. 
SHOW TABLES;
SELECT title, release_year, description, rental_duration
FROM film
WHERE rental_duration > 5
ORDER BY rental_duration DESC;

-- 4. Obtener un listado de alquileres (rentals) que se hicieron durante el mes de 
-- mayo de 2005, incluir en el resultado todas las columnas disponibles. 
SELECT *, MONTH(return_date) AS mes
FROM rental
WHERE MONTH(return_date) = 5 AND year(return_date) = 2005;

-- Reportes parte 2: Sumemos complejidad 

-- Si llegamos hasta acá, tenemos en claro la estructura básica de un SELECT. En los siguientes reportes vamos a sumar complejidad. 
-- ¿Probamos? 
-- 1. Obtener la cantidad TOTAL de alquileres (rentals). Utilizar un alias para mostrarlo en una columna llamada “cantidad”. 
DESCRIBE rental;
SELECT COUNT(rental_id) AS cantidad
FROM rental;
-- 2. Obtener la suma TOTAL de todos los pagos (payments). Utilizar un alias para mostrarlo en una columna llamada “total”, junto a una columna con la cantidad de alquileres con el alias “Cantidad” y una columna que indique el “Importe promedio” por alquiler. 
DESCRIBE payment;
SELECT SUM(amount) AS total, COUNT(rental_id) AS cantidad
FROM payment;
-- 3. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes que más dinero gastan y en cuántos alquileres lo hacen? 
SELECT SUM(amount) AS total, customer_id, count(rental_id) AS cantidad_alquileres
FROM payment
GROUP BY customer_id
ORDER BY total DESC
LIMIT 10;

-- 4. Generar un reporte que indique: ID de cliente, cantidad de alquileres y monto total para todos los clientes que hayan gastado más de 150 dólares en alquileres. 
SELECT * FROM payment;
SELECT customer_id, COUNT(rental_id) AS cantidad_rental, SUM(amount) AS total
FROM payment
GROUP BY customer_id 
HAVING total > 150
ORDER BY total DESC;
-- 5. Generar un reporte que muestre por mes de alquiler (rental_date de tabla rental), la cantidad de alquileres y la suma total pagada (amount de tabla payment) para el año de alquiler 2005 (rental_date de tabla rental). 

SELECT MONTH(rental.rental_date) AS mes, rental.rental_date, payment.amount
FROM rental, payment;


SELECT month(rental_date)
FROM rental, payment
GROUP BY MONTH(rental_date);

SELECT * FROM rental;

-- 6. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios más alquilados? (columna inventory_id en la tabla rental). Para cada una de ellas indicar la cantidad de alquileres. 

