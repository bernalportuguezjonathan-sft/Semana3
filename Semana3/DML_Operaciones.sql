USE escuela;

SELECT * FROM profesor;
SELECT * FROM grupo;
SELECT * FROM curso;
SELECT * FROM imparticion;
SELECT * FROM alumnos;
SELECT * FROM matricula;
SELECT * FROM nota;

UPDATE alumnos SET direccion = 'Cr 50 #50-50' WHERE id = 1;
UPDATE profesor SET telefono = 312345678 WHERE id = 2;
UPDATE nota SET valornota = 2.1 WHERE id = 1;

DELETE FROM alumnos WHERE id = 5;
DELETE FROM matricula WHERE id = 2;
DELETE FROM nota WHERE id = 3;

USE estacion_policia;

SELECT * FROM estaciones;
SELECT * FROM policias;
SELECT * FROM autos;
SELECT * FROM auto_policia;
SELECT * FROM criminales;
SELECT * FROM cargos;
SELECT * FROM reportes;
SELECT * FROM delito_criminal;
SELECT * FROM arrestos;

UPDATE autos SET estado = 'En reparación' WHERE id = 2;
UPDATE policias SET telefono = 312345678 WHERE id = 1;
UPDATE reportes SET estado = 'Cerrado' WHERE id = 3;

DELETE FROM criminales WHERE id = 5;
DELETE FROM autos WHERE id = 4;
DELETE FROM reportes WHERE id = 2;
