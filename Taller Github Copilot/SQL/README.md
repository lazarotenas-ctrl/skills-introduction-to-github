## Scripts SQL para DB2 for i (AS400)

### Descripción General
Este directorio contiene los scripts SQL para crear las tablas de la base de datos bancaria en AS400 (DB2 for i). Los scripts están diseñados para ejecutarse en la biblioteca **OTENAS1** en el archivo **QSQLSRC**.

### Especificaciones Técnicas

Todos los scripts cumplen con los siguientes requisitos:

1. **Sintaxis DB2 for i (AS400)**
   - Utilizan CREATE TABLE compatible con DB2 for i
   - Incluyen LABEL ON COLUMN para nombres descriptivos
   - Incluyen COMMENT ON COLUMN para documentación
   - Incluyen COMMENT ON TABLE para descripción general

2. **Estructura de Columnas**
   - Cada columna tiene nombre largo y nombre corto (6 caracteres máximo)
   - Ejemplo: `Nombre_Columna FOR nomcol CHAR(150) NOT NULL WITH DEFAULT ' '`
   - Todas las columnas son NOT NULL
   - Todas incluyen WITH DEFAULT (excepto columnas de clave primaria)

3. **Tipos de Datos Compatibles**
   - CHAR para texto
   - DECIMAL para números con decimales
   - DATE para fechas
   - TIME para horas
   - TIMESTAMP para fecha y hora
   - INT para enteros
   - BIGINT para enteros grandes

4. **Metadatos Incluidos**
   - Encabezado con: Nombre de tabla, Descripción, Autor (Lazaro Tenas), Fecha
   - LABEL ON COLUMN para cada columna
   - COMMENT ON TABLE con descripción general
   - COMMENT ON COLUMN con documentación detallada de cada columna

5. **Relaciones (Foreign Keys)**
   - Se incluyen donde están definidas en la estructura
   - Ejemplo: FOREIGN KEY referencia de CUMST en ACMST

6. **Índices**
   - Se crean índices por campos de consulta frecuente
   - Índices principales (PRIMARY KEY)
   - Índices secundarios para mejora de desempeño

### Tablas Incluidas

| Tabla | Descripción |
|-------|-------------|
| CNOFT | Archivo Maestro de Tablas de Datos Comunes |
| CNOFC | Archivo de Referencias del Sistema |
| CUMST | Archivo Maestro de Clientes |
| ACMST | Archivo Maestro de Cuentas de Detalle |
| GLMST | Maestro de Cuentas Contables |
| TRANS | Archivo Histórico de Transacciones |
| DEALS | Maestro de Préstamos, Certificados, Giros, Valores |
| BAVEN | Maestro de Proveedores |
| USERS | Archivo de Autorizaciones por Menús |

### Cómo Ejecutar los Scripts

#### Opción 1: Desde iSeries/IBM i Navigator
1. Conectar a la biblioteca OTENAS1
2. Navegar a QSQLSRC
3. Crear un nuevo miembro SQL con el nombre de la tabla
4. Copiar el contenido del script
5. Ejecutar con: `RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(CNOFT)`

#### Opción 2: Desde ACS (Advanced Client Solutions)
1. Conectar al sistema AS400
2. Abrir SQL Editor
3. Cargar el archivo del script
4. Ejecutar con: Run SQL Statement (Ctrl+E)

#### Opción 3: Crear Miembro SQL
```
CRTSRCPF FILE(OTENAS1/QSQLSRC) RCDLEN(200)
```

Luego copiar el contenido del script a un miembro:
```
CPYFRMSTMF FROMSTMF('<ruta al archivo>.sql') 
           TOMBRFILE(OTENAS1/QSQLSRC) 
           TOMBR(CNOFT) 
           TBLSPC(QSYS)
```

### Campos de Auditoría (Presentes en Todas las Tablas)

- **Usuario_Creacion**: Usuario que creó el registro (DEFAULT USER)
- **Usuario_Actualizacion**: Usuario que actualizó el registro (DEFAULT USER)
- **Version_Registro**: Control de versiones (DEFAULT 1)
- **Observaciones**: Notas adicionales (DEFAULT ' ')
- **Estado_Registro**: A=Activo, I=Inactivo (DEFAULT 'A')
- **Created_At**: Fecha/Hora creación (DEFAULT CURRENT_TIMESTAMP)
- **Updated_At**: Fecha/Hora actualización (DEFAULT CURRENT_TIMESTAMP)

### Ejemplo de Inserción de Datos

```sql
INSERT INTO OTENAS1.CNOFT 
VALUES('TAB001', 'ES', 'Descripción', 'Valor', 100.50, CURRENT_DATE, CURRENT_DATE, 1, USER, USER, 1, 'Notas', 'A', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
```

### Notas Importantes

1. **Biblioteca OTENAS1**: Asegurar que exista antes de ejecutar los scripts
   ```
   CRTLIB LIB(OTENAS1)
   ```

2. **Permisos**: El usuario debe tener permisos para crear tablas en OTENAS1

3. **Relaciones**: Los scripts respetan las foreign keys. Por ejemplo:
   - ACMST debe ejecutarse después de CUMST
   - DEALS debe ejecutarse después de CUMST

4. **Orden de Ejecución Recomendado**:
   1. CNOFT
   2. CNOFC
   3. CUMST (base para otros)
   4. ACMST (depende de CUMST)
   5. GLMST
   6. TRANS
   7. DEALS (depende de CUMST)
   8. BAVEN
   9. USERS

### Mantenimiento

Para modificar una tabla existente:
```sql
ALTER TABLE OTENAS1.<TABLA> ADD COLUMN <definición>
```

Para agregar un índice:
```sql
CREATE INDEX OTENAS1.IDX<TABLA><NN> ON OTENAS1.<TABLA> (<CAMPO>)
```

### Documentación Adicional

Consultar:
- Sistema DB2 for i documentation
- IBM i SQL Reference
- Manual de Políticas de Datos Bancarios

---
**Autor**: Lazaro Tenas  
**Fecha**: 2026-06-15  
**Versión**: 1.0
