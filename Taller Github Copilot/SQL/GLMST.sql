-- ============================================================================
-- TABLA: GLMST
-- DESCRIPCIÓN: Maestro de Cuentas Contables
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.GLMST (
  ID_Cuenta_Contable FOR IDCTAC CHAR(30) NOT NULL,
  Codigo_Banco FOR CODBCO CHAR(20) NOT NULL,
  Codigo_Moneda FOR CODMON CHAR(5) NOT NULL WITH DEFAULT 'USD',
  Cuenta_Contable FOR CTAC CHAR(24) NOT NULL,
  Nombre_Cuenta FOR NOMCTA CHAR(150) NOT NULL WITH DEFAULT ' ',
  Tipo_Cuenta FOR TIPCTA CHAR(20) NOT NULL WITH DEFAULT ' ',
  Clase_Cuenta FOR CLACTA CHAR(20) NOT NULL WITH DEFAULT ' ',
  Nivel_Cuenta FOR NIVCTA INT NOT NULL WITH DEFAULT 0,
  Saldo_Actual FOR SALDO DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Saldo_Inicial FOR SALINI DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Centro_Costo FOR CTOCTO CHAR(20) NOT NULL WITH DEFAULT ' ',
  Estado_Cuenta FOR ESTCTA CHAR(1) NOT NULL WITH DEFAULT 'A',
  Permite_Movimiento FOR PERMMOV CHAR(1) NOT NULL WITH DEFAULT 'S',
  Requiere_Referencia FOR REQREF CHAR(1) NOT NULL WITH DEFAULT 'N',
  Usuario_Creacion FOR USRC CHAR(30) NOT NULL WITH DEFAULT USER,
  Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL WITH DEFAULT USER,
  Version_Registro FOR VREC INT NOT NULL WITH DEFAULT 1,
  Observaciones FOR OBS CHAR(120) NOT NULL WITH DEFAULT ' ',
  Estado_Registro FOR ESTRE CHAR(1) NOT NULL WITH DEFAULT 'A',
  Created_At FOR CREAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Updated_At FOR UPDAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID_Cuenta_Contable)
);

LABEL ON TABLE OTENAS1.GLMST IS 'Maestro de Cuentas Contables';

LABEL ON COLUMN OTENAS1.GLMST (
  ID_Cuenta_Contable IS 'ID Único de la Cuenta Contable',
  Codigo_Banco IS 'Código del Banco',
  Codigo_Moneda IS 'Código de la Moneda',
  Cuenta_Contable IS 'Número de Cuenta Contable',
  Nombre_Cuenta IS 'Nombre de la Cuenta Contable',
  Tipo_Cuenta IS 'Tipo de Cuenta Contable',
  Clase_Cuenta IS 'Clase de Cuenta',
  Nivel_Cuenta IS 'Nivel Jerárquico de la Cuenta',
  Saldo_Actual IS 'Saldo Actual',
  Saldo_Inicial IS 'Saldo Inicial del Período',
  Centro_Costo IS 'Centro de Costo Asignado',
  Estado_Cuenta IS 'Estado de la Cuenta',
  Permite_Movimiento IS 'Permite Movimientos',
  Requiere_Referencia IS 'Requiere Referencia',
  Usuario_Creacion IS 'Usuario que Creó el Registro',
  Usuario_Actualizacion IS 'Usuario que Actualizó el Registro',
  Version_Registro IS 'Versión del Registro',
  Observaciones IS 'Observaciones',
  Estado_Registro IS 'Estado del Registro',
  Created_At IS 'Fecha y Hora de Creación',
  Updated_At IS 'Fecha y Hora de Actualización'
);

COMMENT ON TABLE OTENAS1.GLMST IS 'Maestro de Cuentas Contables. Contiene el catálogo de cuentas contables del banco.';

COMMENT ON COLUMN OTENAS1.GLMST.ID_Cuenta_Contable IS 'Identificador único de la cuenta contable en el sistema.';
COMMENT ON COLUMN OTENAS1.GLMST.Codigo_Banco IS 'Código que identifica el banco.';
COMMENT ON COLUMN OTENAS1.GLMST.Codigo_Moneda IS 'Código de moneda en la que se mantiene la cuenta.';
COMMENT ON COLUMN OTENAS1.GLMST.Cuenta_Contable IS 'Número de cuenta contable usado en asientos.';
COMMENT ON COLUMN OTENAS1.GLMST.Nombre_Cuenta IS 'Nombre descriptivo de la cuenta contable.';
COMMENT ON COLUMN OTENAS1.GLMST.Tipo_Cuenta IS 'Tipo: Activo, Pasivo, Patrimonio, Ingresos, Gastos.';
COMMENT ON COLUMN OTENAS1.GLMST.Clase_Cuenta IS 'Clase detallada de la cuenta.';
COMMENT ON COLUMN OTENAS1.GLMST.Nivel_Cuenta IS 'Nivel en la estructura jerárquica de cuentas.';
COMMENT ON COLUMN OTENAS1.GLMST.Saldo_Actual IS 'Saldo actual contable de la cuenta.';
COMMENT ON COLUMN OTENAS1.GLMST.Saldo_Inicial IS 'Saldo con el que comenzó el período.';
COMMENT ON COLUMN OTENAS1.GLMST.Centro_Costo IS 'Centro de costo al cual se asigna.';
COMMENT ON COLUMN OTENAS1.GLMST.Estado_Cuenta IS 'A=Activa, I=Inactiva, C=Cerrada.';
COMMENT ON COLUMN OTENAS1.GLMST.Permite_Movimiento IS 'S=Sí permite movimientos, N=No permite.';
COMMENT ON COLUMN OTENAS1.GLMST.Requiere_Referencia IS 'S=Requiere referencia en asientos, N=No.';
COMMENT ON COLUMN OTENAS1.GLMST.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.GLMST.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.GLMST.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.GLMST.Observaciones IS 'Observaciones o notas adicionales sobre la cuenta.';
COMMENT ON COLUMN OTENAS1.GLMST.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.GLMST.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.GLMST.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXGLMST01 ON OTENAS1.GLMST (ID_Cuenta_Contable);
CREATE INDEX OTENAS1.IDXGLMST02 ON OTENAS1.GLMST (Codigo_Banco, Codigo_Moneda, Cuenta_Contable);
CREATE INDEX OTENAS1.IDXGLMST03 ON OTENAS1.GLMST (Tipo_Cuenta);
CREATE INDEX OTENAS1.IDXGLMST04 ON OTENAS1.GLMST (Centro_Costo);
CREATE INDEX OTENAS1.IDXGLMST05 ON OTENAS1.GLMST (Created_At);
