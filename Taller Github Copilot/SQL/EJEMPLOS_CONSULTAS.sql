-- ============================================================================
-- EJEMPLOS DE CONSULTAS ÚTILES
-- Para usar después de crear todas las tablas en OTENAS1
-- Autor: Lazaro Tenas
-- Fecha: 2026-06-15
-- ============================================================================

-- ============================================================================
-- 1. CONSULTAS BÁSICAS DE VERIFICACIÓN
-- ============================================================================

-- Verificar que todas las tablas fueron creadas
SELECT TABNAME, COLCOUNT, CARD 
FROM SYSCAT.TABLES 
WHERE TABSCHEMA = 'OTENAS1' 
ORDER BY TABNAME;

-- Ver la estructura de una tabla específica
DSPFFD FILE(OTENAS1/CUMST);

-- Ver todos los índices creados
SELECT INDNAME, TABNAME, COLNAMES
FROM SYSCAT.INDEXES
WHERE TABSCHEMA = 'OTENAS1'
ORDER BY TABNAME, INDNAME;

-- Ver todas las foreign keys
SELECT CONSTNAME, TABNAME, REFTABNAME
FROM SYSCAT.REFERENCES
WHERE TABSCHEMA = 'OTENAS1'
ORDER BY TABNAME;

-- ============================================================================
-- 2. CONSULTAS DE POBLACIÓN DE DATOS (EJEMPLOS)
-- ============================================================================

-- Insertar cliente de prueba
INSERT INTO OTENAS1.CUMST (
    ID_Cliente, Numero_Cliente, Nombre_Cliente, Tipo_Cliente,
    Identificacion, Tipo_Identificacion, Email, Telefono,
    Direccion, Ciudad, Pais, Codigo_Postal
) VALUES (
    'CLI001', '001001', 'Juan García López', 'P',
    '1234567890', 'CC', 'juan@email.com', '5551234567',
    'Calle 123 #456', 'Bogotá', 'Colombia', '110111'
);

-- Insertar cuenta para cliente
INSERT INTO OTENAS1.ACMST (
    ID_Cuenta, Numero_Cuenta, ID_Cliente, Codigo_Banco,
    Codigo_Sucursal, Codigo_Moneda, Tipo_Cuenta
) VALUES (
    'CTA001', '080001234567890123', 'CLI001', 'BANCO001',
    'SUC001', 'COP', 'Corriente'
);

-- Insertar transacción
INSERT INTO OTENAS1.TRANS (
    ID_Transaccion, Numero_Cuenta, Numero_Cuenta, Codigo_Banco,
    Codigo_Sucursal, Codigo_Moneda, Fecha_Operacion,
    Tipo_Movimiento, Debito_Credito, Monto
) VALUES (
    1, 'RR000001', '080001234567890123', 'BANCO001',
    'SUC001', 'COP', CURRENT_DATE,
    'Depósito', 'C', 500000.00
);

-- Insertar usuario de prueba
INSERT INTO OTENAS1.USERS (
    ID_Usuario, Codigo_Usuario, Nombre_Usuario, Menu,
    Opcion, Permiso, Tipo_Usuario, Nivel_Acceso
) VALUES (
    'USR001', 'JGARCIA', 'Juan García López', 'Clientes',
    'Consultar', 'S', 'Operador', 1
);

-- ============================================================================
-- 3. CONSULTAS DE ANÁLISIS
-- ============================================================================

-- Cantidad de clientes activos
SELECT COUNT(*) as Total_Clientes
FROM OTENAS1.CUMST
WHERE Estado_Registro = 'A' AND Estado_Cliente = 'A';

-- Clientes y sus cuentas
SELECT 
    C.Nombre_Cliente,
    A.Numero_Cuenta,
    A.Saldo_Actual,
    A.Estado_Cuenta
FROM OTENAS1.CUMST C
LEFT JOIN OTENAS1.ACMST A ON C.ID_Cliente = A.ID_Cliente
WHERE C.Estado_Registro = 'A'
ORDER BY C.Nombre_Cliente;

-- Resumen de saldos por sucursal
SELECT 
    Codigo_Sucursal,
    Codigo_Moneda,
    COUNT(*) as Total_Cuentas,
    SUM(Saldo_Actual) as Total_Saldos,
    AVG(Saldo_Actual) as Saldo_Promedio
FROM OTENAS1.ACMST
WHERE Estado_Registro = 'A'
GROUP BY Codigo_Sucursal, Codigo_Moneda
ORDER BY Codigo_Sucursal;

-- Transacciones por día
SELECT 
    Fecha_Operacion,
    COUNT(*) as Total_Transacciones,
    SUM(CASE WHEN Debito_Credito = 'D' THEN Monto ELSE 0 END) as Total_Débitos,
    SUM(CASE WHEN Debito_Credito = 'C' THEN Monto ELSE 0 END) as Total_Créditos
FROM OTENAS1.TRANS
WHERE Estado_Registro = 'A'
GROUP BY Fecha_Operacion
ORDER BY Fecha_Operacion DESC;

-- Análisis de préstamos vencidos
SELECT 
    D.Numero_Prestamo,
    C.Nombre_Cliente,
    D.Monto_Aprobado,
    D.Saldo_Deudor,
    DATEDIFF(DAY, D.Fecha_Vencimiento, CURRENT_DATE) as Dias_Vencimiento
FROM OTENAS1.DEALS D
JOIN OTENAS1.CUMST C ON D.ID_Cliente = C.ID_Cliente
WHERE D.Estado_Operacion = 'V'
AND DATEDIFF(DAY, D.Fecha_Vencimiento, CURRENT_DATE) > 0
ORDER BY Dias_Vencimiento DESC;

-- Cuotas atrasadas
SELECT 
    DP.ID_Prestamo,
    D.Numero_Prestamo,
    DP.Numero_Cuota,
    DP.Fecha_Pago,
    DP.Dias_Atraso,
    DP.Monto_Mora,
    DP.Monto_Cuota
FROM OTENAS1.DLPMT DP
JOIN OTENAS1.DEALS D ON DP.ID_Prestamo = D.ID_Prestamo
WHERE DP.Estado_Cuota = 'A'
AND DP.Dias_Atraso > 0
ORDER BY DP.Dias_Atraso DESC;

-- ============================================================================
-- 4. REPORTES
-- ============================================================================

-- Reporte: Clientes y cuentas resumen
SELECT 
    C.ID_Cliente,
    C.Numero_Cliente,
    C.Nombre_Cliente,
    C.Tipo_Cliente,
    C.Identificacion,
    COUNT(DISTINCT A.ID_Cuenta) as Total_Cuentas,
    SUM(A.Saldo_Actual) as Saldo_Total,
    MAX(C.Updated_At) as Ultima_Actualizacion
FROM OTENAS1.CUMST C
LEFT JOIN OTENAS1.ACMST A ON C.ID_Cliente = A.ID_Cliente
WHERE C.Estado_Registro = 'A'
GROUP BY 
    C.ID_Cliente, C.Numero_Cliente, C.Nombre_Cliente,
    C.Tipo_Cliente, C.Identificacion, C.Updated_At
ORDER BY SUM(A.Saldo_Actual) DESC;

-- Reporte: Cartera de crédito
SELECT 
    D.Tipo_Operacion,
    D.Codigo_Moneda,
    COUNT(*) as Total_Operaciones,
    SUM(D.Monto_Aprobado) as Monto_Total_Aprobado,
    SUM(D.Monto_Desembolsado) as Monto_Total_Desembolsado,
    SUM(D.Saldo_Deudor) as Cartera_Vigente,
    AVG(D.Tasa_Interes) as Tasa_Promedio
FROM OTENAS1.DEALS D
WHERE D.Estado_Registro = 'A'
GROUP BY D.Tipo_Operacion, D.Codigo_Moneda
ORDER BY SUM(D.Saldo_Deudor) DESC;

-- Reporte: Movimiento de cuentas
SELECT 
    TRUNC(T.Fecha_Operacion, 'MONTH') as Periodo,
    T.Codigo_Moneda,
    T.Tipo_Movimiento,
    COUNT(*) as Total_Movimientos,
    SUM(T.Monto) as Monto_Total
FROM OTENAS1.TRANS T
WHERE T.Estado_Registro = 'A'
AND T.Fecha_Operacion >= CURRENT_DATE - 90 DAYS
GROUP BY 
    TRUNC(T.Fecha_Operacion, 'MONTH'),
    T.Codigo_Moneda,
    T.Tipo_Movimiento
ORDER BY Periodo DESC, Codigo_Moneda;

-- ============================================================================
-- 5. MANTENIMIENTO Y OPTIMIZACIÓN
-- ============================================================================

-- Actualizar estadísticas de tablas (para query optimizer)
ANALYZE TABLE OTENAS1.CUMST;
ANALYZE TABLE OTENAS1.ACMST;
ANALYZE TABLE OTENAS1.TRANS;
ANALYZE TABLE OTENAS1.DEALS;

-- Reorganizar una tabla (después de muchas inserciones/eliminaciones)
REORG TABLE OTENAS1.TRANS;

-- Ver información de uso de índices
SELECT 
    INDNAME,
    TABNAME,
    UNIQUERULE,
    DATASPACEUSED,
    STATS_CREATION_TIME
FROM SYSCAT.INDEXES
WHERE TABSCHEMA = 'OTENAS1'
ORDER BY TABNAME;

-- Verificar integridad de datos
SELECT 
    TABNAME,
    COUNT(*) as Total_Registros,
    MIN(Created_At) as Fecha_Creacion_Mas_Antigua,
    MAX(Updated_At) as Ultima_Actualizacion
FROM OTENAS1.CUMST
WHERE Estado_Registro = 'A'
GROUP BY TABNAME;

-- ============================================================================
-- 6. AUDITORIA Y CONTROL
-- ============================================================================

-- Ver cambios recientes en clientes
SELECT 
    ID_Cliente,
    Nombre_Cliente,
    Usuario_Actualizacion,
    Updated_At,
    Estado_Registro
FROM OTENAS1.CUMST
WHERE DATEDIFF(DAY, Updated_At, CURRENT_TIMESTAMP) <= 7
ORDER BY Updated_At DESC;

-- Registros creados hoy
SELECT 
    'CUMST' as Tabla,
    COUNT(*) as Registros_Nuevos,
    MIN(Created_At) as Primera_Creacion,
    MAX(Created_At) as Ultima_Creacion
FROM OTENAS1.CUMST
WHERE DATEDIFF(DAY, Created_At, CURRENT_DATE) = 0

UNION ALL

SELECT 
    'ACMST',
    COUNT(*),
    MIN(Created_At),
    MAX(Created_At)
FROM OTENAS1.ACMST
WHERE DATEDIFF(DAY, Created_At, CURRENT_DATE) = 0

ORDER BY Tabla;

-- Usuarios con más accesos
SELECT 
    Codigo_Usuario,
    Nombre_Usuario,
    COUNT(*) as Total_Accesos,
    MAX(Ultimo_Acceso) as Ultimo_Acceso
FROM OTENAS1.USERS
WHERE Permiso = 'S' AND Activo = 'S'
GROUP BY Codigo_Usuario, Nombre_Usuario
ORDER BY Total_Accesos DESC;

-- ============================================================================
-- 7. CONSULTAS PARA PROBLEMAS COMUNES
-- ============================================================================

-- Encontrar clientes sin cuentas
SELECT 
    C.ID_Cliente,
    C.Nombre_Cliente,
    C.Identificacion
FROM OTENAS1.CUMST C
LEFT JOIN OTENAS1.ACMST A ON C.ID_Cliente = A.ID_Cliente
WHERE A.ID_Cuenta IS NULL
AND C.Estado_Registro = 'A';

-- Cuentas con saldo negativo (problemas)
SELECT 
    A.Numero_Cuenta,
    C.Nombre_Cliente,
    A.Saldo_Actual,
    A.Saldo_Disponible
FROM OTENAS1.ACMST A
JOIN OTENAS1.CUMST C ON A.ID_Cliente = C.ID_Cliente
WHERE A.Saldo_Actual < 0
ORDER BY A.Saldo_Actual;

-- Transacciones incompletas o rechazadas
SELECT 
    ID_Transaccion,
    Numero_Cuenta,
    Fecha_Operacion,
    Estado_Transaccion,
    Monto,
    Created_At
FROM OTENAS1.TRANS
WHERE Estado_Transaccion IN ('RECHAZADA', 'PENDIENTE')
ORDER BY Fecha_Operacion DESC;

-- Préstamos sin plan de pagos
SELECT 
    D.ID_Prestamo,
    D.Numero_Prestamo,
    C.Nombre_Cliente
FROM OTENAS1.DEALS D
JOIN OTENAS1.CUMST C ON D.ID_Cliente = C.ID_Cliente
LEFT JOIN OTENAS1.DLPMT DP ON D.ID_Prestamo = DP.ID_Prestamo
WHERE DP.ID_Plan_Pago IS NULL
AND D.Estado_Registro = 'A';

-- ============================================================================
-- 8. SCRIPTS DE LIMPIEZA (CUIDADO - Usar solo en desarrollo)
-- ============================================================================

/*
-- Eliminar todos los registros de auditoría de una tabla
DELETE FROM OTENAS1.CUMST 
WHERE Usuario_Creacion = 'SISTEMA'
AND DATEDIFF(DAY, Created_At, CURRENT_DATE) > 90;

-- Resetear secuencias/contadores (si es necesario)
DELETE FROM OTENAS1.ACMST 
WHERE Estado_Registro = 'I'
AND DATEDIFF(DAY, Updated_At, CURRENT_DATE) > 180;

-- Nota: Siempre hacer backup antes de ejecutar delete
*/

-- ============================================================================
-- FIN DE EJEMPLOS DE CONSULTAS
-- ============================================================================

COMMIT;
