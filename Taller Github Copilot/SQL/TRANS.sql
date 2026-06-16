-- ============================================================================
-- TABLA: TRANS
-- DESCRIPCIÓN: Archivo histórico de transacciones
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.TRANS (
  ID_Transaccion FOR IDTRAN BIGINT NOT NULL,
  Numero_Registro_Relativo FOR NUMREG CHAR(30) NOT NULL WITH DEFAULT ' ',
  Codigo_Banco FOR CODBCO CHAR(20) NOT NULL WITH DEFAULT ' ',
  Codigo_Sucursal FOR CODSUC CHAR(20) NOT NULL WITH DEFAULT ' ',
  Codigo_Moneda FOR CODMON CHAR(5) NOT NULL WITH DEFAULT 'USD',
  Cuenta_Contable FOR CTAC CHAR(24) NOT NULL WITH DEFAULT ' ',
  Numero_Cuenta FOR NUMCTA CHAR(24) NOT NULL WITH DEFAULT ' ',
  ID_Cliente FOR IDCLI CHAR(30) NOT NULL WITH DEFAULT ' ',
  Fecha_Operacion FOR FEAOP DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Fecha_Valor FOR FEAVAL DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Hora_Operacion FOR HOROP TIME NOT NULL WITH DEFAULT CURRENT_TIME,
  Tipo_Movimiento FOR TIPMOV CHAR(20) NOT NULL WITH DEFAULT ' ',
  Debito_Credito FOR DEBCRE CHAR(1) NOT NULL WITH DEFAULT 'D',
  Monto FOR MONTO DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Saldo_Anterior FOR SALANT DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Saldo_Posterior FOR SALPOST DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Canal_Origen FOR CANORG CHAR(20) NOT NULL WITH DEFAULT ' ',
  Terminal_Origen FOR TERMOR CHAR(30) NOT NULL WITH DEFAULT ' ',
  Referencia_Externa FOR REFEXT CHAR(40) NOT NULL WITH DEFAULT ' ',
  Estado_Transaccion FOR ESTTRAN CHAR(20) NOT NULL WITH DEFAULT 'COMPLETA',
  Usuario_Creacion FOR USRC CHAR(30) NOT NULL WITH DEFAULT USER,
  Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL WITH DEFAULT USER,
  Version_Registro FOR VREC INT NOT NULL WITH DEFAULT 1,
  Observaciones FOR OBS CHAR(120) NOT NULL WITH DEFAULT ' ',
  Estado_Registro FOR ESTRE CHAR(1) NOT NULL WITH DEFAULT 'A',
  Created_At FOR CREAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Updated_At FOR UPDAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID_Transaccion)
);

LABEL ON TABLE OTENAS1.TRANS IS 'Archivo histórico de transacciones';

LABEL ON COLUMN OTENAS1.TRANS (
  ID_Transaccion IS 'ID Único de la Transacción',
  Numero_Registro_Relativo IS 'Número de Registro Relativo',
  Codigo_Banco IS 'Código del Banco',
  Codigo_Sucursal IS 'Código de la Sucursal',
  Codigo_Moneda IS 'Código de la Moneda',
  Cuenta_Contable IS 'Número de Cuenta Contable',
  Numero_Cuenta IS 'Número de Cuenta',
  ID_Cliente IS 'ID del Cliente',
  Fecha_Operacion IS 'Fecha de la Operación',
  Fecha_Valor IS 'Fecha de Valor',
  Hora_Operacion IS 'Hora de la Operación',
  Tipo_Movimiento IS 'Tipo de Movimiento',
  Debito_Credito IS 'Débito o Crédito',
  Monto IS 'Monto de la Transacción',
  Saldo_Anterior IS 'Saldo Anterior',
  Saldo_Posterior IS 'Saldo Posterior',
  Canal_Origen IS 'Canal de Origen',
  Terminal_Origen IS 'Terminal de Origen',
  Referencia_Externa IS 'Referencia Externa',
  Estado_Transaccion IS 'Estado de la Transacción',
  Usuario_Creacion IS 'Usuario que Creó el Registro',
  Usuario_Actualizacion IS 'Usuario que Actualizó el Registro',
  Version_Registro IS 'Versión del Registro',
  Observaciones IS 'Observaciones',
  Estado_Registro IS 'Estado del Registro',
  Created_At IS 'Fecha y Hora de Creación',
  Updated_At IS 'Fecha y Hora de Actualización'
);

COMMENT ON TABLE OTENAS1.TRANS IS 'Archivo histórico de transacciones. Mantiene el registro de todas las transacciones ejecutadas en el sistema.';

COMMENT ON COLUMN OTENAS1.TRANS.ID_Transaccion IS 'Identificador único de la transacción.';
COMMENT ON COLUMN OTENAS1.TRANS.Numero_Registro_Relativo IS 'Número relativo del registro en la transacción.';
COMMENT ON COLUMN OTENAS1.TRANS.Codigo_Banco IS 'Código que identifica el banco.';
COMMENT ON COLUMN OTENAS1.TRANS.Codigo_Sucursal IS 'Código que identifica la sucursal.';
COMMENT ON COLUMN OTENAS1.TRANS.Codigo_Moneda IS 'Código de moneda de la transacción.';
COMMENT ON COLUMN OTENAS1.TRANS.Cuenta_Contable IS 'Cuenta contable afectada por la transacción.';
COMMENT ON COLUMN OTENAS1.TRANS.Numero_Cuenta IS 'Número de cuenta de cliente afectado.';
COMMENT ON COLUMN OTENAS1.TRANS.ID_Cliente IS 'Identificador del cliente involucrado.';
COMMENT ON COLUMN OTENAS1.TRANS.Fecha_Operacion IS 'Fecha en que se ejecutó la operación.';
COMMENT ON COLUMN OTENAS1.TRANS.Fecha_Valor IS 'Fecha de valor contable de la transacción.';
COMMENT ON COLUMN OTENAS1.TRANS.Hora_Operacion IS 'Hora exacta de ejecución de la operación.';
COMMENT ON COLUMN OTENAS1.TRANS.Tipo_Movimiento IS 'Tipo de movimiento: Depósito, Retiro, Transferencia, etc.';
COMMENT ON COLUMN OTENAS1.TRANS.Debito_Credito IS 'D=Débito, C=Crédito.';
COMMENT ON COLUMN OTENAS1.TRANS.Monto IS 'Monto transado en la operación.';
COMMENT ON COLUMN OTENAS1.TRANS.Saldo_Anterior IS 'Saldo previo a la transacción.';
COMMENT ON COLUMN OTENAS1.TRANS.Saldo_Posterior IS 'Saldo posterior a la transacción.';
COMMENT ON COLUMN OTENAS1.TRANS.Canal_Origen IS 'Canal por el cual se ejecutó: Cajero, ATM, Banca Electrónica, etc.';
COMMENT ON COLUMN OTENAS1.TRANS.Terminal_Origen IS 'Terminal de origen de la operación.';
COMMENT ON COLUMN OTENAS1.TRANS.Referencia_Externa IS 'Referencia externa o correlativo de la operación.';
COMMENT ON COLUMN OTENAS1.TRANS.Estado_Transaccion IS 'Estado: COMPLETA, PENDIENTE, RECHAZADA.';
COMMENT ON COLUMN OTENAS1.TRANS.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.TRANS.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.TRANS.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.TRANS.Observaciones IS 'Observaciones o notas adicionales sobre la transacción.';
COMMENT ON COLUMN OTENAS1.TRANS.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.TRANS.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.TRANS.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXTRANS01 ON OTENAS1.TRANS (ID_Transaccion);
CREATE INDEX OTENAS1.IDXTRANS02 ON OTENAS1.TRANS (Numero_Registro_Relativo);
CREATE INDEX OTENAS1.IDXTRANS03 ON OTENAS1.TRANS (Numero_Cuenta, Fecha_Operacion);
CREATE INDEX OTENAS1.IDXTRANS04 ON OTENAS1.TRANS (Cuenta_Contable, Fecha_Operacion);
CREATE INDEX OTENAS1.IDXTRANS05 ON OTENAS1.TRANS (ID_Cliente, Fecha_Operacion);
CREATE INDEX OTENAS1.IDXTRANS06 ON OTENAS1.TRANS (Fecha_Operacion);
CREATE INDEX OTENAS1.IDXTRANS07 ON OTENAS1.TRANS (Created_At);
