USE estacion_policia;

INSERT INTO estaciones (nombre, direccion, telefono) VALUES
('Estación Central', 'Cr 0 #00-00', 300000000),
('Estación Norte', 'Cr 1 #11-11', 311111111),
('Estación Sur', 'Cr 2 #22-22', 322222222),
('Estación Occidente', 'Cr 3 80 #33-33', 333333333),
('Estación Oriente', 'Cr 4 #44-44', 344444444);

INSERT INTO policias (nombrecompleto, fechacontrato, telefono, email, id_estacion) VALUES
('Pablo Daza', '2025-12-9', 355555555, 'pablo@policia.gov', 1),
('Johan Castro', '2024-07-16', 366666666, 'jogan@policia.gov', 2),
('Pablo Mozuca', '2023-02-22', 377777777, 'pmozuca@policia.gov', 3),
('Santiago Beltran', '2022-01-03', 388888888, 'santiago@policia.gov', 4),
('David Perez', '2023-11-29', 399999999, 'dperez@policia.gov', 5);

INSERT INTO autos (matricula, marca, modelo, estado, id_estacion) VALUES
('AAA111', 'Renault', 'Logan', 'Activo', 1),
('BBB222', 'Chevrolet', 'Camaro', 'En mantenimiento', 2),
('CCC333', 'BMW', 'X1', 'Activo', 3),
('DDD444', 'Mazda', '3', 'Disponible', 4),
('EEE555', 'Nissan', 'SR', 'Revisión', 5);

INSERT INTO auto_policia (id_policia, id_auto) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO criminales (nombrecompleto, fechanacimiento, direccion, telefono) VALUES
('Franklin C.', '1988-03-23', 'Cr 5 #55-55', 320111111),
('Carl J.', '1968-04-19', 'Cr 6 #66-66', 320222222),
('Big Smoke', '1965-10-04', 'Cr 7 #77-77', 320333333),
('Cesar Vialpando', '1970-12-12', 'Cr 8 #88-88', 320444444),
('Martin Madrazo', '1962-04-24', 'Cr 9 #99-99', 320555555);

INSERT INTO cargos (nombre, descripcion, gravedad) VALUES
('Robo', 'Hurto a mano armada en tienda', 3),
('Asalto', 'Agresión física con arma blanca', 4),
('Secuestro', 'Privación ilegal de la libertad', 5),
('Fraude', 'Falsificación de documentos públicos', 2),
('Homicidio', 'Asesinato con premeditación', 5);

INSERT INTO reportes (fecha_incidente, lugar_incidente, descripcion, tipo, estado, id_policia) VALUES
(NOW(), 'Centro Comercial', 'Intento de robo a mano armada', 'Robo', 'Abierto', 1),
(NOW(), 'Parque Central', 'Asalto a un transeúnte', 'Asalto', 'Cerrado', 2),
(NOW(), 'Banco', 'Falsificación de cheques', 'Fraude', 'Abierto', 3),
(NOW(), 'Zona Industrial', 'Secuestro de un empresario', 'Secuestro', 'Investigación', 4),
(NOW(), 'Barrio Grove street', 'Homicidio con arma de fuego', 'Homicidio', 'Cerrado', 5);

INSERT INTO delito_criminal (id_criminal, id_cargo, id_reporte, sentencia, estado) VALUES
(1, 1, 1, '2 años de prisión', 'Cumpliendo'),
(2, 2, 2, '3 años de prisión', 'Cumpliendo'),
(3, 3, 3, '10 años de prisión', 'Cumplido'),
(4, 4, 4, '15 años de prisión', 'En proceso'),
(5, 5, 5, '100 años de prisión', 'En proceso');

INSERT INTO arrestos (id_reporte, id_criminal, id_policia, lugar_arresto) VALUES
(1, 1, 1, 'Centro Comercial'),
(2, 2, 2, 'Parque Central'),
(3, 3, 3, 'Banco'),
(4, 4, 4, 'Zona Industrial'),
(5, 5, 5, 'Barrio Grove street');