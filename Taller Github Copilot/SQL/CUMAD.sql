-- ============================================================================
-- TABLA: CUMAD
-- DESCRIPCIÓN: Archivo de Direcciones de Correo y Beneficiarios de Operaciones/Clientes
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.CUMAD (
  ID_Direccion FOR IDDIR CHAR(30) NOT NULL,
  ID_Cliente FOR IDCLI CHAR(30) NOT NULL,
  Tipo_Registro FOR TIPREG CHAR(20) NOT NULL WITH DEFAULT ' ',
  Secuencia FOR SECU INT NOT NULL WITH DEFAULT 1,
  Tipo_Direccion FOR TIPDIR CHAR(20) NOT NULL WITH DEFAULT ' ',
  Direccion FOR DIREC CHAR(150) NOT NULL WITH DEFAULT ' ',
  Ciudad FOR CIUDAD CHAR(50) NOT NULL WITH DEFAULT ' ',
  Departamento FOR DEPTO CHAR(50) NOT NULL WITH DEFAULT ' ',
  Pais FOR PAIS CHAR(50) NOT NULL WITH DEFAULT ' ',
  Codigo_Postal FOR CODPOS CHAR(10) NOT NULL WITH DEFAULT ' ',
  Telefono FOR TELF CHAR(20) NOT NULL WITH DEFAULT ' ',
  Email FOR EMAIL CHAR(100) NOT NULL WITH DEFAULT ' ',
  Nombre_Beneficiario FOR NOMBFCD CHAR(100) NOT NULL WITH DEFAULT ' ',
  Tipo_Beneficiario FOR TIPBFCD CHAR(20) NOT NULL WITH DEFAULT ' ',
  Documento_Beneficiario FOR DOCBFCD CHAR(20) NOT NULL WITH DEFAULT ' ',
  Es_Principal FOR ESPRI CHAR(1) NOT NULL WITH DEFAULT 'N',
  Estado_Direccion FOR ESTDIR CHAR(1) NOT NULL WITH DEFAULT 'A',
  Usuario_Creacion FOR USRC CHAR(30) NOT NULL WITH DEFAULT USER,
  Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL WITH DEFAULT USER,
  Version_Registro FOR VREC INT NOT NULL WITH DEFAULT 1,
  Observaciones FOR OBS CHAR(120) NOT NULL WITH DEFAULT ' ',
  Estado_Registro FOR ESTRE CHAR(1) NOT NULL WITH DEFAULT 'A',
  Created_At FOR CREAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Updated_At FOR UPDAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID_Direccion),
  FOREIGN KEY (ID_Cliente) REFERENCES OTENAS1.CUMST (ID_Cliente)
);

LABEL ON TABLE OTENAS1.CUMAD IS 'Archivo de Direcciones de Correo y Beneficiarios de Operaciones';

LABEL ON COLUMN OTENAS1.CUMAD (
  ID_Direccion IS 'ID Único de la Dirección',
  ID_Cliente IS 'ID del Cliente',
  Tipo_Registro IS 'Tipo de Registro',
  Secuencia IS 'Secuencia',
  Tipo_Direccion IS 'Tipo de Dirección',
  Direccion IS 'Dirección',
  Ciudad IS 'Ciudad',
  Departamento IS 'Departamento/Región',
  Pais IS 'País',
  Codigo_Postal IS 'Código Postal',
  Telefono IS 'Teléfono',
  Email IS 'Correo Electrónico',
  Nombre_Beneficiario IS 'Nombre del Beneficiario',
  Tipo_Beneficiario IS 'Tipo de Beneficiario',
  Documento_Beneficiario IS 'Documento del Beneficiario',
  Es_Principal IS 'Es Dirección Principal',
  Estado_Direccion IS 'Estado de la Dirección',
  Usuario_Creacion IS 'Usuario que Creó el Registro',
  Usuario_Actualizacion IS 'Usuario que Actualizó el Registro',
  Version_Registro IS 'Versión del Registro',
  Observaciones IS 'Observaciones',
  Estado_Registro IS 'Estado del Registro',
  Created_At IS 'Fecha y Hora de Creación',
  Updated_At IS 'Fecha y Hora de Actualización'
);

COMMENT ON TABLE OTENAS1.CUMAD IS 'Archivo de Direcciones de Correo y Beneficiarios de Operaciones/Clientes. Mantiene múltiples direcciones y datos de beneficiarios por cliente.';

COMMENT ON COLUMN OTENAS1.CUMAD.ID_Direccion IS 'Identificador único de la dirección en el sistema.';
COMMENT ON COLUMN OTENAS1.CUMAD.ID_Cliente IS 'Identificador del cliente propietario de la dirección.';
COMMENT ON COLUMN OTENAS1.CUMAD.Tipo_Registro IS 'Tipo de registro: Dirección, Beneficiario, etc.';
COMMENT ON COLUMN OTENAS1.CUMAD.Secuencia IS 'Secuencia de la dirección para el cliente.';
COMMENT ON COLUMN OTENAS1.CUMAD.Tipo_Direccion IS 'Residencial, Comercial, Correspondencia, etc.';
COMMENT ON COLUMN OTENAS1.CUMAD.Direccion IS 'Dirección completa.';
COMMENT ON COLUMN OTENAS1.CUMAD.Ciudad IS 'Ciudad de ubicación.';
COMMENT ON COLUMN OTENAS1.CUMAD.Departamento IS 'Departamento o región.';
COMMENT ON COLUMN OTENAS1.CUMAD.Pais IS 'País de ubicación.';
COMMENT ON COLUMN OTENAS1.CUMAD.Codigo_Postal IS 'Código postal.';
COMMENT ON COLUMN OTENAS1.CUMAD.Telefono IS 'Teléfono de contacto.';
COMMENT ON COLUMN OTENAS1.CUMAD.Email IS 'Correo electrónico.';
COMMENT ON COLUMN OTENAS1.CUMAD.Nombre_Beneficiario IS 'Nombre del beneficiario si aplica.';
COMMENT ON COLUMN OTENAS1.CUMAD.Tipo_Beneficiario IS 'Tipo: Heredero, Representante Legal, etc.';
COMMENT ON COLUMN OTENAS1.CUMAD.Documento_Beneficiario IS 'Documento de identificación del beneficiario.';
COMMENT ON COLUMN OTENAS1.CUMAD.Es_Principal IS 'S=Es principal, N=No es principal.';
COMMENT ON COLUMN OTENAS1.CUMAD.Estado_Direccion IS 'A=Activa, I=Inactiva.';
COMMENT ON COLUMN OTENAS1.CUMAD.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.CUMAD.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.CUMAD.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.CUMAD.Observaciones IS 'Observaciones o notas adicionales.';
COMMENT ON COLUMN OTENAS1.CUMAD.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.CUMAD.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.CUMAD.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXCUMAD01 ON OTENAS1.CUMAD (ID_Direccion);
CREATE INDEX OTENAS1.IDXCUMAD02 ON OTENAS1.CUMAD (ID_Cliente);
CREATE INDEX OTENAS1.IDXCUMAD03 ON OTENAS1.CUMAD (ID_Cliente, Secuencia);
CREATE INDEX OTENAS1.IDXCUMAD04 ON OTENAS1.CUMAD (Tipo_Registro);
CREATE INDEX OTENAS1.IDXCUMAD05 ON OTENAS1.CUMAD (Created_At);
