USE agrotrazabilidad_db;
SET NAMES utf8mb4;

INSERT INTO PRODUCTOR (dniRuc, nombreRazonSocial, cuentaBancaria, numeroTelefono, tipoAsociacionID) VALUES
('40125678',    'Juan Carlos Quispe Huaman',              '191-2345678-0-12', '+51987654321', 1),
('41238765',    'Maria Elena Torres Ccori',               '191-2345679-0-34', '+51986123456', 1),
('20601234567', 'Agroinversiones Santa Rosa S.A.C.',      '194-8801234-0-56', '+51944112233', 3),
('43987654',    'Pedro Antonio Valdivia Rojas',           '002-3345566-0-78', '+51975334455', 2),
('44561230',    'Rosa Marlene Condori Mamani',            '011-0456123-0-90', '+51966778899', 1),
('20512345678', 'Fundo Los Arandanos E.I.R.L.',           '194-5512345-0-21', '+51955221100', 3),
('45678912',    'Luis Fernando Huaman Cardenas',          '191-7788991-0-43', '+51933445566', 2),
('46789123',    'Carmen Rosa Salazar Pinedo',             '011-0789123-0-65', '+51922334411', 1),
('47891234',    'Wilder Tuesta Vasquez',                  '002-4455667-0-87', '+51911223399', 1),
('20556677889', 'Mango Piura Export Fundo San Lucas S.A.C.', '194-6677889-0-09', '+51988776655', 3);

INSERT INTO PARCELA (parcelaID, codigoCatastralSunarp, dniRucProductor, ubigeo, areaTotalHectareas, coordenadaPoligonal) VALUES
(1,  'SUNARP-13-0901-000123', '40125678',    '130901 - Viru, La Libertad - Sector Huancaquito',        8.50, 'POLYGON((-78.7510 -8.4100, -78.7480 -8.4100, -78.7480 -8.4130, -78.7510 -8.4130, -78.7510 -8.4100))'),
(2,  'SUNARP-13-0902-000456', '40125678',    '130902 - Chao, La Libertad - Sector Chao Alto',         12.00, 'POLYGON((-78.6800 -8.5400, -78.6770 -8.5400, -78.6770 -8.5430, -78.6800 -8.5430, -78.6800 -8.5400))'),
(3,  'SUNARP-13-0901-000789', '41238765',    '130901 - Viru, La Libertad - Sector Santa Elena',        5.75, 'POLYGON((-78.7390 -8.4200, -78.7360 -8.4200, -78.7360 -8.4230, -78.7390 -8.4230, -78.7390 -8.4200))'),
(4,  'SUNARP-11-0101-001001', '20601234567', '110101 - Ica, Ica - Sector La Tinguina',                45.00, 'POLYGON((-75.7300 -14.0700, -75.7240 -14.0700, -75.7240 -14.0760, -75.7300 -14.0760, -75.7300 -14.0700))'),
(5,  'SUNARP-20-0601-002002', '43987654',    '200601 - Sullana, Piura - Sector San Lorenzo',          15.30, 'POLYGON((-80.6850 -4.9000, -80.6820 -4.9000, -80.6820 -4.9030, -80.6850 -4.9030, -80.6850 -4.9000))'),
(6,  'SUNARP-20-0601-002345', '44561230',    '200601 - Sullana, Piura - Sector Margarita',             9.80, 'POLYGON((-80.6700 -4.9150, -80.6670 -4.9150, -80.6670 -4.9180, -80.6700 -4.9180, -80.6700 -4.9150))'),
(7,  'SUNARP-13-0901-003003', '20512345678', '130901 - Viru, La Libertad - Sector Chavimochic',       60.00, 'POLYGON((-78.7800 -8.3900, -78.7740 -8.3900, -78.7740 -8.3960, -78.7800 -8.3960, -78.7800 -8.3900))'),
(8,  'SUNARP-13-0902-003456', '45678912',    '130902 - Chao, La Libertad - Sector Chao Bajo',          7.25, 'POLYGON((-78.6650 -8.5550, -78.6620 -8.5550, -78.6620 -8.5580, -78.6650 -8.5580, -78.6650 -8.5550))'),
(9,  'SUNARP-22-0201-004004', '46789123',    '220201 - Rioja, San Martin - Sector Naranjillo',         6.40, 'POLYGON((-77.1700 -6.0500, -77.1670 -6.0500, -77.1670 -6.0530, -77.1700 -6.0530, -77.1700 -6.0500))'),
(10, 'SUNARP-22-0101-004567', '47891234',    '220101 - Moyobamba, San Martin - Sector Jepelacio',      4.90, 'POLYGON((-76.9700 -6.0300, -76.9670 -6.0300, -76.9670 -6.0330, -76.9700 -6.0330, -76.9700 -6.0300))'),
(11, 'SUNARP-20-0601-005005', '20556677889', '200601 - Sullana, Piura - Sector Montenegro',           38.50, 'POLYGON((-80.7000 -4.8900, -80.6940 -4.8900, -80.6940 -4.8960, -80.7000 -4.8960, -80.7000 -4.8900))'),
(12, 'SUNARP-11-0101-005678', '43987654',    '110101 - Ica, Ica - Sector Los Aquijes',                10.10, 'POLYGON((-75.7100 -14.0900, -75.7070 -14.0900, -75.7070 -14.0930, -75.7100 -14.0930, -75.7100 -14.0900))');

INSERT INTO LOTE (codigoLote, parcelaID, nombreCultivo, fechaSiembra, rendimientoEstimado, edadPlantas) VALUES
(1,  1,  'Palta Hass',  '2019-03-15',  38.00,  7),
(2,  1,  'Palta Hass',  '2020-08-10',  22.50,  6),
(3,  2,  'Palta Hass',  '2018-04-20',  55.00,  8),
(4,  3,  'Palta Hass',  '2021-06-01',  15.00,  5),
(5,  4,  'Palta Hass',  '2017-09-12', 160.00,  9),
(6,  4,  'Arandano',    '2022-05-20',  90.00,  4),
(7,  5,  'Mango Kent',  '2016-10-05',  70.00, 10),
(8,  6,  'Mango Kent',  '2018-11-12',  45.00,  8),
(9,  7,  'Arandano',    '2021-03-18', 250.00,  5),
(10, 7,  'Arandano',    '2023-07-01', 120.00,  3),
(11, 8,  'Arandano',    '2022-09-09',  30.00,  4),
(12, 9,  'Cafe',        '2018-02-14',   8.50,  8),
(13, 10, 'Cafe',        '2019-12-01',   6.00,  7),
(14, 11, 'Mango Kent',  '2015-10-20', 140.00, 11),
(15, 12, 'Palta Hass',  '2019-05-11',  40.00,  7),
(16, 2,  'Palta Hass',  '2022-01-25',  12.00,  4);

INSERT INTO CERTIFICACION (certificacionID, nombreCertificacion, entidadEmisora) VALUES
(1, 'GLOBALG.A.P.',                          'FoodPlus GmbH'),
(2, 'Organico USDA NOP',                     'USDA'),
(3, 'SENASA - Sitio de Produccion Registrado', 'SENASA'),
(4, 'Fair Trade',                            'Fairtrade International'),
(5, 'Rainforest Alliance',                   'Rainforest Alliance'),
(6, 'Organico UE (Reg. 2018/848)',           'Control Union Peru');

-- Hoy = 2026-11-05. VIGENTE: vencimiento > hoy. VENCIDA: vencimiento < hoy.
INSERT INTO CERTIFICACION_PARCELA (parcelaCertificacionID, certificacionID, parcelaID, fechaEmision, fechaVencimiento, estadoVigencia) VALUES
(1,  1, 1,  '2025-02-01', '2027-02-01', 'VIGENTE'),
(2,  3, 1,  '2026-01-15', '2027-01-15', 'VIGENTE'),
(3,  1, 2,  '2025-04-10', '2027-04-10', 'VIGENTE'),
(4,  3, 2,  '2026-02-01', '2027-02-01', 'VIGENTE'),
(5,  2, 2,  '2025-06-01', '2027-06-01', 'VIGENTE'),
(6,  1, 3,  '2024-03-01', '2026-03-01', 'VENCIDA'),
(7,  3, 3,  '2025-05-05', '2026-05-05', 'VENCIDA'),
(8,  1, 4,  '2025-08-01', '2027-08-01', 'VIGENTE'),
(9,  3, 4,  '2026-03-01', '2027-03-01', 'VIGENTE'),
(10, 5, 4,  '2025-09-15', '2027-09-15', 'VIGENTE'),
(11, 1, 5,  '2025-07-20', '2027-07-20', 'VIGENTE'),
(12, 3, 5,  '2026-01-10', '2027-01-10', 'VIGENTE'),
(13, 3, 6,  '2025-03-03', '2027-03-03', 'VIGENTE'),
(14, 4, 6,  '2025-03-03', '2027-03-03', 'VIGENTE'),
(15, 1, 7,  '2025-10-01', '2027-10-01', 'VIGENTE'),
(16, 3, 7,  '2026-04-01', '2027-04-01', 'VIGENTE'),
(17, 6, 7,  '2025-10-01', '2027-10-01', 'VIGENTE'),
(18, 1, 8,  '2024-11-01', '2026-11-01', 'VENCIDA'),
(19, 3, 8,  '2026-05-01', '2027-05-01', 'VIGENTE'),
(20, 2, 9,  '2025-01-15', '2028-01-15', 'VIGENTE'),
(21, 4, 9,  '2025-01-15', '2027-01-15', 'VIGENTE'),
(22, 5, 9,  '2025-02-01', '2027-02-01', 'VIGENTE'),
(23, 2, 10, '2025-03-10', '2028-03-10', 'VIGENTE'),
(24, 4, 10, '2025-03-10', '2027-03-10', 'EN RENOVACION'),
(25, 1, 11, '2025-05-12', '2027-05-12', 'VIGENTE'),
(26, 3, 11, '2026-02-20', '2027-02-20', 'VIGENTE'),
(27, 1, 12, '2025-11-20', '2027-11-20', 'VIGENTE'),
(28, 3, 12, '2026-06-01', '2027-06-01', 'VIGENTE');

INSERT INTO INSPECTOR (inspectorID, nombresCompletos, licenciaAutorizacion) VALUES
('30112233', 'Ing. Ricardo Alonso Paredes Linares', 'SENASA-INS-2021-0145'),
('31223344', 'Ing. Lucia Fernanda Mendoza Rios',    'SENASA-INS-2020-0312'),
('32334455', 'Ing. Gustavo Adolfo Chavez Pena',     'SENASA-INS-2022-0467'),
('33445566', 'Ing. Patricia Ysabel Camacho Vera',   'SENASA-INS-2019-0089'),
('34556677', 'Ing. Marco Antonio Yupanqui Sosa',    'SENASA-INS-2023-0721');

-- Periodos de carencia ilustrativos (solo para datos de prueba).
INSERT INTO PRODUCTO_QUIMICO (productoID, nombreComercial, periodoCarenciaDias) VALUES
(1,  'Karate Zeon 5 CS (lambda-cihalotrina)',  14),
(2,  'Score 250 EC (difenoconazol)',           21),
(3,  'Amistar 50 WG (azoxistrobina)',           7),
(4,  'Cobre Nordox 75 WG (oxido cuproso)',      1),
(5,  'Movento 150 OD (spirotetramat)',         30),
(6,  'Decis Forte 10 EC (deltametrina)',       10),
(7,  'Dithane NT (mancozeb)',                  28),
(8,  'Aceite Agricola Sunspray Ultrafine',      0),
(9,  'Confidor 350 SC (imidacloprid)',         21),
(10, 'Switch 62.5 WG (ciprodinil + fludioxonil)', 14);

-- fechaLiberacionCosecha = fechaAplicacion + periodoCarenciaDias
INSERT INTO TRATAMIENTO (tratamientoID, productoID, codigoLote, fechaAplicacion, fechaLiberacionCosecha, periodoCarenciaDias) VALUES
(1,  1,  1,  '2026-08-01', '2026-08-15', 14),
(2,  4,  1,  '2026-08-10', '2026-08-11',  1),
(3,  2,  2,  '2026-07-20', '2026-08-10', 21),
(4,  3,  3,  '2026-08-05', '2026-08-12',  7),
(5,  6,  5,  '2026-07-28', '2026-08-07', 10),
(6,  5,  7,  '2026-07-01', '2026-07-31', 30),
(7,  9,  8,  '2026-08-15', '2026-09-05', 21),
(8,  3,  9,  '2026-09-01', '2026-09-08',  7),
(9,  10, 9,  '2026-09-10', '2026-09-24', 14),
(10, 7,  12, '2026-08-20', '2026-09-17', 28),
(11, 2,  14, '2026-09-20', '2026-10-11', 21),
(12, 1,  15, '2026-10-01', '2026-10-15', 14),
(13, 5,  4,  '2026-10-05', '2026-11-04', 30),
(14, 1,  11, '2026-10-25', '2026-11-08', 14),
(15, 3,  10, '2026-10-30', '2026-11-06',  7),
(16, 4,  6,  '2026-10-20', '2026-10-21',  1),
(17, 2,  13, '2026-09-01', '2026-09-22', 21),
(18, 8,  3,  '2026-08-20', '2026-08-20',  0);

INSERT INTO ACTA_INSPECCION (codigoActa, inspectorID, codigoLote, fechaInspeccion, fechaCosechaPlanificada, estadoHabilitadoCosecha, observaciones) VALUES
(1,  '30112233', 1,  '2026-08-18', '2026-08-20', TRUE,  'Lote conforme. Certificaciones vigentes y carencia cumplida (liberacion 2026-08-15).'),
(2,  '31223344', 2,  '2026-08-12', '2026-08-14', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-08-10).'),
(3,  '31223344', 3,  '2026-08-22', '2026-08-24', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-08-20).'),
(4,  '30112233', 5,  '2026-08-09', '2026-08-11', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-08-07).'),
(5,  '32334455', 7,  '2026-08-02', '2026-08-04', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-07-31).'),
(6,  '32334455', 8,  '2026-09-07', '2026-09-09', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-09-05).'),
(7,  '33445566', 9,  '2026-09-26', '2026-09-28', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-09-24).'),
(8,  '33445566', 12, '2026-09-19', '2026-09-21', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-09-17).'),
(9,  '34556677', 14, '2026-10-13', '2026-10-15', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-10-11).'),
(10, '30112233', 15, '2026-10-17', '2026-10-19', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-10-15).'),
(11, '34556677', 13, '2026-09-24', '2026-09-26', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-09-22).'),
(12, '32334455', 11, '2026-10-30', '2026-11-06', FALSE, 'NO HABILITADO: GLOBALG.A.P. vencida el 2026-11-01 y periodo de carencia vigente hasta 2026-11-08.'),
(13, '33445566', 10, '2026-11-02', '2026-11-03', FALSE, 'NO HABILITADO: fecha de cosecha planificada anterior a la liberacion por carencia (2026-11-06).'),
(14, '30112233', 6,  '2026-10-23', '2026-10-25', TRUE,  'Lote conforme. Carencia cumplida (liberacion 2026-10-21).'),
(15, '34556677', 10, '2026-11-04', '2026-11-07', TRUE,  'Reinspeccion: carencia cumplida al 2026-11-06 y certificaciones vigentes. Habilitado.');

INSERT INTO TICKET_ACOPIO (codigoTicket, codigoLote, transportistaID, horaRecepcion, fechaHoraRecepcion, cantidadJabas, pesoBruto, tara) VALUES
(1,  1,  '20601112223', '07:30:00', '2026-08-20 07:30:00',  400,  7400.00,  600.00),
(2,  2,  '20601112223', '08:15:00', '2026-08-14 08:15:00',  300,  5500.00,  450.00),
(3,  3,  '20602223334', '06:45:00', '2026-08-24 06:45:00',  600, 11000.00,  900.00),
(4,  3,  '20602223334', '14:20:00', '2026-08-24 14:20:00',  500,  9300.00,  750.00),
(5,  5,  '20603334445', '07:00:00', '2026-08-11 07:00:00', 1200, 22000.00, 1800.00),
(6,  5,  '20603334445', '11:30:00', '2026-08-11 11:30:00',  800, 14500.00, 1200.00),
(7,  7,  '20604445556', '05:50:00', '2026-08-04 05:50:00',  700, 13000.00, 1050.00),
(8,  8,  '20604445556', '06:10:00', '2026-09-09 06:10:00',  450,  8200.00,  675.00),
(9,  9,  '20605556667', '04:40:00', '2026-09-28 04:40:00', 1500,  9500.00,  750.00),
(10, 9,  '20605556667', '09:05:00', '2026-09-28 09:05:00', 1800, 11200.00,  900.00),
(11, 12, '20606667778', '08:00:00', '2026-09-21 08:00:00',  250,  3600.00,  125.00),
(12, 14, '20607778889', '05:30:00', '2026-10-15 05:30:00', 1000, 18500.00, 1500.00),
(13, 15, '20601112223', '07:45:00', '2026-10-19 07:45:00',  500,  9100.00,  750.00),
(14, 13, '20606667778', '09:30:00', '2026-09-26 09:30:00',  180,  2650.00,   90.00),
(15, 6,  '20605556667', '05:10:00', '2026-10-25 05:10:00', 1200,  7600.00,  600.00),
(16, 1,  '20601112223', '15:00:00', '2026-08-20 15:00:00',  350,  6500.00,  525.00),
(17, 2,  '20602223334', '07:20:00', '2026-08-14 07:20:00',  250,  4600.00,  375.00);

INSERT INTO CONTROL_CALIDAD (codigoCalidad, ticketAcopioID, porcentajePlaga, porcentajeDeformidad, porcentajeMadurez, calibrePromedio) VALUES
(1,  1,  2.00, 3.00,  1.00, 'Calibre 18'),
(2,  2,  1.50, 2.50,  1.00, 'Calibre 20'),
(3,  3,  3.00, 4.00,  2.00, 'Calibre 22'),
(4,  4,  2.00, 3.50,  1.50, 'Calibre 22'),
(5,  5,  1.00, 2.00,  1.00, 'Calibre 18'),
(6,  6,  5.00, 6.00,  4.00, 'Calibre 24'),
(7,  7,  2.00, 3.00,  5.00, 'Calibre 8'),
(8,  8,  1.00, 2.00,  2.00, 'Calibre 10'),
(9,  9,  0.50, 1.50,  2.00, 'Jumbo 16-18 mm'),
(10, 10, 0.50, 1.00,  1.50, 'Jumbo 16-18 mm'),
(11, 11, 3.00, 2.00, 10.00, 'Zaranda 16'),
(12, 12, 1.50, 2.50,  4.00, 'Calibre 8'),
(13, 13, 2.00, 3.00,  1.00, 'Calibre 20'),
(14, 14, 2.00, 1.00,  7.00, 'Zaranda 15'),
(15, 15, 1.00, 2.00,  2.00, 'Medio 14-16 mm'),
(16, 16, 4.00, 5.00,  3.00, 'Calibre 26'),
(17, 17, 1.00, 2.00,  1.00, 'Calibre 20');

INSERT INTO ESTADO_LIQUIDACION (id, codigo, nombre) VALUES
(1, 'PENDIENTE', 'Pendiente de aprobacion'),
(2, 'APROBADA',  'Aprobada'),
(3, 'PAGADA',    'Pagada al productor'),
(4, 'OBSERVADA', 'Observada por el productor'),
(5, 'ANULADA',   'Anulada');

-- Peso Neto Pagable = (Peso Bruto - Tara) x (1 - (%plaga + %deformidad + %madurez)/100)
-- Monto = pesoNetoPagable x tarifaPorKilo
-- Tarifas (PEN/kg): Palta Exp cal.18-20 = 4.20, cal.22 = 3.80, Mercado Nacional = 2.10
--                   Mango Exp = 2.80 | Arandano Exp = 12.50 | Cafe Exp = 2.60

INSERT INTO LIQUIDACION (codigoLiquidacion, ticketAcopioID, estadoLiquidacionID, pesoNetoPagable, tipoMercado, montoTotalPagar, tarifaPorKilo) VALUES
(1,  1,  3,  6392.00, 'Exportacion',      26846.40,  4.20),
(2,  2,  3,  4797.50, 'Exportacion',      20149.50,  4.20),
(3,  3,  3,  9191.00, 'Exportacion',      34925.80,  3.80),
(4,  4,  2,  7951.50, 'Exportacion',      30215.70,  3.80),
(5,  5,  2, 19392.00, 'Exportacion',      81446.40,  4.20),
(6,  6,  2, 11305.00, 'Mercado Nacional', 23740.50,  2.10),
(7,  7,  3, 10755.00, 'Exportacion',      30114.00,  2.80),
(8,  8,  3,  7148.75, 'Exportacion',      20016.50,  2.80),
(9,  9,  3,  8400.00, 'Exportacion',     105000.00, 12.50),
(10, 10, 2,  9991.00, 'Exportacion',     124887.50, 12.50),
(11, 11, 3,  2953.75, 'Exportacion',       7679.75,  2.60),
(12, 12, 1, 15640.00, 'Exportacion',      43792.00,  2.80),
(13, 13, 1,  7849.00, 'Exportacion',      32965.80,  4.20),
(14, 14, 3,  2304.00, 'Exportacion',       5990.40,  2.60),
(15, 15, 4,  6650.00, 'Exportacion',      83125.00, 12.50),
(16, 16, 2,  5258.00, 'Mercado Nacional', 11041.80,  2.10),
(17, 17, 3,  4056.00, 'Exportacion',      17035.20,  4.20);

INSERT INTO PALLET (palletID, codigoTrazabilidad, fechaEmpaque, pesoTotalKg) VALUES
(1,  'GS1128-PE-2026-000001', '2026-08-12 09:00:00', 1100.00),
(2,  'GS1128-PE-2026-000002', '2026-08-12 10:00:00', 1100.00),
(3,  'GS1128-PE-2026-000003', '2026-08-05 08:00:00', 1000.00),
(4,  'GS1128-PE-2026-000004', '2026-08-21 10:00:00', 1050.00),
(5,  'GS1128-PE-2026-000005', '2026-08-21 11:30:00', 1100.00),
(6,  'GS1128-PE-2026-000006', '2026-08-25 09:00:00', 1100.00),
(7,  'GS1128-PE-2026-000007', '2026-08-25 10:30:00', 1100.00),
(8,  'GS1128-PE-2026-000008', '2026-09-10 08:30:00',  900.00),
(9,  'GS1128-PE-2026-000009', '2026-09-28 14:00:00',  600.00),
(10, 'GS1128-PE-2026-000010', '2026-09-29 08:00:00',  600.00),
(11, 'GS1128-PE-2026-000011', '2026-09-27 10:00:00', 1000.00),
(12, 'GS1128-PE-2026-000012', '2026-10-16 07:00:00', 1000.00),
(13, 'GS1128-PE-2026-000013', '2026-10-20 09:00:00', 1000.00),
(14, 'GS1128-PE-2026-000014', '2026-10-26 08:00:00',  600.00),
(15, 'GS1128-PE-2026-000015', '2026-08-05 09:30:00', 1000.00),
(16, 'GS1128-PE-2026-000016', '2026-09-10 09:30:00',  900.00);

INSERT INTO CONTENEDOR (contenedorID, naviera, puertoSalida, puertoDestino, fechaEmbarque, temperaturaReefer) VALUES
(1, 'CMA CGM',      'Callao',  'Long Beach',  '2026-08-15',  5.50),
(2, 'Hapag-Lloyd',  'Paita',   'Rotterdam',   '2026-08-09', 10.00),
(3, 'Maersk Line',  'Callao',  'Rotterdam',   '2026-08-29',  5.00),
(4, 'MSC',          'Paita',   'Rotterdam',   '2026-09-14', 10.00),
(5, 'COSCO Shipping', 'Chancay', 'Shanghai',  '2026-10-03',  0.50),
(6, 'Hapag-Lloyd',  'Callao',  'Hamburgo',    '2026-10-01', 15.00),
(7, 'MSC',          'Paita',   'Rotterdam',   '2026-11-10', 10.00);

INSERT INTO PALLET_TICKET (palletTicketID, palletID, ticketAcopioID, cantidadFrutaAsignada) VALUES
(1,  1,  5,  1100.00),
(2,  2,  5,  1100.00),
(3,  3,  7,  1000.00),
(4,  4,  1,   600.00),
(5,  4,  2,   450.00),
(6,  5,  1,   500.00),
(7,  5,  17,  600.00),
(8,  6,  3,   800.00),
(9,  6,  4,   300.00),
(10, 7,  3,   700.00),
(11, 7,  4,   400.00),
(12, 8,  8,   900.00),
(13, 9,  9,   300.00),
(14, 9,  10,  300.00),
(15, 10, 9,   300.00),
(16, 10, 10,  300.00),
(17, 11, 11,  500.00),
(18, 11, 14,  500.00),
(19, 12, 12, 1000.00),
(20, 13, 13, 1000.00),
(21, 14, 15,  600.00),
(22, 15, 7,  1000.00),
(23, 16, 8,   900.00);

INSERT INTO CONTENEDOR_PALLET (contenedorPalletID, contenedorID, palletID, posicionEstiba, fechaConsolidacion) VALUES
(1,  1, 1,  'A01', '2026-08-13 15:00:00'),
(2,  1, 2,  'A02', '2026-08-13 15:00:00'),
(3,  2, 3,  'A01', '2026-08-07 10:00:00'),
(4,  2, 15, 'A02', '2026-08-07 10:00:00'),
(5,  3, 4,  'A01', '2026-08-27 08:00:00'),
(6,  3, 5,  'A02', '2026-08-27 08:00:00'),
(7,  3, 6,  'B01', '2026-08-27 09:00:00'),
(8,  3, 7,  'B02', '2026-08-27 09:00:00'),
(9,  4, 8,  'A01', '2026-09-12 10:00:00'),
(10, 4, 16, 'A02', '2026-09-12 10:00:00'),
(11, 5, 9,  'A01', '2026-10-01 09:00:00'),
(12, 5, 10, 'A02', '2026-10-01 09:00:00'),
(13, 6, 11, 'A01', '2026-09-30 11:00:00'),
(14, 7, 12, 'A01', '2026-10-17 12:00:00');
