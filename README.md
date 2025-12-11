Del Modelo al Script – Construcción de Bases de Datos Reales en SQL
INTRODUCCIÓN:
en la siguiente actividad por grupos se realizarán 2 Diagramas de entidad-relación, Implementación completa mediante SQL y se cargarán ejemplos con insert para la verificación de las bases de datos y su funcionamiento.

Análisis y construcción de las bases de datos.
1.Elaboración del diagrama entidad-relación (ER) para cada base de datos, reflejando las entidades, relaciones, cardinalidades y reglas de negocio.

Colegio
Tablas creadas: (Las que salen en colegio.png) Descripción: Se eligió un colegio como primera base de datos porque es bastante simple, aunque con la normalización hasta la 3FN, se creo una tabla Intermedia para hacer más fácil la carga de datos, las tablas creadas son en base a los alumnos y estudiantes, con sus cursos notas y matrículas, nada tan complicado, pero lo suficientemente comprensible para practicar. Colegio
<img width="1297" height="867" alt="image" src="https://github.com/user-attachments/assets/fb1e6812-126a-4630-860a-0eadd61c1dfd" />


Estación de policía
Tablas creadas: (Estación de policía.png) Descripción: Para algo más complicado elegimos una estación de policía, la normalizamos hasta la 3FN, y se crearon varias tablas intermedias, por cosas como varios cargos para un solo criminal, y varios criminales para un solo cargo, para así evitar la sobrecarga de datos, cumpliendo con las FN, siendo un buen ejemplo de que mientras más complejo el sistema, más tablas necesita, y más coherencia y menos redundancia. Estación de policía
<img width="1600" height="972" alt="image" src="https://github.com/user-attachments/assets/0a63dbf4-831c-4955-9861-3f948e2fb838" />


Script SQL
2.Implementación completa mediante scripts SQL con sentencias DDL (CREATE, ALTER, DROP) para la creación de tablas, claves primarias y foráneas, restricciones, índices y vistas. Empesamos creando por la terminal las bases de datos para ver revisar el archivo (Sql Bases.sql) Revisamos la creacion de las tablas Estacion de policia Escuela

LMD
3.Desarrollo de scripts DML (INSERT) que permitan validar la integridad y coherencia de la estructura. Estación de policía Escuela Operaciones de validación y coherencia de la estructura (DML_operaciones.sql)
