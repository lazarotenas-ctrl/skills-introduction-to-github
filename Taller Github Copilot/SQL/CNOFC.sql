-- ============================================================================
-- TABLA: CNOFC
-- DESCRIPCIÓN: Archivo de Referencias del Sistema o de Datos Comunes.
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.CNOFC (
  Codigo_Tabla FOR CODTAB CHAR(20) NOT NULL,
  Codigo_Registro FOR CODREG CHAR(20) NOT NULL,
  Descripcion FOR DESC CHAR(120) NOT NULL WITH DEFAULT ' ',
  Valor_Texto FOR VLTX CHAR(50) NOT NULL WITH DEFAULT ' ',
  Valor_Numerico FOR VLNM DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Vigencia_Desde FOR VIGDES DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Vigencia_Hasta FOR VIGHTA DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Orden_Visualizacion FOR ORDVIS INT NOT NULL WITH DEFAULT 0,
  Usuario_Creacion FOR USRC CHAR(30) NOT NULL WITH DEFAULT USER,
  Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL WITH DEFAULT USER,
  Version_Registro FOR VREC INT NOT NULL WITH DEFAULT 1,
  Observaciones FOR OBS CHAR(120) NOT NULL WITH DEFAULT ' ',
  Estado_Registro FOR ESTRE CHAR(1) NOT NULL WITH DEFAULT 'A',
  Created_At FOR CREAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Updated_At FOR UPDAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Codigo_Tabla, Codigo_Registro)
);

LABEL ON TABLE OTENAS1.CNOFC IS 'Archivo de Referencias del Sistema o de Datos Comunes';

LABEL ON COLUMN OTENAS1.CNOFC (
  Codigo_Tabla IS 'Código de la Tabla',
  Codigo_Registro IS 'Código del Registro',
  Descripcion IS 'Descripción del Registro',
  Valor_Texto IS 'Valor Texto',
  Valor_Numerico IS 'Valor Numérico',
  Vigencia_Desde IS 'Fecha Vigencia Desde',
  Vigencia_Hasta IS 'Fecha Vigencia Hasta',
  Orden_Visualizacion IS 'Orden de Visualización',
  Usuario_Creacion IS 'Usuario que Creó el Registro',
  Usuario_Actualizacion IS 'Usuario que Actualizó el Registro',
  Version_Registro IS 'Versión del Registro',
  Observaciones IS 'Observaciones',
  Estado_Registro IS 'Estado del Registro',
  Created_At IS 'Fecha y Hora de Creación',
  Updated_At IS 'Fecha y Hora de Actualización'
);

COMMENT ON TABLE OTENAS1.CNOFC IS 'Archivo de Referencias del Sistema o de Datos Comunes. Contiene referencias cruzadas para búsquedas rápidas.';

COMMENT ON COLUMN OTENAS1.CNOFC.Codigo_Tabla IS 'Código único que identifica la tabla de referencias.';
COMMENT ON COLUMN OTENAS1.CNOFC.Codigo_Registro IS 'Código único que identifica el registro dentro de la tabla.';
COMMENT ON COLUMN OTENAS1.CNOFC.Descripcion IS 'Descripción general del registro de referencia.';
COMMENT ON COLUMN OTENAS1.CNOFC.Valor_Texto IS 'Valor de texto asociado al registro.';
COMMENT ON COLUMN OTENAS1.CNOFC.Valor_Numerico IS 'Valor numérico con decimales asociado al registro.';
COMMENT ON COLUMN OTENAS1.CNOFC.Vigencia_Desde IS 'Fecha a partir de la cual el registro es vigente.';
COMMENT ON COLUMN OTENAS1.CNOFC.Vigencia_Hasta IS 'Fecha hasta la cual el registro es vigente.';
COMMENT ON COLUMN OTENAS1.CNOFC.Orden_Visualizacion IS 'Orden de visualización en reportes y consultas.';
COMMENT ON COLUMN OTENAS1.CNOFC.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.CNOFC.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.CNOFC.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.CNOFC.Observaciones IS 'Observaciones o notas adicionales sobre el registro.';
COMMENT ON COLUMN OTENAS1.CNOFC.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.CNOFC.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.CNOFC.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXCNOFC01 ON OTENAS1.CNOFC (Codigo_Tabla, Codigo_Registro);
CREATE INDEX OTENAS1.IDXCNOFC02 ON OTENAS1.CNOFC (Created_At);
