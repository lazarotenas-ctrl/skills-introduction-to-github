-- ============================================================================
-- TABLA: CUMST
-- DESCRIPCIÓN: Archivo de Maestro de Clientes
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.CUMST (
  ID_Cliente FOR IDCLI CHAR(30) NOT NULL,
  Numero_Cliente FOR NUMCLI CHAR(20) NOT NULL,
  Nombre_Cliente FOR NOMCLI CHAR(150) NOT NULL WITH DEFAULT ' ',
  Tipo_Cliente FOR TIPCLI CHAR(1) NOT NULL WITH DEFAULT 'P',
  Identificacion FOR IDENTI CHAR(20) NOT NULL WITH DEFAULT ' ',
  Tipo_Identificacion FOR TIPID CHAR(5) NOT NULL WITH DEFAULT ' ',
  Email FOR EMAIL CHAR(100) NOT NULL WITH DEFAULT ' ',
  Telefono FOR TELF CHAR(20) NOT NULL WITH DEFAULT ' ',
  Direccion FOR DIREC CHAR(150) NOT NULL WITH DEFAULT ' ',
  Ciudad FOR CIUDAD CHAR(50) NOT NULL WITH DEFAULT ' ',
  Pais FOR PAIS CHAR(50) NOT NULL WITH DEFAULT ' ',
  Codigo_Postal FOR CODPOS CHAR(10) NOT NULL WITH DEFAULT ' ',
  Fecha_Afiliacion FOR FECHAIN DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Estado_Cliente FOR ESTCLI CHAR(1) NOT NULL WITH DEFAULT 'A',
  Usuario_Creacion FOR USRC CHAR(30) NOT NULL WITH DEFAULT USER,
  Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL WITH DEFAULT USER,
  Version_Registro FOR VREC INT NOT NULL WITH DEFAULT 1,
  Observaciones FOR OBS CHAR(120) NOT NULL WITH DEFAULT ' ',
  Estado_Registro FOR ESTRE CHAR(1) NOT NULL WITH DEFAULT 'A',
  Created_At FOR CREAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Updated_At FOR UPDAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID_Cliente)
);

LABEL ON TABLE OTENAS1.CUMST IS 'Archivo Maestro de Clientes';

LABEL ON COLUMN OTENAS1.CUMST (
  ID_Cliente IS 'ID Único del Cliente',
  Numero_Cliente IS 'Número de Cliente',
  Nombre_Cliente IS 'Nombre del Cliente',
  Tipo_Cliente IS 'Tipo de Cliente',
  Identificacion IS 'Identificación del Cliente',
  Tipo_Identificacion IS 'Tipo de Identificación',
  Email IS 'Correo Electrónico',
  Telefono IS 'Teléfono de Contacto',
  Direccion IS 'Dirección del Cliente',
  Ciudad IS 'Ciudad',
  Pais IS 'País',
  Codigo_Postal IS 'Código Postal',
  Fecha_Afiliacion IS 'Fecha de Afiliación',
  Estado_Cliente IS 'Estado del Cliente',
  Usuario_Creacion IS 'Usuario que Creó el Registro',
  Usuario_Actualizacion IS 'Usuario que Actualizó el Registro',
  Version_Registro IS 'Versión del Registro',
  Observaciones IS 'Observaciones',
  Estado_Registro IS 'Estado del Registro',
  Created_At IS 'Fecha y Hora de Creación',
  Updated_At IS 'Fecha y Hora de Actualización'
);

COMMENT ON TABLE OTENAS1.CUMST IS 'Archivo Maestro de Clientes. Contiene la información principal de todos los clientes del banco.';

COMMENT ON COLUMN OTENAS1.CUMST.ID_Cliente IS 'Identificador único del cliente en el sistema.';
COMMENT ON COLUMN OTENAS1.CUMST.Numero_Cliente IS 'Número de cliente asignado por el banco.';
COMMENT ON COLUMN OTENAS1.CUMST.Nombre_Cliente IS 'Nombre completo del cliente.';
COMMENT ON COLUMN OTENAS1.CUMST.Tipo_Cliente IS 'P=Persona Natural, J=Persona Jurídica.';
COMMENT ON COLUMN OTENAS1.CUMST.Identificacion IS 'Documento de identificación del cliente.';
COMMENT ON COLUMN OTENAS1.CUMST.Tipo_Identificacion IS 'Tipo de documento: CC, NIT, PA, etc.';
COMMENT ON COLUMN OTENAS1.CUMST.Email IS 'Correo electrónico del cliente.';
COMMENT ON COLUMN OTENAS1.CUMST.Telefono IS 'Número telefónico de contacto.';
COMMENT ON COLUMN OTENAS1.CUMST.Direccion IS 'Dirección de residencia o comercial del cliente.';
COMMENT ON COLUMN OTENAS1.CUMST.Ciudad IS 'Ciudad de residencia o comercial del cliente.';
COMMENT ON COLUMN OTENAS1.CUMST.Pais IS 'País de residencia o comercial del cliente.';
COMMENT ON COLUMN OTENAS1.CUMST.Codigo_Postal IS 'Código postal de la dirección del cliente.';
COMMENT ON COLUMN OTENAS1.CUMST.Fecha_Afiliacion IS 'Fecha en que el cliente se afilió al banco.';
COMMENT ON COLUMN OTENAS1.CUMST.Estado_Cliente IS 'A=Activo, I=Inactivo, S=Suspendido.';
COMMENT ON COLUMN OTENAS1.CUMST.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.CUMST.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.CUMST.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.CUMST.Observaciones IS 'Observaciones o notas adicionales sobre el cliente.';
COMMENT ON COLUMN OTENAS1.CUMST.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.CUMST.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.CUMST.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXCUMST01 ON OTENAS1.CUMST (ID_Cliente);
CREATE INDEX OTENAS1.IDXCUMST02 ON OTENAS1.CUMST (Numero_Cliente);
CREATE INDEX OTENAS1.IDXCUMST03 ON OTENAS1.CUMST (Identificacion);
CREATE INDEX OTENAS1.IDXCUMST04 ON OTENAS1.CUMST (Created_At);
