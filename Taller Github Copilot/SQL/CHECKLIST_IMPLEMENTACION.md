# ✅ Checklist de Implementación de Scripts SQL

**Fecha de Inicio**: ________________  
**Usuario Responsable**: ________________  
**Sistema AS400**: ________________  
**Ambiente**: [ ] Desarrollo [ ] Prueba [ ] Producción

---

## 📋 FASE 1: PREPARACIÓN DEL ENTORNO

### 1.1 Verificaciones Previas
- [ ] Sistema AS400 disponible y conectado
- [ ] Usuario con permisos para crear librerías y tablas
- [ ] Suficiente espacio en disco disponible
- [ ] Acceso a herramienta: iSeries Navigator O ACS SQL Editor
- [ ] Copia de seguridad del sistema realizada (si es Producción)

### 1.2 Documentación Lista
- [ ] Archivo `estructura_bd.md` accesible
- [ ] Archivo `README.md` revisado
- [ ] Archivo `RESUMEN.sql` revisado
- [ ] Archivos SQL están en: `Taller Github Copilot/SQL/`

### 1.3 Verificar Conexión
```
PING system_name
```
- [ ] Conexión exitosa

---

## 📋 FASE 2: CREAR ESTRUCTURA BASE

### 2.1 Crear Biblioteca OTENAS1
```
CRTLIB LIB(OTENAS1) TEXT('Biblioteca de Tenencias - Operaciones Bancarias')
```
- [ ] Biblioteca creada exitosamente
- [ ] Verificar: `DSPLIB OTENAS1`

### 2.2 Crear Archivo Source SQL
```
CRTSRCPF FILE(OTENAS1/QSQLSRC) RCDLEN(200) TEXT('Código SQL fuente')
```
- [ ] Archivo QSQLSRC creado
- [ ] Verificar: `DSPOBJD OBJ(OTENAS1/QSQLSRC)`

### 2.3 Asignar Permisos
```
GRTOBJAUT OBJ(OTENAS1) OBJTYPE(*LIB) USER(USUARIO) AUT(*ALL)
```
- [ ] Permisos asignados

---

## 📋 FASE 3: CREAR TABLAS BASE (SIN DEPENDENCIAS)

Ejecutar en este orden:

### 3.1 CNOFT - Datos Comunes
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(CNOFT)
```
- [ ] Script ejecutado sin errores
- [ ] Verificar: `DSPFFD FILE(OTENAS1/CNOFT)`
- [ ] Insertar registro de prueba
- [ ] Verificar registro con: `SELECT * FROM OTENAS1.CNOFT`

### 3.2 CNOFC - Referencias
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(CNOFC)
```
- [ ] Script ejecutado sin errores
- [ ] Verificar: `DSPFFD FILE(OTENAS1/CNOFC)`

### 3.3 GLMST - Cuentas Contables
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(GLMST)
```
- [ ] Script ejecutado sin errores
- [ ] Verificar: `DSPFFD FILE(OTENAS1/GLMST)`

### 3.4 BAVEN - Proveedores
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(BAVEN)
```
- [ ] Script ejecutado sin errores
- [ ] Verificar: `DSPFFD FILE(OTENAS1/BAVEN)`

### 3.5 USERS - Seguridad
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(USERS)
```
- [ ] Script ejecutado sin errores
- [ ] Verificar: `DSPFFD FILE(OTENAS1/USERS)`

---

## 📋 FASE 4: CREAR TABLA BASE DE CLIENTES

### 4.1 CUMST - Maestro de Clientes ⭐ CRÍTICA
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(CUMST)
```
- [ ] Script ejecutado sin errores
- [ ] Verificar: `DSPFFD FILE(OTENAS1/CUMST)`
- [ ] Verificar índices: `DSPFFD FILE(OTENAS1/CUMST) LEVEL(*KEY)`
- [ ] Insertar cliente de prueba
- [ ] Número de registros esperados: 1+

---

## 📋 FASE 5: CREAR TABLAS RELACIONADAS A CUMST

### 5.1 ACMST - Cuentas Detalle
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(ACMST)
```
- [ ] Script ejecutado sin errores
- [ ] Verificar FK: `SELECT * FROM SYSCAT.REFERENCES WHERE TABNAME='ACMST'`
- [ ] Insertar cuenta de prueba

### 5.2 CUMAD - Direcciones y Beneficiarios
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(CUMAD)
```
- [ ] Script ejecutado sin errores
- [ ] Verificar FK a CUMST

### 5.3 DEALS - Préstamos/Operaciones
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(DEALS)
```
- [ ] Script ejecutado sin errores
- [ ] Verificar FK a CUMST

---

## 📋 FASE 6: CREAR TABLAS DE DETALLE

### 6.1 DLPMT - Plan de Pagos
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(DLPMT)
```
- [ ] Script ejecutado sin errores
- [ ] Verificar FK a DEALS

### 6.2 TRANS - Transacciones Histórico
```
RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(TRANS)
```
- [ ] Script ejecutado sin errores
- [ ] **IMPORTANTE**: Tabla grande, puede tomar tiempo

---

## 📋 FASE 7: VERIFICACIÓN COMPLETA

### 7.1 Contar Todas las Tablas Creadas
```sql
SELECT COUNT(*) FROM SYSCAT.TABLES WHERE TABSCHEMA='OTENAS1'
```
- [ ] Resultado: 11 tablas
- [ ] Documentar: __________ tablas encontradas

### 7.2 Verificar Índices
```sql
SELECT COUNT(*) FROM SYSCAT.INDEXES WHERE TABSCHEMA='OTENAS1'
```
- [ ] Índices creados: ~50+
- [ ] Documentar: __________ índices encontrados

### 7.3 Verificar Foreign Keys
```sql
SELECT COUNT(*) FROM SYSCAT.REFERENCES WHERE TABSCHEMA='OTENAS1'
```
- [ ] FKs definidas: 5
- [ ] Documentar: __________ relaciones encontradas

### 7.4 Verificar Todos los Comentarios
```sql
SELECT TABNAME, REMARKS FROM SYSCAT.TABLES WHERE TABSCHEMA='OTENAS1'
```
- [ ] Todos los comentarios están presentes

### 7.5 Listar Todas las Tablas
```sql
SELECT TABNAME, COLCOUNT FROM SYSCAT.TABLES 
WHERE TABSCHEMA='OTENAS1' 
ORDER BY TABNAME
```
Verificar presencia de:
- [ ] ACMST
- [ ] BAVEN
- [ ] CNOFC
- [ ] CNOFT
- [ ] CUMAD
- [ ] CUMST
- [ ] DEALS
- [ ] DLPMT
- [ ] GLMST
- [ ] TRANS
- [ ] USERS

---

## 📋 FASE 8: PRUEBAS DE INTEGRIDAD

### 8.1 Probar Inserción en Tabla Base
```sql
INSERT INTO OTENAS1.CUMST (
    ID_Cliente, Numero_Cliente, Nombre_Cliente, Tipo_Cliente,
    Identificacion, Tipo_Identificacion
) VALUES (
    'TEST001', 'T0001', 'Test Cliente', 'P', 'TEST123', 'CC'
)
```
- [ ] Inserción exitosa

### 8.2 Probar Foreign Key
```sql
INSERT INTO OTENAS1.ACMST (
    ID_Cuenta, Numero_Cuenta, ID_Cliente, Codigo_Banco,
    Codigo_Sucursal, Codigo_Moneda, Tipo_Cuenta
) VALUES (
    'TCTA001', '080000001', 'TEST001', 'B001', 'S001', 'COP', 'Corriente'
)
```
- [ ] Inserción exitosa (FK válida)

### 8.3 Probar Restricción de FK (Debe fallar)
```sql
INSERT INTO OTENAS1.ACMST (
    ID_Cuenta, Numero_Cuenta, ID_Cliente, Codigo_Banco,
    Codigo_Sucursal, Codigo_Moneda, Tipo_Cuenta
) VALUES (
    'TCTA002', '080000002', 'NOEXISTE', 'B001', 'S001', 'COP', 'Corriente'
)
```
- [ ] Inserción rechazada correctamente (FK violation)

### 8.4 Verificar Auditoría
```sql
SELECT * FROM OTENAS1.CUMST 
WHERE ID_Cliente = 'TEST001'
```
- [ ] Verificar que se llenaron los campos:
  - [ ] Usuario_Creacion = USER
  - [ ] Created_At = Timestamp actual
  - [ ] Estado_Registro = 'A'
  - [ ] Version_Registro = 1

### 8.5 Limpiar Datos de Prueba
```sql
DELETE FROM OTENAS1.ACMST WHERE ID_Cliente = 'TEST001';
DELETE FROM OTENAS1.CUMST WHERE ID_Cliente = 'TEST001';
COMMIT;
```
- [ ] Datos de prueba eliminados

---

## 📋 FASE 9: BACKUP Y DOCUMENTACIÓN

### 9.1 Crear Backup
```
BACKUP DEV('/backup_path') OBJ(('/OTENAS1'))
```
- [ ] Backup completado exitosamente
- [ ] Ubicación del backup: __________________________________

### 9.2 Documentar Instalación
- [ ] Completar formulario de implementación
- [ ] Fecha de instalación: __________________________________
- [ ] Usuario responsable: __________________________________
- [ ] Ambiente (Dev/Test/Prod): __________________________________
- [ ] Problemas encontrados: __________________________________
- [ ] Notas adicionales: __________________________________

### 9.3 Generar Reporte de Salud
```sql
SELECT TABNAME, CARD as TOTAL_REGISTROS, TBSPACEID
FROM SYSCAT.TABLES 
WHERE TABSCHEMA='OTENAS1' 
ORDER BY TABNAME
```
- [ ] Reporte generado y guardado

---

## 📋 FASE 10: CONFIGURACIÓN POST-IMPLEMENTACIÓN

### 10.1 Configurar Estadísticas
```
ANALYZE TABLE OTENAS1.CUMST;
ANALYZE TABLE OTENAS1.ACMST;
ANALYZE TABLE OTENAS1.TRANS;
ANALYZE TABLE OTENAS1.DEALS;
```
- [ ] Estadísticas actualizadas

### 10.2 Configurar Auditoría (Opcional)
```
SET AUDIT RULE AUDIT_OTENAS1 RULE (
    ALTER TABLE OTENAS1.*,
    DELETE FROM OTENAS1.*,
    INSERT INTO OTENAS1.*,
    UPDATE OTENAS1.*
)
```
- [ ] Auditoría configurada

### 10.3 Conceder Permisos a Usuarios
```
GRTOBJAUT OBJ(OTENAS1) OBJTYPE(*LIB) USER(USER1) AUT(*USE)
```
- [ ] Permisos asignados a:
  - [ ] Usuario 1: ______________
  - [ ] Usuario 2: ______________
  - [ ] Usuario 3: ______________

---

## 📋 FASE 11: VALIDACIÓN FINAL

### 11.1 Ejecutar Ejemplos de Consultas
- [ ] Ejecutar: `EJEMPLOS_CONSULTAS.sql`
- [ ] Verificar que todas las consultas retornan resultados sin errores

### 11.2 Revisar Documentación
- [ ] README.md completamente revisado
- [ ] RESUMEN.sql completamente revisado
- [ ] INDEX.md completamente revisado

### 11.3 Prueba de Desempeño (Opcional)
```sql
INSERT INTO OTENAS1.CUMST (...) SELECT ... (100,000 registros)
```
- [ ] Inserción masiva completada
- [ ] Tiempo: ______________
- [ ] Sin errores

### 11.4 Validar Integridad Referencial
```sql
SELECT * FROM OTENAS1.ACMST A 
WHERE NOT EXISTS (
    SELECT 1 FROM OTENAS1.CUMST C 
    WHERE C.ID_Cliente = A.ID_Cliente
)
```
- [ ] Sin registros huérfanos

---

## 📋 FASE 12: CIERRE E IMPLEMENTACIÓN

### 12.1 Obtener Autorización
- [ ] Gerente de BD aprueba: ____ Firma: ____ Fecha: ____
- [ ] DBA verifica: ____ Firma: ____ Fecha: ____
- [ ] Responsable de Proyecto aprueba: ____ Firma: ____ Fecha: ____

### 12.2 Documentar en Cambios
- [ ] Ticket de cambio creado: __________________________
- [ ] RFC (Request for Change) #: __________________________
- [ ] Número de versión en producción: __________________________

### 12.3 Notificar a Equipos
- [ ] Email a desarrollo: ______________
- [ ] Email a QA: ______________
- [ ] Email a soporte: ______________
- [ ] Email a usuarios finales: ______________

### 12.4 Archivo de Cierre
- [ ] Todos los archivos (.sql) guardados en repositorio
- [ ] Commit realizado a: __________________________
- [ ] TAG de versión creado: v1.0 - 2026-06-15
- [ ] Documentación archivada en: __________________________

---

## 🚨 ROLLBACK (Si es necesario)

En caso de problemas, ejecutar:

```
RESTORE LIBRARY OTENAS1 FROM('/backup_path')
```

O eliminar todo y reintentar:

```
DLTLIB LIB(OTENAS1)
```

Pasos para rollback:
- [ ] Detener aplicaciones accediendo a OTENAS1
- [ ] Restaurar desde backup
- [ ] Verificar integridad
- [ ] Documentar causa de fallo
- [ ] Reintentar después de correcciones

---

## 📊 RESUMEN FINAL

| Item | Estado | Observaciones |
|------|--------|---------------|
| Biblioteca OTENAS1 | [ ] OK | |
| Archivo QSQLSRC | [ ] OK | |
| 11 Tablas | [ ] OK | |
| ~50 Índices | [ ] OK | |
| 5 Foreign Keys | [ ] OK | |
| Auditoría | [ ] OK | |
| Backup | [ ] OK | |
| Documentación | [ ] OK | |
| Pruebas | [ ] OK | |
| Autorización | [ ] OK | |

---

**Implementación Completada**: [ ] SÍ [ ] NO

**Fecha de Cierre**: ________________________

**Aceptado Por**: ________________________ **Fecha**: ____________

---

*Este checklist debe ser completado y archivado para auditoría.*
