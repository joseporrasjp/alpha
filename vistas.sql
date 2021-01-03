CREATE VIEW prestamos_usuarios_vw AS
SELECT
usuarios.usuario_id,
usuarios.nombre,
usuarios.email,
usuarios.username,
COUNT(usuarios.usuario_id) AS total_prestamos

FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id=libros_usuarios.usuario_id
    AND libros_usuarios.fecha_creacion>=CURDATE() -INTERVAL 5 DAY
GROUP BY usuarios.usuario_id;


--MODIFICANDO VISTA WITH CREATE OR REPLACE VIEW

CREATE OR REPLACE VIEW prestamos_usuarios_vw AS
SELECT
usuarios.usuario_id,
usuarios.nombre,
usuarios.email,
usuarios.username,
COUNT(usuarios.usuario_id) AS total_prestamos

FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id=libros_usuarios.usuario_id
    AND libros_usuarios.fecha_creacion>=CURDATE() -INTERVAL 5 DAY
GROUP BY usuarios.usuario_id;

--//Ejercicios parte 2

/*Obtener a todos los usuarios que han realizado un préstamo
en los últimos diez días*/
usuarios
libros_usuarios

SELECT
CONCAT (usuarios.nombre, " ", usuarios.apellidos),
usuarios.fecha_creacion
FROM usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
AND libros_usuarios.fecha_creacion = CURDATE() - INTERVAL 10 DAY;

/*Obtener a todos los usuarios que no ha realizado ningún
préstamo*/

usuarios
libros_usuarios

SELECT
CONCAT (nombre, " ", apellidos),
libros_usuarios.fecha_creacion
FROM libros_usuarios
RIGHT JOIN usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
AND libros_usuarios.fecha_creacion IS NULL;

/*Listar de forma descendente a los cinco usuarios con más préstamos*/

SELECT
usuarios.usuario_id,
CONCAT (nombre, " ", apellidos),
COUNT(libros_usuarios.libro_id) AS total
FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
GROUP BY usuario_id
HAVING total > 1 ORDER BY total DESC;

/*Listar 5 títulos con más préstamos en los últimos 30 días*/

libros_usuarios
libros

SELECT
libros.titulo,
COUNT(libros_usuarios.libro_id) AS total,
libros_usuarios.fecha_creacion
FROM libros
INNER JOIN libros_usuarios ON libros.libro_id = libros_usuarios.libro_id
AND libros_usuarios.fecha_creacion > CURDATE() - INTERVAL 30 DAY
GROUP BY titulo ORDER BY total DESC LIMIT 5;

/*Obtener el título de todos los libros que no han sido prestados*/

libros_usuarios
libros

SELECT
libros.titulo,
COUNT(libros_usuarios.libro_id) AS total
FROM libros
LEFT JOIN libros_usuarios ON libros.libro_id = libros_usuarios.libro_id
GROUP BY libros.titulo
HAVING COUNT(libros_usuarios.libro_id) = 0;

/*Obtener la cantidad de libros prestados el día de hoy*/

libros
libros_usuarios

SELECT
libros_usuarios.fecha_creacion,
COUNT(libros_usuarios.libro_id) AS total
FROM libros_usuarios
LEFT JOIN libros ON libros_usuarios.libro_id = libros.libro_id
AND DATE(libros_usuarios.fecha_creacion) = @hoy
GROUP BY libros_usuarios.fecha_creacion;

/*Obtener la cantidad de libros prestados por el autor con id 1*/
libros_usuarios
libros
autores

SELECT
CONCAT(autores.nombre, " ", autores.apellido),
COUNT(libros_usuarios.libro_id)
FROM libros_usuarios
INNER JOIN libros ON libros_usuarios.libro_id = libros.libro_id
INNER JOIN autores ON libros.autor_id = autores.autor_id
AND autores.autor_id = 1
GROUP BY autores.autor_id;

/*Obtener el nombre completo de los cinco autores
con más préstamos*/

libros_usuarios
libros
autores

SELECT
CONCAT(autores.nombre, " ", autores.apellido) AS nombre_completo,
COUNT(libros_usuarios.libro_id) AS libros_prestados
FROM libros_usuarios
INNER JOIN libros ON libros_usuarios.libro_id = libros.libro_id
INNER JOIN autores ON libros.autor_id = autores.autor_id
GROUP BY nombre_completo
ORDER BY libros_prestados DESC LIMIT 5;

/*Obtener el título del libro con más préstamos esta semana*/

libros_usuarios
libros

SELECT
libros.titulo,
COUNT(libros_usuarios.libro_id) AS libros_prestados
FROM libros_usuarios
RIGHT JOIN libros ON libros_usuarios.libro_id = libros.libro_id
AND libros_usuarios.fecha_creacion > CURDATE() - INTERVAL 7 DAY
GROUP BY titulo
ORDER BY libros_prestados DESC LIMIT 1;
