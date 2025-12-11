CREATE DATABASE escuela;
USE escuela;

CREATE TABLE profesor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombrecompleto VARCHAR(200),
    direccion VARCHAR(255),
    telefono INT,
    asignatura VARCHAR(100)
);

CREATE TABLE grupo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    turno VARCHAR(20),
    salon INT,
    id_profesor INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id)
);

CREATE TABLE curso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

CREATE TABLE imparticion (
    id_grupo INT NOT NULL,
    id_curso INT NOT NULL,
    horario VARCHAR(100),
    id_profesor INT NOT NULL,
    PRIMARY KEY (id_grupo, id_curso),
    FOREIGN KEY (id_grupo) REFERENCES grupo(id),
    FOREIGN KEY (id_curso) REFERENCES curso(id),
    FOREIGN KEY (id_profesor) REFERENCES profesor(id)
);

CREATE TABLE alumnos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombrecompleto VARCHAR(200),
    direccion VARCHAR(255),
    telefono INT,
    id_grupo INT NOT NULL,
    FOREIGN KEY (id_grupo) REFERENCES grupo(id)
);

CREATE TABLE matricula (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_matricula DATE,
    id_grupo INT NOT NULL,
    id_alumno INT NOT NULL,
    FOREIGN KEY (id_grupo) REFERENCES grupo(id),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id)
);

CREATE TABLE nota (
    id INT PRIMARY KEY AUTO_INCREMENT,
    valornota FLOAT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_alumno INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id),
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);


CREATE DATABASE estacion_policia;
USE estacion_policia;

CREATE TABLE estaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono INT
);

CREATE TABLE policias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombrecompleto VARCHAR(200),
    fechacontrato DATE,
    telefono INT,
    email VARCHAR(255),
    id_estacion INT NOT NULL,
    FOREIGN KEY (id_estacion) REFERENCES estaciones(id)
);

CREATE TABLE autos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(20),
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    estado VARCHAR(50),
    id_estacion INT NOT NULL,
    FOREIGN KEY (id_estacion) REFERENCES estaciones(id)
);

CREATE TABLE auto_policia (
    id_policia INT NOT NULL,
    id_auto INT NOT NULL,
    fecha_asignacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_desasignacion TIMESTAMP,
    PRIMARY KEY (id_policia, id_auto),
    FOREIGN KEY (id_policia) REFERENCES policias(id),
    FOREIGN KEY (id_auto) REFERENCES autos(id)
);

CREATE TABLE criminales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombrecompleto VARCHAR(200),
    fechanacimiento DATE,
    direccion VARCHAR(255),
    telefono INT
);

CREATE TABLE cargos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion VARCHAR(500),
    gravedad INT
);

CREATE TABLE reportes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_incidente TIMESTAMP NOT NULL,
    lugar_incidente VARCHAR(255) NOT NULL,
    descripcion VARCHAR(1000),
    tipo VARCHAR(50) NOT NULL,
    estado VARCHAR(50),
    id_policia INT NOT NULL,
    FOREIGN KEY (id_policia) REFERENCES policias(id)
);

CREATE TABLE delito_criminal (
    id_criminal INT NOT NULL,
    id_cargo INT NOT NULL,
    id_reporte INT NOT NULL,
    fecha_imputacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sentencia VARCHAR(500),
    estado VARCHAR(50),
    PRIMARY KEY (id_criminal, id_cargo),
    FOREIGN KEY (id_criminal) REFERENCES criminales(id),
    FOREIGN KEY (id_cargo) REFERENCES cargos(id),
    FOREIGN KEY (id_reporte) REFERENCES reportes(id)
);

CREATE TABLE arrestos (
    id_reporte INT NOT NULL,
    id_criminal INT NOT NULL,
    id_policia INT NOT NULL,
    fechahora_arresto TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lugar_arresto VARCHAR(255),
    PRIMARY KEY (id_reporte, id_criminal),
    FOREIGN KEY (id_reporte) REFERENCES reportes(id),
    FOREIGN KEY (id_criminal) REFERENCES criminales(id),
    FOREIGN KEY (id_policia) REFERENCES policias(id)
);