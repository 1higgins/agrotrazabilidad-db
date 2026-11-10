USE agrotrazabilidad_db;
SET NAMES utf8mb4;


-- AUDITORIA DE CERTIFICACIONES VENCIDAS O QUE ESTAN POR VENCER EN LOS PROXIMOS 30 DIAS.

SELECT
    prod.dniRuc,
    prod.nombreRazonSocial AS Productor,
    p.codigoCatastralSunarp,
    c.nombreCertificacion,
    cp.fechaEmision,
    cp.fechaVencimiento,

    CASE
        WHEN cp.fechaVencimiento < CURDATE() THEN 'VENCIDA'
        WHEN cp.fechaVencimiento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY) THEN 'PROXIMO A VENCER'
        ELSE 'VIGENTE'
    END AS estadoAlertaCertificacion

FROM CERTIFICACION_PARCELA cp
JOIN PARCELA p ON cp.parcelaID = p.parcelaID
JOIN PRODUCTOR prod ON p.dniRucProductor = prod.dniRuc
JOIN CERTIFICACION c ON cp.certificacionID = c.certificacionID
ORDER BY cp.fechaEmision ASC;

-- VALIDACION BLOQUEANTE DE COSECHA POR PERIODO CARENCIA

SELECT
    ai.codigoActa,
    l.codigoLote,
    l.nombreCultivo,
    p.codigoCatastralSunarp,
    pq.nombreComercial AS productoQuimico,
    t.fechaAplicacion,
    t.fechaLiberacionCosecha,
    ai.fechaCosechaPlanificada,

    CASE
        WHEN ai.fechaCosechaPlanificada < t.fechaLiberacionCosecha THEN 'BLOQUEADO: CARENCIA ACTIVA'
        ELSE 'HABILITADO'
    END AS estadoValidacion

FROM ACTA_INSPECCION ai
JOIN LOTE l ON ai.codigoActa = l.codigoLote
JOIN PARCELA p ON l.parcelaID = p.parcelaID
JOIN TRATAMIENTO t ON l.codigoLote = t.codigoLote
JOIN PRODUCTO_QUIMICO pq ON t.productoID = pq.productoID

WHERE ai.fechaCosechaPlanificada < t.fechaLiberacionCosecha;


SELECT 
    c.contenedorID,
    c.naviera,
    c.puertoSalida,
    c.puertoDestino,
    c.temperaturaReefer,
    c.fechaEmbarque,
    COUNT(DISTINCT cp.palletID) AS totalPallets,
    COUNT(DISTINCT p.parcelaID) AS totalParcelas,
    COUNT(DISTINCT ta.nombreAsociacion) AS TotalCooperativas

FROM CONTENEDOR c
JOIN CONTENEDOR_PALLET cp ON c.contenedorID = cp.contenedorID
JOIN PALLET_TICKET pt ON cp.palletID = pt.palletID
JOIN TICKET_ACOPIO ta_acopio ON pt.ticketAcopioID = ta_acopio.codigoTicket
JOIN LOTE l ON ta_acopio.codigoLote = l.codigoLote
JOIN PARCELA p ON l.parcelaID = p.parcelaID
JOIN PRODUCTOR prod ON p.dniRucProductor = prod.dniRuc
JOIN TIPO_ASOCIACION ta ON prod.tipoAsociacionID = ta.asociacionID
WHERE YEARWEEK(c.fechaEmbarque, 1) = YEARWEEK(CURDATE(), 1)
GROUP BY 
    c.contenedorID, 
    c.naviera, 
    c.puertoSalida, 
    c.puertoDestino, 
    c.temperaturaReefer, 
    c.fechaEmbarque
ORDER BY c.fechaEmbarque DESC;

SELECT 
    l.nombreCultivo,
    p.ubigeo,
    p.codigoCatastralSunarp,
    p.areaTotalHectareas,
    (l.rendimientoEstimado * 1000) AS Rendimiento_Estimado_Kg,
    COALESCE(SUM(t.pesoBruto - t.tara), 0.00) AS Volumen_Real_Acopiado_Kg,
    (COALESCE(SUM(t.pesoBruto - t.tara), 0.00) - (l.rendimientoEstimado * 1000)) AS Desviacion_Kg
FROM LOTE l
JOIN PARCELA p ON l.parcelaID = p.parcelaID
LEFT JOIN TICKET_ACOPIO t ON l.codigoLote = t.codigoLote
GROUP BY 
    l.codigoLote,
    l.nombreCultivo,
    p.ubigeo,
    p.codigoCatastralSunarp,
    p.areaTotalHectareas,
    l.rendimientoEstimado
ORDER BY l.nombreCultivo, Desviacion_Kg DESC;

SELECT 
    DATE_FORMAT(t.fechaHoraRecepcion, '%Y-%m') AS Anio_Mes,
    prod.dniRuc,
    prod.nombreRazonSocial AS Productor,
    l.nombreCultivo,
    AVG(cc.porcentajePlaga) AS Promedio_Plaga_Pct,
    AVG(cc.porcentajeDeformidad) AS Promedio_Deformidad_Pct,
    AVG(cc.porcentajeMadurez) AS Promedio_Madurez_Pct,
    AVG(cc.porcentajePlaga + cc.porcentajeDeformidad + cc.porcentajeMadurez) AS Promedio_Total_Descarte_Pct
FROM CONTROL_CALIDAD cc
JOIN TICKET_ACOPIO t ON cc.ticketAcopioID = t.codigoTicket
JOIN LOTE l ON t.codigoLote = l.codigoLote
JOIN PARCELA p ON l.parcelaID = p.parcelaID
JOIN PRODUCTOR prod ON p.dniRucProductor = prod.dniRuc
GROUP BY 
    Anio_Mes,
    prod.dniRuc,
    prod.nombreRazonSocial,
    l.nombreCultivo
ORDER BY Promedio_Total_Descarte_Pct DESC;

SELECT 
    ta.nombreAsociacion AS Tipo_Asociacion,
    liq.tipoMercado,
    COUNT(DISTINCT prod.dniRuc) AS Total_Productores,
    COUNT(DISTINCT p.parcelaID) AS Total_Parcelas,
    SUM(liq.pesoNetoPagable) AS Volumen_Total_Neto_Kg,
    SUM(liq.montoTotalPagar) AS Monto_Total_Liquidado_Soles
FROM LIQUIDACION liq
JOIN TICKET_ACOPIO t ON liq.ticketAcopioID = t.codigoTicket
JOIN LOTE l ON t.codigoLote = l.codigoLote
JOIN PARCELA p ON l.parcelaID = p.parcelaID
JOIN PRODUCTOR prod ON p.dniRucProductor = prod.dniRuc
JOIN TIPO_ASOCIACION ta ON prod.tipoAsociacionID = ta.asociacionID
GROUP BY 
    ta.nombreAsociacion,
    liq.tipoMercado
ORDER BY Volumen_Total_Neto_Kg DESC;

SELECT 
    i.inspectorID,
    i.nombresCompletos AS Inspector,
    i.licenciaAutorizacion AS Licencia_SENASA,
    COUNT(ai.codigoActa) AS Total_Inspecciones_Realizadas,
    SUM(CASE WHEN ai.estadoHabilitadoCosecha = 1 THEN 1 ELSE 0 END) AS Lotes_Aprobados_Habilitados,
    SUM(CASE WHEN ai.estadoHabilitadoCosecha = 0 THEN 1 ELSE 0 END) AS Lotes_Rechazados
FROM INSPECTOR i
LEFT JOIN ACTA_INSPECCION ai ON i.inspectorID = ai.inspectorID
GROUP BY 
    i.inspectorID,
    i.nombresCompletos,
    i.licenciaAutorizacion
ORDER BY Total_Inspecciones_Realizadas DESC;
