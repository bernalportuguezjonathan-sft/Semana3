USE escuela;

INSERT INTO profesor (nombrecompleto, direccion, telefono, asignatura) VALUES
('Sans U.', 'Cr 0 #00-00', 300000000, 'Inglés'),
('Steve M. ', 'Cr 1 #11-11', 311111111, 'Álgebra'),
('Carl J.', 'Cr 2 #22-22', 322222222, 'Geometría'),
('Martha R.', 'Cr 3 #33-33', 333333333, 'Filosofía'),
('Sabrina C.', 'Cr 4 #44-44', 344444444, 'Ciencias Sociales');

INSERT INTO grupo (nombre, turno, salon, id_profesor) VALUES
('Grupo 1A', 'Tarde', 01, 2),
('Grupo 2A', 'Tarde', 02, 1),
('Grupo 1B', 'Mañana', 03, 5),
('Grupo 2B', 'Mañana', 04, 4),
('Grupo 3B', 'Tarde', 05, 3);

INSERT INTO curso (nombre) VALUES
('Inglés'),
('Álgebra'),
('Geometría'),
('Filosofía'),
('Ciencias Sociales');

INSERT INTO imparticion (id_grupo, id_curso, horario, id_profesor) VALUES
(1, 2, 'Lunes 12-5pm', 2),
(2, 1, 'Martes 1-6pm', 1),
(3, 5, 'Miércoles 8-10am', 5),
(4, 4, 'Jueves 7-10am', 4),
(5, 3, 'Viernes 1-6pm', 3);

INSERT INTO alumnos (nombrecompleto, direccion, telefono, id_grupo) VALUES
('Pablo Mozuca', 'Cr 5 #55-55', 355555555, 1),
('Pablo Daza', 'Cr 6 #66-66', 366666666, 3),
('Johan Castro', 'Cr7 #77-77', 377777777, 3),
('Santiago Beltran', 'Cr 8 #88-88', 388888888, 2),
('Johan Daza', 'Cr 9 #99-99', 399999999, 4);

INSERT INTO matricula (fecha_matricula, id_grupo, id_alumno) VALUES
('2025-01-10', 1, 1),
('2025-01-11', 3, 2),
('2025-01-11', 3, 3),
('2025-01-12', 2, 4),
('2025-01-15', 4, 5);

INSERT INTO nota (valornota, id_alumno, id_curso) VALUES
(4.7, 1, 2),
(3.2, 2, 5),
(2.5, 3, 5),
(5.0, 4, 1),
(4.3, 5, 4);