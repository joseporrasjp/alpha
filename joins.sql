SELECT libros.titulo,
CONCAT(autores.nombre," ", autores.apellido) AS nombre_autor,
libros.fecha_creacion
FROM libros
INNER JOIN autores ON libros.autor_id = autores.autor_id
        AND autores.seudonimo IS NOT NULL;


LEFT JOIN

usuarios = a
libros_usuarios = b

SELECT
CONCAT(nombre," ", apellidos),
libros_usuarios.libro_id

FROM usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.libro_id IS NOT NULL;



SELECT
CONCAT(nombre," ", apellidos),
libros_usuarios.libro_id

FROM libros_usuarios
RIGHT JOIN usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id;



SELECT
CONCAT(nombre, " ", apellidos) AS nombre_usuario
FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id=libros_usuarios.usuario_id;


SELECT DISTINCT
CONCAT(usuarios.nombre, " ", usuarios.apellidos) AS nombre_usuario
FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id=libros_usuarios.usuario_id;


SELECT DISTINCT
CONCAT(usuarios.nombre, " ", usuarios.apellidos) AS nombre_usuario
FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id=libros_usuarios.usuario_id
INNER JOIN libros ON libros_usuarios.libro_id = libros.libro_id
INNER JOIN autores ON libros.autor_id = autores.autor_id
        AND autores.seudonimo IS NOT NULL;
