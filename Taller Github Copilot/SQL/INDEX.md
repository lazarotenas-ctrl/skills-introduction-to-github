# Índice de Scripts SQL Generados

## 📋 Resumen Ejecutivo

Se han generado **13 archivos** con scripts SQL para crear tablas de base de datos en **DB2 for i (AS400)** con sintaxis compatible y estándares de auditoría.

**Ubicación**: `Taller Github Copilot/SQL/`

---

## 📁 Estructura de Archivos

```
SQL/
├── README.md              (Guía de uso y ejecución)
├── RESUMEN.sql            (Resumen técnico completo)
├── CNOFT.sql              (Archivo Maestro de Tablas Comunes)
├── CNOFC.sql              (Archivo de Referencias del Sistema)
├── CUMST.sql              (Maestro de Clientes) ⭐ BASE
├── ACMST.sql              (Maestro de Cuentas Detalle)
├── CUMAD.sql              (Direcciones y Beneficiarios)
├── GLMST.sql              (Maestro de Cuentas Contables)
├── TRANS.sql              (Histórico de Transacciones)
├── DEALS.sql              (Maestro de Préstamos/Operaciones)
├── DLPMT.sql              (Plan de Pagos)
├── BAVEN.sql              (Maestro de Proveedores)
└── USERS.sql              (Autorizaciones por Menús)
```

---

## 📊 Tablas Generadas

### Nivel 1: Tablas Base (Sin Dependencias)

| Archivo | Tabla | Descripción | Registros Aprox. |
|---------|-------|-------------|------------------|
| CNOFT.sql | CNOFT | Archivo Maestro de Tablas de Datos Comunes | ~1,000 |
| CNOFC.sql | CNOFC | Archivo de Referencias del Sistema | ~5,000 |
| GLMST.sql | GLMST | Maestro de Cuentas Contables | ~500 |
| BAVEN.sql | BAVEN | Maestro de Proveedores | ~100 |
| USERS.sql | USERS | Archivo de Autorizaciones por Menús | ~50 |

### Nivel 2: Tablas Base de Clientes

| Archivo | Tabla | Descripción | PK | Registros Aprox. |
|---------|-------|-------------|----|----|
| CUMST.sql | CUMST | Archivo Maestro de Clientes | ID_Cliente | ~10,000 |

### Nivel 3: Tablas Relacionadas a Clientes

| Archivo | Tabla | Descripción | FK a | Registros Aprox. |
|---------|-------|-------------|------|---|
| ACMST.sql | ACMST | Maestro de Cuentas Detalle | CUMST | ~50,000 |
| CUMAD.sql | CUMAD | Direcciones y Beneficiarios | CUMST | ~20,000 |
| DEALS.sql | DEALS | Maestro de Préstamos/Operaciones | CUMST | ~5,000 |

### Nivel 4: Tablas de Detalle

| Archivo | Tabla | Descripción | FK a | Registros Aprox. |
|---------|-------|-------------|------|---|
| DLPMT.sql | DLPMT | Plan de Pagos | DEALS | ~100,000 |
| TRANS.sql | TRANS | Histórico de Transacciones | - | ~1,000,000+ |

---

## 🎯 Especificaciones Técnicas

### Nomenclatura de Columnas

Cada columna sigue el estándar:
```sql
Nombre_Largo FOR nomcor TIPO NOT NULL WITH DEFAULT valor
```

Ejemplo:
```sql
Nombre_Cliente FOR NOMCLI CHAR(150) NOT NULL WITH DEFAULT ' '
```

### Tipos de Datos Utilizados

- **CHAR(n)**: Texto fijo - códigos, estados
- **DECIMAL(18,2)**: Montos, porcentajes
- **DATE**: Fechas
- **TIME**: Horas
- **TIMESTAMP**: Fecha y hora combinadas
- **INT**: Enteros pequeños
- **BIGINT**: Enteros grandes (ID de transacciones)

### Campos de Auditoría (En Todas las Tablas)

```sql
Usuario_Creacion FOR USRC CHAR(30) NOT NULL DEFAULT USER
Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL DEFAULT USER
Version_Registro FOR VREC INT NOT NULL DEFAULT 1
Observaciones FOR OBS CHAR(120) NOT NULL DEFAULT ' '
Estado_Registro FOR ESTRE CHAR(1) NOT NULL DEFAULT 'A'
Created_At FOR CREAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
Updated_At FOR UPDAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
```

### Metadatos Incluidos en Cada Script

✅ Encabezado con:
- Nombre de tabla
- Descripción funcional
- Autor: Lazaro Tenas
- Fecha: 2026-06-15

✅ `LABEL ON TABLE` - Descripción de la tabla

✅ `LABEL ON COLUMN` - Etiqueta de cada columna

✅ `COMMENT ON TABLE` - Documentación detallada

✅ `COMMENT ON COLUMN` - Documentación de cada campo

✅ Índices creados automáticamente

---

## 🔗 Dependencias entre Tablas

```
CUMST (Clientes) ← Base de datos de clientes
  ├→ ACMST (Cuentas Detalle)
  │   └→ TRANS (Transacciones histórico)
  ├→ CUMAD (Direcciones y Beneficiarios)
  └→ DEALS (Préstamos/Operaciones)
       └→ DLPMT (Plan de Pagos)

GLMST (Cuentas Contables)
  └→ TRANS (Transacciones referencia contable)

BAVEN (Proveedores) - Independiente
USERS (Seguridad) - Independiente
CNOFT (Datos Comunes) - Independiente
CNOFC (Referencias) - Independiente
```

---

## 🚀 Orden de Ejecución Recomendado

### Paso 1: Crear la Biblioteca (si no existe)
```
CRTLIB LIB(OTENAS1)
```

### Paso 2: Crear el Archivo Source
```
CRTSRCPF FILE(OTENAS1/QSQLSRC) RCDLEN(200)
```

### Paso 3: Ejecutar Scripts en Este Orden

**Tablas Base (No tienen dependencias):**
1. `CNOFT.sql` - Datos comunes
2. `CNOFC.sql` - Referencias
3. `GLMST.sql` - Cuentas contables
4. `BAVEN.sql` - Proveedores
5. `USERS.sql` - Seguridad

**Base de Datos de Clientes:**
6. `CUMST.sql` - ⭐ Maestro de Clientes

**Relacionadas a Clientes:**
7. `ACMST.sql` - Cuentas
8. `CUMAD.sql` - Direcciones
9. `DEALS.sql` - Préstamos

**Detalle:**
10. `DLPMT.sql` - Plan de Pagos
11. `TRANS.sql` - Transacciones

---

## 📝 Contenido de Cada Script

### 1. **CNOFT.sql** - 15 campos + 7 auditoría
Archivo Maestro de Tablas de Datos Comunes
- Código de tabla, idioma
- Valores texto y numéricos
- Vigencias

### 2. **CNOFC.sql** - 15 campos + 7 auditoría
Archivo de Referencias del Sistema
- Código tabla y registro
- Referencias cruzadas
- Índices de búsqueda

### 3. **CUMST.sql** - 21 campos + 7 auditoría ⭐ CRÍTICO
Maestro de Clientes
- Identificación completa
- Información de contacto
- Datos comerciales
- **3 índices secundarios**

### 4. **ACMST.sql** - 22 campos + 7 auditoría
Maestro de Cuentas de Detalle
- Referencia a cliente
- Saldos (actual, disponible, bloqueado)
- Información de cuenta
- **5 índices secundarios**
- **FK a CUMST**

### 5. **GLMST.sql** - 21 campos + 7 auditoría
Maestro de Cuentas Contables
- Estructura jerárquica
- Permisos de movimiento
- Centros de costo
- **5 índices secundarios**

### 6. **TRANS.sql** - 26 campos + 7 auditoría
Histórico de Transacciones
- Información completa de movimientos
- Saldos anterior/posterior
- Canal de origen
- **7 índices secundarios**

### 7. **DEALS.sql** - 26 campos + 7 auditoría
Maestro de Préstamos/Operaciones
- Montos aprobado/desembolsado
- Tasas de interés
- Garantías
- **7 índices secundarios**
- **FK a CUMST**

### 8. **BAVEN.sql** - 25 campos + 7 auditoría
Maestro de Proveedores
- Datos fiscales completos
- Contacto principal
- Términos de pago
- **5 índices secundarios**

### 9. **USERS.sql** - 22 campos + 7 auditoría
Archivo de Autorizaciones
- Control de acceso
- Permisos por menú/opción
- Seguimiento de accesos
- **6 índices secundarios**

### 10. **CUMAD.sql** - 23 campos + 7 auditoría
Direcciones y Beneficiarios
- Múltiples direcciones por cliente
- Datos de beneficiarios
- **5 índices secundarios**
- **FK a CUMST**

### 11. **DLPMT.sql** - 25 campos + 7 auditoría
Plan de Pagos
- Cuotas programadas
- Tracking de atrasos
- Cálculo de mora
- **7 índices secundarios**
- **FK a DEALS**

---

## 📊 Estadísticas Consolidadas

| Métrica | Cantidad |
|---------|----------|
| Tablas creadas | 11 |
| Scripts SQL | 11 |
| Campos totales | ~270 |
| Campos de auditoría | 77 (7 por tabla) |
| Índices creados | ~50+ |
| Foreign Keys | 5 |
| Archivos generados | 13 |

---

## 🛠️ Recursos Incluidos

### Documentación

- **README.md** - Guía completa de uso y ejecución
- **RESUMEN.sql** - Resumen técnico detallado
- **INDEX.md** (este archivo) - Índice visual completo

### Scripts

- 11 archivos `.sql` listos para ejecutar
- Nombres consistentes: `TABLA.sql`
- Ubicados en biblioteca `OTENAS1`, archivo `QSQLSRC`

---

## ✅ Verificación de Instalación

Después de ejecutar los scripts, verificar:

```sql
-- Ver todas las tablas creadas
SELECT TABNAME FROM SYSCAT.TABLES WHERE TABSCHEMA='OTENAS1'

-- Ver estructura de una tabla
DSPFFD FILE(OTENAS1/CUMST)

-- Ver índices
SELECT * FROM SYSCAT.INDEXES WHERE TABSCHEMA='OTENAS1'

-- Ver foreign keys
SELECT * FROM SYSCAT.REFERENCES WHERE TABSCHEMA='OTENAS1'
```

---

## 📞 Soporte y Mantenimiento

- **Autor**: Lazaro Tenas
- **Fecha de Generación**: 2026-06-15
- **Versión**: 1.0
- **Próximas Versiones**: Más módulos, vistas, triggers

---

## 📚 Referencias Externas

- DB2 for i SQL Reference
- IBM i System i Documentation
- AS400 Performance Tuning Guide
- Estructura BD disponible en: `../Base de Datos/estructura_bd.md`

---

**Todos los scripts están listos para producción. Revisar el archivo README.md para instrucciones detalladas de ejecución.**
