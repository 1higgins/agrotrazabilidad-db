CREATE DATABASE IF NOT EXISTS agrotrazabilidad_db 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE agrotrazabilidad_db;

DROP TABLE IF EXISTS CONTENEDOR_PALLET;
DROP TABLE IF EXISTS PALLET_TICKET;
DROP TABLE IF EXISTS CONTENEDOR;
DROP TABLE IF EXISTS PALLET;
DROP TABLE IF EXISTS LIQUIDACION;
DROP TABLE IF EXISTS ESTADO_LIQUIDACION;
DROP TABLE IF EXISTS CONTROL_CALIDAD;
DROP TABLE IF EXISTS TICKET_ACOPIO;
DROP TABLE IF EXISTS ACTA_INSPECCION;
DROP TABLE IF EXISTS TRATAMIENTO;
DROP TABLE IF EXISTS PRODUCTO_QUIMICO;
DROP TABLE IF EXISTS INSPECTOR;
DROP TABLE IF EXISTS CERTIFICACION_PARCELA;
DROP TABLE IF EXISTS CERTIFICACION;
DROP TABLE IF EXISTS LOTE;
DROP TABLE IF EXISTS PARCELA;
DROP TABLE IF EXISTS PRODUCTOR;
DROP TABLE IF EXISTS TIPO_ASOCIACION;

-- ---------------------------------------------------------------------
-- MODULO A: GESTION DE PRODUCTORES, PARCELAS Y CERTIFICACIONES
-- ---------------------------------------------------------------------

CREATE TABLE TIPO_ASOCIACION (
    asociacionID INT AUTO_INCREMENT PRIMARY KEY,
    nombreAsociacion VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE PRODUCTOR (
    dniRuc VARCHAR(20) NOT NULL PRIMARY KEY,
    nombreRazonSocial VARCHAR(150) NOT NULL,
    cuentaBancaria VARCHAR(50) NOT NULL,
    numeroTelefono VARCHAR(20) NOT NULL,
    tipoAsociacionID INT NOT NULL,

    CONSTRAINT fk_tipo_asociacion
        FOREIGN KEY (tipoAsociacionID)
        REFERENCES TIPO_ASOCIACION(asociacionID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE PARCELA (
    parcelaID INT AUTO_INCREMENT PRIMARY KEY,
    codigoCatastralSunarp VARCHAR(50) UNIQUE NOT NULL,
    dniRucProductor VARCHAR(20) NOT NULL,
    ubigeo VARCHAR(100) NOT NULL,
    areaTotalHectareas DECIMAL(10,2) NOT NULL
        CHECK (areaTotalHectareas > 0),
    coordenadaPoligonal TEXT NOT NULL,

    CONSTRAINT fkParcelaProductor
        FOREIGN KEY (dniRucProductor)
        REFERENCES PRODUCTOR(dniRuc)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE LOTE (
    codigoLote INT AUTO_INCREMENT PRIMARY KEY,
    parcelaID INT NOT NULL,
    nombreCultivo VARCHAR(50) NOT NULL,
    fechaSiembra DATE NOT NULL,
    rendimientoEstimado DECIMAL(10,2) NOT NULL
        CHECK (rendimientoEstimado >= 0),
    edadPlantas INT NOT NULL CHECK (edadPlantas >= 0),

    CONSTRAINT fk_parcela_id
        FOREIGN KEY (parcelaID)
        REFERENCES PARCELA(parcelaID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE CERTIFICACION (
    certificacionID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombreCertificacion VARCHAR(100) NOT NULL UNIQUE,
    entidadEmisora VARCHAR(100) NOT NULL
);

CREATE TABLE CERTIFICACION_PARCELA (
    parcelaCertificacionID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    certificacionID INT NOT NULL,
    parcelaID INT NOT NULL,
    fechaEmision DATE NOT NULL,
    fechaVencimiento DATE NOT NULL,
    estadoVigencia VARCHAR(30) NOT NULL DEFAULT 'VIGENTE',

    CONSTRAINT fkCertificacionID
        FOREIGN KEY (certificacionID)
        REFERENCES CERTIFICACION(certificacionID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fkCertificacionParcela
        FOREIGN KEY (parcelaID)
        REFERENCES PARCELA(parcelaID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ---------------------------------------------------------------------
-- MODULO B: INSPECCION Y CONTROL FITOSANITARIO
-- ---------------------------------------------------------------------

CREATE TABLE INSPECTOR (
    inspectorID VARCHAR(15) NOT NULL PRIMARY KEY,
    nombresCompletos VARCHAR(150) NOT NULL,
    licenciaAutorizacion VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE PRODUCTO_QUIMICO (
    productoID INT AUTO_INCREMENT PRIMARY KEY,
    nombreComercial VARCHAR(100) NOT NULL,
    periodoCarenciaDias INT NOT NULL CHECK (periodoCarenciaDias >= 0)
);

CREATE TABLE TRATAMIENTO (
    tratamientoID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    productoID INT NOT NULL,
    codigoLote INT NOT NULL,
    fechaAplicacion DATE NOT NULL,
    fechaLiberacionCosecha DATE NOT NULL,
    periodoCarenciaDias INT NOT NULL 
        CHECK (periodoCarenciaDias >= 0),
    
    CONSTRAINT fkTratamientoProducto
        FOREIGN KEY (productoID)
        REFERENCES PRODUCTO_QUIMICO(productoID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fkTratamientoLote
        FOREIGN KEY (codigoLote)
        REFERENCES LOTE(codigoLote)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE ACTA_INSPECCION (
    codigoActa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    inspectorID VARCHAR(15) NOT NULL,
    codigoLote INT NOT NULL,
    fechaInspeccion DATE NOT NULL,
    fechaCosechaPlanificada DATE NOT NULL,
    estadoHabilitadoCosecha BOOLEAN NOT NULL,
    observaciones TEXT,

    CONSTRAINT fkActaInspector
        FOREIGN KEY (inspectorID)
        REFERENCES INSPECTOR(inspectorID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    
    CONSTRAINT fkActaLote
        FOREIGN KEY (codigoLote)
        REFERENCES LOTE(codigoLote)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ---------------------------------------------------------------------
-- MODULO C: PROCESO DE ACOPIO, PESAJE Y CONTROL DE DESCARTE
-- ---------------------------------------------------------------------

CREATE TABLE TICKET_ACOPIO (
    codigoTicket INT AUTO_INCREMENT PRIMARY KEY,
    codigoLote INT NOT NULL,
    transportistaID VARCHAR(20) NOT NULL,
    horaRecepcion TIME NOT NULL,
    fechaHoraRecepcion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cantidadJabas INT UNSIGNED NOT NULL,
    pesoBruto DECIMAL(10,2) NOT NULL CHECK (pesoBruto > 0),
    tara DECIMAL(10,2) NOT NULL CHECK (tara >= 0),

    CONSTRAINT fk_ticket_lote
        FOREIGN KEY (codigoLote)
        REFERENCES LOTE(codigoLote)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE CONTROL_CALIDAD (
    codigoCalidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ticketAcopioID INT NOT NULL UNIQUE,
    porcentajePlaga DECIMAL(5,2) NOT NULL DEFAULT 0.00
        CHECK (porcentajePlaga BETWEEN 0 AND 100),
    porcentajeDeformidad DECIMAL(5,2) NOT NULL DEFAULT 0.00
        CHECK (porcentajeDeformidad BETWEEN 0 AND 100),
    porcentajeMadurez DECIMAL(5,2) NOT NULL DEFAULT 0.00
        CHECK (porcentajeMadurez BETWEEN 0 AND 100),
    calibrePromedio VARCHAR(50) NOT NULL,

    CONSTRAINT fkControlAcopio
        FOREIGN KEY (ticketAcopioID)
        REFERENCES TICKET_ACOPIO(codigoTicket)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE ESTADO_LIQUIDACION (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE LIQUIDACION (
    codigoLiquidacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ticketAcopioID INT NOT NULL UNIQUE,
    estadoLiquidacionID INT NOT NULL,
    pesoNetoPagable DECIMAL(10,2) NOT NULL 
        CHECK (pesoNetoPagable > 0),
    tipoMercado VARCHAR(30) NOT NULL 
        CHECK (tipoMercado IN ('Exportacion', 'Mercado Nacional')),
    montoTotalPagar DECIMAL (12,2) UNSIGNED NOT NULL,
    tarifaPorKilo DECIMAL(10, 2) NOT NULL 
        CHECK (tarifaPorKilo > 0),

    CONSTRAINT fkLiquidacionEstado
        FOREIGN KEY (estadoLiquidacionID)
        REFERENCES ESTADO_LIQUIDACION(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
      
    CONSTRAINT fkLiquidacionAcopio
        FOREIGN KEY (ticketAcopioID)
        REFERENCES TICKET_ACOPIO(codigoTicket)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ---------------------------------------------------------------------
-- MODULO D: PROCESAMIENTO EMPAQUE Y EMBARQUE
-- ---------------------------------------------------------------------

CREATE TABLE PALLET (
    palletID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigoTrazabilidad VARCHAR(100) NOT NULL UNIQUE,
    fechaEmpaque DATETIME NOT NULL,
    pesoTotalKg DECIMAL(10,2) NOT NULL
        CHECK (pesoTotalKg >= 0)
);

CREATE TABLE CONTENEDOR (
    contenedorID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    naviera VARCHAR(50) NOT NULL,
    puertoSalida VARCHAR(50) NOT NULL,
    puertoDestino VARCHAR(50) NOT NULL,
    fechaEmbarque DATE NOT NULL,
    temperaturaReefer DECIMAL(5,2) NOT NULL
);

CREATE TABLE PALLET_TICKET (
    palletTicketID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    palletID INT NOT NULL,
    ticketAcopioID INT NOT NULL,
    cantidadFrutaAsignada DECIMAL(10,2) NOT NULL
        CHECK (cantidadFrutaAsignada > 0),
    
    CONSTRAINT fkPallet
        FOREIGN KEY (palletID)
        REFERENCES PALLET(palletID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fkTicket
        FOREIGN KEY (ticketAcopioID)
        REFERENCES TICKET_ACOPIO(codigoTicket)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE CONTENEDOR_PALLET (
    contenedorPalletID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contenedorID INT NOT NULL,
    palletID INT NOT NULL,
    posicionEstiba VARCHAR(50),
    fechaConsolidacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fkContenedor
        FOREIGN KEY (contenedorID)
        REFERENCES CONTENEDOR(contenedorID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fkPalletContenedor
        FOREIGN KEY (palletID)
        REFERENCES PALLET(palletID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);