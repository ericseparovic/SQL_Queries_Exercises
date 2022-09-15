
-- 11. Calcular la recaudación total de cada forma de pago para las reservas. Mostrar la
-- forma de pago y el total.
SELECT forma_pago.nombre, SUM(reserva.importe) as total
FROM reserva
INNER JOIN  forma_pago ON reserva.forma_pago_id = forma_pago.id
GROUP BY forma_pago.id;

-- Cantidad de registros: 4 

-- 12. Listar los empleados del sector 'administración' que su país de origen sea
-- 'Argentina'. Mostrar el número de legajo, apellido, la primera inicial del primer
-- nombre y un punto, nombre de su país de origen y el nombre del sector.
SELECT empleado.legajo, empleado.apellido, CONCAT(SUBSTRING(empleado.nombre, 1, 1),".") AS nombre, pais.nombre, sector.nombre
FROM empleado
INNER JOIN sector ON empleado.sector_id = sector.id
INNER JOIN pais ON empleado.pais_id = pais.id
HAVING pais.nombre IN ("Argentina") AND sector.nombre IN ("Administracion");

-- Cantidad de registros: 3

-- 13. Listar todos los servicios básicos que tienen las habitaciones (desde la 20 hasta
-- la 24) y su clase. Mostrar número de habitación, clase y el nombre de los
-- servicios básicos. Ordenar por número de habitación y servicio.
SELECT habitacion.numero, clase.nombre, servicio_basico.nombre
FROM habitacion_x_servicio_basico
INNER JOIN servicio_basico ON habitacion_x_servicio_basico.servicio_basico_id = servicio_basico.id
INNER JOIN habitacion ON habitacion.numero = habitacion_x_servicio_basico.habitacion_numero
INNER JOIN clase  ON habitacion.clase_id = clase.id
WHERE habitacion.numero BETWEEN 20 AND 24 
ORDER BY habitacion_x_servicio_basico.habitacion_numero, servicio_basico.nombre;

-- Cantidad de registro 28

-- 14. Listar las decoraciones que no están aplicadas en ninguna habitación.
SELECT decoracion.id, decoracion.nombre 
FROM habitacion
RIGHT JOIN decoracion ON habitacion.decoracion_id = decoracion.id
WHERE habitacion.numero IS NULL;
-- Cantidad de registros: 2

-- 15. Listar todos los empleados categorizándolos por edad. Las categorías son:
-- 'junior' (hasta 35 años), 'semi-senior' (entre 36 a 40 años) y 'senior' (más de 40).
-- Mostrar el apellido, nombre, edad, categoría y ordenar por edad.
SELECT apellido, nombre, timestampdiff(year, fecha_nacimiento,CURDATE()) AS edad,
	CASE
		WHEN timestampdiff(year, fecha_nacimiento,CURDATE()) <= 35 THEN 'junior'
		WHEN timestampdiff(year, fecha_nacimiento,CURDATE()) > 35 AND timestampdiff(year, fecha_nacimiento,CURDATE()) <= 40 THEN 'semi-senior'
		WHEN timestampdiff(year, fecha_nacimiento,CURDATE()) >40 THEN 'senior'
	END AS categoria 
FROM empleado
ORDER BY edad;