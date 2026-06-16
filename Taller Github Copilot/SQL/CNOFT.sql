-- ============================================================================
-- TABLA: CNOFT
-- DESCRIPCIÓN: Archivo Maestro de Tablas de Datos Comunes.
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.CNOFT (
  Codigo_Tabla FOR CODTAB CHAR(20) NOT NULL,
  Idioma FOR IDIO CHAR(20) NOT NULL WITH DEFAULT ' ',
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
  PRIMARY KEY (Codigo_Tabla, Idioma)
);

LABEL ON TABLE OTENAS1.CNOFT IS 'Archivo Maestro de Tablas de Datos Comunes';

LABEL ON COLUMN OTENAS1.CNOFT (
  Codigo_Tabla IS 'Código de la Tabla',
  Idioma IS 'Idioma',
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

COMMENT ON TABLE OTENAS1.CNOFT IS 'Archivo Maestro de Tablas de Datos Comunes. Almacena información de referencias de datos comunes del sistema.';

COMMENT ON COLUMN OTENAS1.CNOFT.Codigo_Tabla IS 'Código único que identifica la tabla de datos comunes.';
COMMENT ON COLUMN OTENAS1.CNOFT.Idioma IS 'Código del idioma asociado a los datos comunes.';
COMMENT ON COLUMN OTENAS1.CNOFT.Descripcion IS 'Descripción general del registro de datos comunes.';
COMMENT ON COLUMN OTENAS1.CNOFT.Valor_Texto IS 'Valor de texto asociado al registro.';
COMMENT ON COLUMN OTENAS1.CNOFT.Valor_Numerico IS 'Valor numérico con decimales asociado al registro.';
COMMENT ON COLUMN OTENAS1.CNOFT.Vigencia_Desde IS 'Fecha a partir de la cual el registro es vigente.';
COMMENT ON COLUMN OTENAS1.CNOFT.Vigencia_Hasta IS 'Fecha hasta la cual el registro es vigente.';
COMMENT ON COLUMN OTENAS1.CNOFT.Orden_Visualizacion IS 'Orden de visualización en reportes y consultas.';
COMMENT ON COLUMN OTENAS1.CNOFT.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.CNOFT.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.CNOFT.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.CNOFT.Observaciones IS 'Observaciones o notas adicionales sobre el registro.';
COMMENT ON COLUMN OTENAS1.CNOFT.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.CNOFT.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.CNOFT.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXCNOFT01 ON OTENAS1.CNOFT (Codigo_Tabla, Idioma);
CREATE INDEX OTENAS1.IDXCNOFT02 ON OTENAS1.CNOFT (Created_At);
