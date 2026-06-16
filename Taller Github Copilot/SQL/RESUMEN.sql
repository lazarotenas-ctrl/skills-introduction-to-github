-- ============================================================================
-- RESUMEN DE SCRIPTS SQL PARA DB2 FOR i (AS400)
-- GENERADO: 2026-06-15
-- AUTOR: Lazaro Tenas
-- ============================================================================

-- ARCHIVOS GENERADOS Y DESCRIPCIÓN

/*
  1. CNOFT.sql - Archivo Maestro de Tablas de Datos Comunes
     - Almacena información de referencias de datos comunes del sistema
     - Clave: (Codigo_Tabla, Idioma)
     - Campos: 15 columnas + 7 de auditoría
     
  2. CNOFC.sql - Archivo de Referencias del Sistema
     - Referencias cruzadas para búsquedas rápidas
     - Clave: (Codigo_Tabla, Codigo_Registro)
     - Campos: 15 columnas + 7 de auditoría
     
  3. CUMST.sql - Archivo Maestro de Clientes
     - Información principal de todos los clientes del banco
     - Clave: (ID_Cliente)
     - Campos: 21 columnas + 7 de auditoría
     - IMPORTANTE: Base para ACMST, CUMAD, DEALS
     
  4. ACMST.sql - Archivo Maestro de Cuentas de Detalle
     - Información de cuentas de depósito
     - Clave: (ID_Cuenta)
     - Campos: 22 columnas + 7 de auditoría
     - Dependencia: CUMST (FK: ID_Cliente)
     
  5. GLMST.sql - Maestro de Cuentas Contables
     - Catálogo de cuentas contables del banco
     - Clave: (ID_Cuenta_Contable)
     - Campos: 21 columnas + 7 de auditoría
     - Tipos: Activo, Pasivo, Patrimonio, Ingresos, Gastos
     
  6. TRANS.sql - Archivo Histórico de Transacciones
     - Registro de todas las transacciones del sistema
     - Clave: (ID_Transaccion)
     - Campos: 26 columnas + 7 de auditoría
     - Índices: 7 índices para mejora de desempeño
     
  7. DEALS.sql - Maestro de Préstamos, Certificados, Giros, Valores
     - Operaciones crediticias del banco
     - Clave: (ID_Prestamo)
     - Campos: 26 columnas + 7 de auditoría
     - Dependencia: CUMST (FK: ID_Cliente)
     - Relaciones: DLPMT, DLDRF, DLSDE, DLITP
     
  8. BAVEN.sql - Maestro de Proveedores
     - Información de todos los proveedores
     - Clave: (ID_Proveedor)
     - Campos: 25 columnas + 7 de auditoría
     - Información de contacto y términos de pago
     
  9. USERS.sql - Archivo de Autorizaciones por Menús
     - Permisos de acceso de usuarios
     - Clave: (ID_Usuario, Menu, Opcion)
     - Campos: 22 columnas + 7 de auditoría
     - Seguridad: Tracking de intentos fallidos
     
 10. CUMAD.sql - Archivo de Direcciones de Correo y Beneficiarios
     - Múltiples direcciones y datos de beneficiarios por cliente
     - Clave: (ID_Direccion)
     - Campos: 23 columnas + 7 de auditoría
     - Dependencia: CUMST (FK: ID_Cliente)
     
 11. DLPMT.sql - Plan de Pagos
     - Cronograma de pagos para cada préstamo
     - Clave: (ID_Plan_Pago)
     - Campos: 25 columnas + 7 de auditoría
     - Dependencia: DEALS (FK: ID_Prestamo)
     - Tracking: Cuotas, atrasos, mora
*/

-- ============================================================================
-- ORDEN RECOMENDADO DE EJECUCIÓN
-- ============================================================================

/*
Este orden respeta las dependencias de claves externas (Foreign Keys):

NIVEL 1 - TABLAS BASE (Sin dependencias):
  1. CNOFT.sql
  2. CNOFC.sql
  3. GLMST.sql
  4. BAVEN.sql
  5. USERS.sql
  
NIVEL 2 - TABLAS CON FK A TABLAS BASE:
  6. CUMST.sql  (Base de datos de clientes)
  
NIVEL 3 - TABLAS CON FK A CUMST:
  7. ACMST.sql
  8. CUMAD.sql
  9. DEALS.sql
  
NIVEL 4 - TABLAS CON FK A TABLAS NIVEL 3:
 10. DLPMT.sql
 11. TRANS.sql
*/

-- ============================================================================
-- CARACTERÍSTICAS TÉCNICAS DE TODOS LOS SCRIPTS
-- ============================================================================

/*
ESTRUCTURA DE COLUMNAS:
- Nombre largo + Nombre corto (máximo 6 caracteres)
- Ejemplo: Nombre_Columna FOR nomcol CHAR(150) NOT NULL WITH DEFAULT ' '

TIPOS DE DATOS UTILIZADOS:
- CHAR: Texto fijo (ej: estados, códigos)
- DECIMAL(18,2): Números monetarios
- DATE: Fechas
- TIME: Horas
- TIMESTAMP: Fecha y hora
- INT: Enteros pequeños
- BIGINT: Enteros grandes (transacciones)

CAMPOS OBLIGATORIOS EN TODAS LAS TABLAS:
- Usuario_Creacion: Usuario que creó (DEFAULT USER)
- Usuario_Actualizacion: Usuario que actualizó (DEFAULT USER)
- Version_Registro: Control de versiones (DEFAULT 1)
- Observaciones: Notas (DEFAULT ' ')
- Estado_Registro: A=Activo, I=Inactivo (DEFAULT 'A')
- Created_At: Fecha creación (DEFAULT CURRENT_TIMESTAMP)
- Updated_At: Fecha actualización (DEFAULT CURRENT_TIMESTAMP)

METADATOS INCLUIDOS:
- LABEL ON TABLE: Descripción de la tabla
- LABEL ON COLUMN: Etiqueta descriptiva de cada columna
- COMMENT ON TABLE: Comentario detallado de la tabla
- COMMENT ON COLUMN: Comentario detallado de cada columna

ÍNDICES CREADOS:
- PRIMARY KEY: Índice principal por clave primaria
- SECONDARY: Índices por campos de búsqueda frecuente
- Nombre estándar: IDXTABLA01, IDXTABLA02, etc.
*/

-- ============================================================================
-- ESTADÍSTICAS DE IMPLEMENTACIÓN
-- ============================================================================

/*
TABLAS GENERADAS: 11
TOTAL DE CAMPOS: ~270 (incluyendo auditoría)
TOTAL DE ÍNDICES: ~50+
FOREIGN KEYS: ~5+

TAMAÑO ESTIMADO (varía según volumen):
- CNOFT: Pequeña (referencias)
- CNOFC: Pequeña (referencias)
- CUMST: Mediana (maestro)
- ACMST: Grande (detalle)
- GLMST: Mediana (contabilidad)
- TRANS: GRANDE (histórico, requiere mantenimiento)
- DEALS: Grande (operaciones)
- BAVEN: Pequeña (maestro)
- USERS: Pequeña (seguridad)
- CUMAD: Mediana (relacionada a CUMST)
- DLPMT: Grande (histórico de pagos)

CAMPOS COMUNES EN TODAS:
- 7 campos de auditoría
- 15-26 campos funcionales
- Total: 22-33 campos por tabla
*/

-- ============================================================================
-- CONSIDERACIONES DE DESEMPEÑO
-- ============================================================================

/*
ÍNDICES RECOMENDADOS ADICIONALES (según uso):

Para TRANS (tabla crítica):
  CREATE INDEX OTENAS1.IDXTRANS08 ON OTENAS1.TRANS (Codigo_Banco, Codigo_Sucursal);
  CREATE INDEX OTENAS1.IDXTRANS09 ON OTENAS1.TRANS (Debito_Credito, Fecha_Operacion);

Para DLPMT (pago y seguimiento):
  CREATE INDEX OTENAS1.IDXDLPMT08 ON OTENAS1.DLPMT (Fecha_Pago_Real);
  CREATE INDEX OTENAS1.IDXDLPMT09 ON OTENAS1.DLPMT (Dias_Atraso);

Para ACMST (cuentas):
  CREATE INDEX OTENAS1.IDXACMST06 ON OTENAS1.ACMST (Estado_Cuenta);
  CREATE INDEX OTENAS1.IDXACMST07 ON OTENAS1.ACMST (Fecha_Apertura);
*/

-- ============================================================================
-- SCRIPTS AUXILIARES RECOMENDADOS
-- ============================================================================

/*
Para crear la biblioteca antes de ejecutar los scripts:
  CRTLIB LIB(OTENAS1) TEXT('Biblioteca de Tenencias')

Para crear el archivo source:
  CRTSRCPF FILE(OTENAS1/QSQLSRC) RCDLEN(200)

Para ejecutar un script:
  RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(CNOFT)

Para consultar la estructura de una tabla:
  DSPFFD FILE(OTENAS1/CNOFT)

Para verificar índices:
  SELECT * FROM SYSCAT.INDEXES WHERE TABNAME = 'CNOFT'

Para hacer backup de tablas:
  BACKUP OTENAS1/*ALL TYPE(*PHY)

Para ver el espacio utilizado:
  DSPOBJD OBJ(OTENAS1/CNOFT) OBJTYPE(*FILE)
*/

-- ============================================================================
-- DOCUMENTACIÓN COMPLEMENTARIA
-- ============================================================================

/*
Consultar en la estructura_bd.md:
- Diagrama ER (Entity Relationship)
- Relaciones entre tablas
- Descripción detallada de cada tabla
- Campos funcionales por tabla

Documentación de AS400/DB2 for i:
- DB2 for i SQL Reference
- IBM i System i Documentation
- Performance and Query Optimization Guide
*/

-- ============================================================================
-- VERSIONES Y MANTENIMIENTO
-- ============================================================================

/*
VERSIÓN: 1.0
FECHA: 2026-06-15
AUTOR: Lazaro Tenas

PRÓXIMAS VERSIONES:
- Añadir más tablas de módulos adicionales
- Crear vistas consolidadas
- Implementar triggers de auditoría
- Scripts de migración de datos
- Procedimientos almacenados para operaciones comunes

CAMBIOS REGISTRADOS:
- v1.0: Generación inicial de 11 tablas base
*/

-- ============================================================================
-- FIN DEL RESUMEN
-- ============================================================================
