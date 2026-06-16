-- ============================================================================
-- TABLA: ACMST
-- DESCRIPCIÓN: Archivo Maestro de Cuentas de Detalle
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.ACMST (
  ID_Cuenta FOR IDCTA CHAR(30) NOT NULL,
  Numero_Cuenta FOR NUMCTA CHAR(24) NOT NULL,
  ID_Cliente FOR IDCLI CHAR(30) NOT NULL,
  Codigo_Banco FOR CODBCO CHAR(20) NOT NULL WITH DEFAULT ' ',
  Codigo_Sucursal FOR CODSUC CHAR(20) NOT NULL WITH DEFAULT ' ',
  Codigo_Moneda FOR CODMON CHAR(5) NOT NULL WITH DEFAULT 'USD',
  Tipo_Cuenta FOR TIPCTA CHAR(10) NOT NULL WITH DEFAULT ' ',
  Saldo_Actual FOR SALDO DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Saldo_Disponible FOR SALDISP DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Saldo_Bloqueado FOR SALBLOQ DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Fecha_Apertura FOR FEAPERT DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Fecha_Cierre FOR FECIER DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Estado_Cuenta FOR ESTCTA CHAR(1) NOT NULL WITH DEFAULT 'A',
  Numero_Cheques FOR NUMCH INT NOT NULL WITH DEFAULT 0,
  Tasa_Interes FOR TAINT DECIMAL(5,2) NOT NULL WITH DEFAULT 0,
  Usuario_Creacion FOR USRC CHAR(30) NOT NULL WITH DEFAULT USER,
  Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL WITH DEFAULT USER,
  Version_Registro FOR VREC INT NOT NULL WITH DEFAULT 1,
  Observaciones FOR OBS CHAR(120) NOT NULL WITH DEFAULT ' ',
  Estado_Registro FOR ESTRE CHAR(1) NOT NULL WITH DEFAULT 'A',
  Created_At FOR CREAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Updated_At FOR UPDAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID_Cuenta),
  FOREIGN KEY (ID_Cliente) REFERENCES OTENAS1.CUMST (ID_Cliente)
);

LABEL ON TABLE OTENAS1.ACMST IS 'Archivo Maestro de Cuentas de Detalle';

LABEL ON COLUMN OTENAS1.ACMST (
  ID_Cuenta IS 'ID Único de la Cuenta',
  Numero_Cuenta IS 'Número de Cuenta',
  ID_Cliente IS 'ID del Cliente Propietario',
  Codigo_Banco IS 'Código del Banco',
  Codigo_Sucursal IS 'Código de la Sucursal',
  Codigo_Moneda IS 'Código de la Moneda',
  Tipo_Cuenta IS 'Tipo de Cuenta',
  Saldo_Actual IS 'Saldo Actual de la Cuenta',
  Saldo_Disponible IS 'Saldo Disponible',
  Saldo_Bloqueado IS 'Saldo Bloqueado',
  Fecha_Apertura IS 'Fecha de Apertura de la Cuenta',
  Fecha_Cierre IS 'Fecha de Cierre de la Cuenta',
  Estado_Cuenta IS 'Estado de la Cuenta',
  Numero_Cheques IS 'Número de Cheques Emitidos',
  Tasa_Interes IS 'Tasa de Interés Aplicable',
  Usuario_Creacion IS 'Usuario que Creó el Registro',
  Usuario_Actualizacion IS 'Usuario que Actualizó el Registro',
  Version_Registro IS 'Versión del Registro',
  Observaciones IS 'Observaciones',
  Estado_Registro IS 'Estado del Registro',
  Created_At IS 'Fecha y Hora de Creación',
  Updated_At IS 'Fecha y Hora de Actualización'
);

COMMENT ON TABLE OTENAS1.ACMST IS 'Archivo Maestro de Cuentas de Detalle. Contiene la información de todas las cuentas de depósito de los clientes.';

COMMENT ON COLUMN OTENAS1.ACMST.ID_Cuenta IS 'Identificador único de la cuenta en el sistema.';
COMMENT ON COLUMN OTENAS1.ACMST.Numero_Cuenta IS 'Número de cuenta único del banco.';
COMMENT ON COLUMN OTENAS1.ACMST.ID_Cliente IS 'Identificador del cliente propietario de la cuenta.';
COMMENT ON COLUMN OTENAS1.ACMST.Codigo_Banco IS 'Código que identifica el banco.';
COMMENT ON COLUMN OTENAS1.ACMST.Codigo_Sucursal IS 'Código que identifica la sucursal donde se abrió la cuenta.';
COMMENT ON COLUMN OTENAS1.ACMST.Codigo_Moneda IS 'Código de moneda de la cuenta: USD, COP, EUR, etc.';
COMMENT ON COLUMN OTENAS1.ACMST.Tipo_Cuenta IS 'Tipo de cuenta: Corriente, Ahorros, etc.';
COMMENT ON COLUMN OTENAS1.ACMST.Saldo_Actual IS 'Saldo actual contable de la cuenta.';
COMMENT ON COLUMN OTENAS1.ACMST.Saldo_Disponible IS 'Saldo disponible para transacciones.';
COMMENT ON COLUMN OTENAS1.ACMST.Saldo_Bloqueado IS 'Saldo que no se puede utilizar.';
COMMENT ON COLUMN OTENAS1.ACMST.Fecha_Apertura IS 'Fecha en que se abrió la cuenta.';
COMMENT ON COLUMN OTENAS1.ACMST.Fecha_Cierre IS 'Fecha en que se cerró la cuenta.';
COMMENT ON COLUMN OTENAS1.ACMST.Estado_Cuenta IS 'A=Activa, I=Inactiva, C=Cerrada.';
COMMENT ON COLUMN OTENAS1.ACMST.Numero_Cheques IS 'Cantidad de cheques emitidos desde la cuenta.';
COMMENT ON COLUMN OTENAS1.ACMST.Tasa_Interes IS 'Tasa de interés anual aplicable a la cuenta.';
COMMENT ON COLUMN OTENAS1.ACMST.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.ACMST.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.ACMST.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.ACMST.Observaciones IS 'Observaciones o notas adicionales sobre la cuenta.';
COMMENT ON COLUMN OTENAS1.ACMST.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.ACMST.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.ACMST.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXACMST01 ON OTENAS1.ACMST (ID_Cuenta);
CREATE INDEX OTENAS1.IDXACMST02 ON OTENAS1.ACMST (Numero_Cuenta);
CREATE INDEX OTENAS1.IDXACMST03 ON OTENAS1.ACMST (ID_Cliente);
CREATE INDEX OTENAS1.IDXACMST04 ON OTENAS1.ACMST (Codigo_Banco, Codigo_Sucursal);
CREATE INDEX OTENAS1.IDXACMST05 ON OTENAS1.ACMST (Created_At);
