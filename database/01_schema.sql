CREATE DATABASE IF NOT EXISTS agrotrazabilidad_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE agrotrazabilidad_db;


CREATE TABLE TIPO_ASOCIACION (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE PRODUCTOR (
    dni CHAR(8) NOT NULL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    cuenta_bancaria VARCHAR(30) NOT NULL,
    num_telefonico VARCHAR(9) NOT NULL,
    tipo_asociacion_id INT NOT NULL,

    CONSTRAINT fk_tipo_asociacion
        FOREIGN KEY (tipo_asociacion_id)
        REFERENCES TIPO_ASOCIACION(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE PARCELA (
    cod_catastral INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ubicacion VARCHAR(100) NOT NULL,
    area_total DECIMAL(10,2) NOT NULL
        CHECK (area_total > 0)

);



