-- ============================================================================
-- TABLA: BAVEN
-- DESCRIPCIÓN: Maestro de Proveedores
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.BAVEN (
  ID_Proveedor FOR IDPROV CHAR(30) NOT NULL,
  Numero_Proveedor FOR NUMPROV CHAR(20) NOT NULL WITH DEFAULT ' ',
  Nombre_Proveedor FOR NOMPROV CHAR(150) NOT NULL WITH DEFAULT ' ',
  Tipo_Proveedor FOR TIPPROV CHAR(20) NOT NULL WITH DEFAULT ' ',
  Identificacion FOR IDENTI CHAR(20) NOT NULL WITH DEFAULT ' ',
  Tipo_Identificacion FOR TIPID CHAR(5) NOT NULL WITH DEFAULT ' ',
  Email FOR EMAIL CHAR(100) NOT NULL WITH DEFAULT ' ',
  Telefono FOR TELF CHAR(20) NOT NULL WITH DEFAULT ' ',
  Direccion FOR DIREC CHAR(150) NOT NULL WITH DEFAULT ' ',
  Ciudad FOR CIUDAD CHAR(50) NOT NULL WITH DEFAULT ' ',
  Pais FOR PAIS CHAR(50) NOT NULL WITH DEFAULT ' ',
  Codigo_Postal FOR CODPOS CHAR(10) NOT NULL WITH DEFAULT ' ',
  Contacto_Principal FOR CONPRI CHAR(100) NOT NULL WITH DEFAULT ' ',
  Email_Contacto FOR EMCON CHAR(100) NOT NULL WITH DEFAULT ' ',
  Telefono_Contacto FOR TELCON CHAR(20) NOT NULL WITH DEFAULT ' ',
  Condiciones_Pago FOR CONDPG CHAR(50) NOT NULL WITH DEFAULT ' ',
  Dias_Credito FOR DIASCR INT NOT NULL WITH DEFAULT 0,
  Descuento_Pronto_Pago FOR DESCPP DECIMAL(5,2) NOT NULL WITH DEFAULT 0,
  Saldo_Actual FOR SALDO DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Estado_Proveedor FOR ESTPROV CHAR(1) NOT NULL WITH DEFAULT 'A',
  Fecha_Afiliacion FOR FEAFILM DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Usuario_Creacion FOR USRC CHAR(30) NOT NULL WITH DEFAULT USER,
  Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL WITH DEFAULT USER,
  Version_Registro FOR VREC INT NOT NULL WITH DEFAULT 1,
  Observaciones FOR OBS CHAR(120) NOT NULL WITH DEFAULT ' ',
  Estado_Registro FOR ESTRE CHAR(1) NOT NULL WITH DEFAULT 'A',
  Created_At FOR CREAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Updated_At FOR UPDAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID_Proveedor)
);

LABEL ON TABLE OTENAS1.BAVEN IS 'Maestro de Proveedores';

LABEL ON COLUMN OTENAS1.BAVEN (
  ID_Proveedor IS 'ID Único del Proveedor',
  Numero_Proveedor IS 'Número de Proveedor',
  Nombre_Proveedor IS 'Nombre del Proveedor',
  Tipo_Proveedor IS 'Tipo de Proveedor',
  Identificacion IS 'Identificación del Proveedor',
  Tipo_Identificacion IS 'Tipo de Identificación',
  Email IS 'Correo Electrónico',
  Telefono IS 'Teléfono de Contacto',
  Direccion IS 'Dirección del Proveedor',
  Ciudad IS 'Ciudad',
  Pais IS 'País',
  Codigo_Postal IS 'Código Postal',
  Contacto_Principal IS 'Contacto Principal',
  Email_Contacto IS 'Email del Contacto',
  Telefono_Contacto IS 'Teléfono del Contacto',
  Condiciones_Pago IS 'Condiciones de Pago',
  Dias_Credito IS 'Días de Crédito',
  Descuento_Pronto_Pago IS 'Descuento por Pago Oportuno',
  Saldo_Actual IS 'Saldo Actual',
  Estado_Proveedor IS 'Estado del Proveedor',
  Fecha_Afiliacion IS 'Fecha de Afiliación',
  Usuario_Creacion IS 'Usuario que Creó el Registro',
  Usuario_Actualizacion IS 'Usuario que Actualizó el Registro',
  Version_Registro IS 'Versión del Registro',
  Observaciones IS 'Observaciones',
  Estado_Registro IS 'Estado del Registro',
  Created_At IS 'Fecha y Hora de Creación',
  Updated_At IS 'Fecha y Hora de Actualización'
);

COMMENT ON TABLE OTENAS1.BAVEN IS 'Maestro de Proveedores. Contiene la información de todos los proveedores del banco.';

COMMENT ON COLUMN OTENAS1.BAVEN.ID_Proveedor IS 'Identificador único del proveedor en el sistema.';
COMMENT ON COLUMN OTENAS1.BAVEN.Numero_Proveedor IS 'Número de proveedor asignado.';
COMMENT ON COLUMN OTENAS1.BAVEN.Nombre_Proveedor IS 'Nombre de la empresa o persona proveedor.';
COMMENT ON COLUMN OTENAS1.BAVEN.Tipo_Proveedor IS 'Categoría del proveedor: Servicios, Productos, etc.';
COMMENT ON COLUMN OTENAS1.BAVEN.Identificacion IS 'Documento de identificación fiscal.';
COMMENT ON COLUMN OTENAS1.BAVEN.Tipo_Identificacion IS 'NIT, CC, PA, etc.';
COMMENT ON COLUMN OTENAS1.BAVEN.Email IS 'Correo electrónico principal.';
COMMENT ON COLUMN OTENAS1.BAVEN.Telefono IS 'Teléfono principal.';
COMMENT ON COLUMN OTENAS1.BAVEN.Direccion IS 'Dirección comercial del proveedor.';
COMMENT ON COLUMN OTENAS1.BAVEN.Ciudad IS 'Ciudad de ubicación.';
COMMENT ON COLUMN OTENAS1.BAVEN.Pais IS 'País de ubicación.';
COMMENT ON COLUMN OTENAS1.BAVEN.Codigo_Postal IS 'Código postal.';
COMMENT ON COLUMN OTENAS1.BAVEN.Contacto_Principal IS 'Nombre del contacto principal.';
COMMENT ON COLUMN OTENAS1.BAVEN.Email_Contacto IS 'Correo del contacto principal.';
COMMENT ON COLUMN OTENAS1.BAVEN.Telefono_Contacto IS 'Teléfono del contacto principal.';
COMMENT ON COLUMN OTENAS1.BAVEN.Condiciones_Pago IS 'Términos de pago acordados.';
COMMENT ON COLUMN OTENAS1.BAVEN.Dias_Credito IS 'Días de crédito otorgados.';
COMMENT ON COLUMN OTENAS1.BAVEN.Descuento_Pronto_Pago IS 'Porcentaje de descuento por pago oportuno.';
COMMENT ON COLUMN OTENAS1.BAVEN.Saldo_Actual IS 'Saldo adeudado actual.';
COMMENT ON COLUMN OTENAS1.BAVEN.Estado_Proveedor IS 'A=Activo, I=Inactivo, S=Suspendido.';
COMMENT ON COLUMN OTENAS1.BAVEN.Fecha_Afiliacion IS 'Fecha de registro como proveedor.';
COMMENT ON COLUMN OTENAS1.BAVEN.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.BAVEN.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.BAVEN.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.BAVEN.Observaciones IS 'Observaciones o notas adicionales sobre el proveedor.';
COMMENT ON COLUMN OTENAS1.BAVEN.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.BAVEN.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.BAVEN.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXBAVEN01 ON OTENAS1.BAVEN (ID_Proveedor);
CREATE INDEX OTENAS1.IDXBAVEN02 ON OTENAS1.BAVEN (Numero_Proveedor);
CREATE INDEX OTENAS1.IDXBAVEN03 ON OTENAS1.BAVEN (Identificacion);
CREATE INDEX OTENAS1.IDXBAVEN04 ON OTENAS1.BAVEN (Estado_Proveedor);
CREATE INDEX OTENAS1.IDXBAVEN05 ON OTENAS1.BAVEN (Created_At);
