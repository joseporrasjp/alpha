

CREATE TABLE cliente (ID_CLIENTE int primary key auto_increment, Nombres nvarchar(50), Apellidos nvarchar(50));

INSERT INTO cliente (ID_CLIENTE, Nombres, Apellidos)
VALUES (1, 'Axel', 'Aguilar'),
       (2, 'Lucia', 'Estrada'),
       (3, 'Juan', 'Perez'),
       (4, 'Carlos', 'Sanchez'),
       (5, 'Karen', 'Lopez'),
       (6, 'CINTHIA', 'GOMEZ'),
       (7, 'Walter', 'Cordero'),
       (8, 'Karla', 'Herrera');

CREATE TABLE Factura (Codigo varchar(50), Fecha varchar(50), Serie varchar(1), Factura int, ID_CLIENTE int);

INSERT INTO Factura (Codigo , Fecha, Serie, Factura, ID_CLIENTE)
VALUES ('3090-10001', '10-08-2020', 'A', '12345678', 1 ),
       ('3090-10002', '11-08-2020', 'A', '87654321', 2 ),
       ('3090-10003', '12-08-2020', 'A', '12348765', 3 ),
       ('3090-10004', '13-08-2020', 'A', '56784321', 4 ),
       ('3090-10005', '14-08-2020', 'A', '56781234', 5 ),
       ('3090-10006', '15-08-2020', 'A', '876543219', 6 ),
       ('3090-10007', '16-08-2020', 'A', '87654932',  7 ),
       ('3090-10008', '17-08-2020', 'A', '98761232', 8 );

CREATE TABLE Detalle_Factura (ID_DetalleFact int primary key auto_increment, Productos int);

INSERT INTO Detalle_Factura (ID_DetalleFact, Productos)
                        VALUES(1,'1'),
                              (2, '2'),
                              (3, '3'),
                              (4, '4'),
                              (5, '5'),
                              (6, '6'),
                              (7, '7'),
                              (8, '8'),
                              (9, '9'),
                              (10, '10'),
                              (11, '11'),
                              (12, '12'),
                              (13, '13'),
                              (14, '14'),
                              (15, '15'),
                              (16, '16'),
                              (17, '17'),
                              (18, '18'),
                              (19, '19'),
                              (20, '20'),
                              (21, '21'),
                              (22, '22'),
                              (23, '23'),
                              (24, '24');

CREATE TABLE productos (ID_Productos int primary key auto_increment, Producto nvarchar(50), Precio int);

INSERT INTO Productos ( ID_Productos, Producto, Precio)
VALUES (1,  'LAPTOP' ,'5000'),
       (2,  'IMPRESORA' ,'1200'),
       (3,  'MONITOR' ,'1500'),
       (4,  'LAPTOP' ,'6000'),
       (5,  'IMPRESORA' ,'1100'),
       (6,  'MONITOR' ,'1350'),
       (7, 'PC' ,'7000'),
       (8,  'MONITOR' ,'1400'),
       (9,  'IMPRESORA' ,'290'),
       (10,  'LAPTOP' ,'5500'),
       (11,  'MONITOR' ,'1800'),
       (13,  'PC' ,'4500'),
       (14,  'MONITOR' ,'1000'),
       (15,  'IMPRESORA' ,'375'),
       (16, 'PC' ,'3500'),
       (17, 'MONITOR' ,'1800'),
       (18, 'IMPRESORA' ,'400'),
       (19,  'LAPTOP' ,'4800'),
       (20, 'IMPRESORA' ,'895'),
       (21, 'MONITOR' ,'1700'),
       (22,  'PC' ,'3000'),
       (23,   'MONITOR' ,'1000'),
       (24, 'IMPRESORA' ,'350');
