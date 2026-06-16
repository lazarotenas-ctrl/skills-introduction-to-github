-- ============================================================================
-- TABLA: DLPMT
-- DESCRIPCIÓN: Plan de Pagos
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.DLPMT (
  ID_Plan_Pago FOR IDPLAN CHAR(30) NOT NULL,
  ID_Prestamo FOR IDPRES CHAR(30) NOT NULL,
  Codigo_Banco FOR CODBCO CHAR(20) NOT NULL WITH DEFAULT ' ',
  Codigo_Sucursal FOR CODSUC CHAR(20) NOT NULL WITH DEFAULT ' ',
  Codigo_Moneda FOR CODMON CHAR(5) NOT NULL WITH DEFAULT 'USD',
  Numero_Cuota FOR NUMCUOTA INT NOT NULL WITH DEFAULT 0,
  Fecha_Pago FOR FEPAGO DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Tipo_Registro FOR TIPREG CHAR(20) NOT NULL WITH DEFAULT ' ',
  Monto_Cuota FOR MONCUA DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Monto_Interes FOR MONINT DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Monto_Capital FOR MONCAP DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Monto_Pagado FOR MONPAG DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Saldo_Pendiente FOR SALPEND DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Fecha_Pago_Real FOR FEPREAL DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Estado_Cuota FOR ESTCUOTA CHAR(1) NOT NULL WITH DEFAULT 'P',
  Dias_Atraso FOR DIASAT INT NOT NULL WITH DEFAULT 0,
  Monto_Mora FOR MONMORA DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Referencia_Pago FOR REFPAG CHAR(40) NOT NULL WITH DEFAULT ' ',
  Numero_Comprobante FOR NUMCOMP CHAR(20) NOT NULL WITH DEFAULT ' ',
  Usuario_Creacion FOR USRC CHAR(30) NOT NULL WITH DEFAULT USER,
  Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL WITH DEFAULT USER,
  Version_Registro FOR VREC INT NOT NULL WITH DEFAULT 1,
  Observaciones FOR OBS CHAR(120) NOT NULL WITH DEFAULT ' ',
  Estado_Registro FOR ESTRE CHAR(1) NOT NULL WITH DEFAULT 'A',
  Created_At FOR CREAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Updated_At FOR UPDAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID_Plan_Pago),
  FOREIGN KEY (ID_Prestamo) REFERENCES OTENAS1.DEALS (ID_Prestamo)
);

LABEL ON TABLE OTENAS1.DLPMT IS 'Plan de Pagos';

LABEL ON COLUMN OTENAS1.DLPMT (
  ID_Plan_Pago IS 'ID Único del Plan de Pago',
  ID_Prestamo IS 'ID del Préstamo',
  Codigo_Banco IS 'Código del Banco',
  Codigo_Sucursal IS 'Código de la Sucursal',
  Codigo_Moneda IS 'Código de la Moneda',
  Numero_Cuota IS 'Número de Cuota',
  Fecha_Pago IS 'Fecha Pago Programada',
  Tipo_Registro IS 'Tipo de Registro',
  Monto_Cuota IS 'Monto de la Cuota',
  Monto_Interes IS 'Monto del Interés',
  Monto_Capital IS 'Monto del Capital',
  Monto_Pagado IS 'Monto Pagado',
  Saldo_Pendiente IS 'Saldo Pendiente',
  Fecha_Pago_Real IS 'Fecha Pago Real',
  Estado_Cuota IS 'Estado de la Cuota',
  Dias_Atraso IS 'Días de Atraso',
  Monto_Mora IS 'Monto de Mora',
  Referencia_Pago IS 'Referencia de Pago',
  Numero_Comprobante IS 'Número de Comprobante',
  Usuario_Creacion IS 'Usuario que Creó el Registro',
  Usuario_Actualizacion IS 'Usuario que Actualizó el Registro',
  Version_Registro IS 'Versión del Registro',
  Observaciones IS 'Observaciones',
  Estado_Registro IS 'Estado del Registro',
  Created_At IS 'Fecha y Hora de Creación',
  Updated_At IS 'Fecha y Hora de Actualización'
);

COMMENT ON TABLE OTENAS1.DLPMT IS 'Plan de Pagos. Contiene el cronograma de pagos para cada préstamo o crédito.';

COMMENT ON COLUMN OTENAS1.DLPMT.ID_Plan_Pago IS 'Identificador único del plan de pago en el sistema.';
COMMENT ON COLUMN OTENAS1.DLPMT.ID_Prestamo IS 'Identificador del préstamo asociado.';
COMMENT ON COLUMN OTENAS1.DLPMT.Codigo_Banco IS 'Código que identifica el banco.';
COMMENT ON COLUMN OTENAS1.DLPMT.Codigo_Sucursal IS 'Código que identifica la sucursal.';
COMMENT ON COLUMN OTENAS1.DLPMT.Codigo_Moneda IS 'Código de moneda del plan.';
COMMENT ON COLUMN OTENAS1.DLPMT.Numero_Cuota IS 'Número secuencial de la cuota en el plan.';
COMMENT ON COLUMN OTENAS1.DLPMT.Fecha_Pago IS 'Fecha programada para realizar el pago.';
COMMENT ON COLUMN OTENAS1.DLPMT.Tipo_Registro IS 'Tipo de registro: Cuota regular, Extra, etc.';
COMMENT ON COLUMN OTENAS1.DLPMT.Monto_Cuota IS 'Valor total de la cuota.';
COMMENT ON COLUMN OTENAS1.DLPMT.Monto_Interes IS 'Porción de interés en la cuota.';
COMMENT ON COLUMN OTENAS1.DLPMT.Monto_Capital IS 'Porción de capital en la cuota.';
COMMENT ON COLUMN OTENAS1.DLPMT.Monto_Pagado IS 'Monto efectivamente pagado.';
COMMENT ON COLUMN OTENAS1.DLPMT.Saldo_Pendiente IS 'Saldo aún no pagado de esta cuota.';
COMMENT ON COLUMN OTENAS1.DLPMT.Fecha_Pago_Real IS 'Fecha en que se efectuó el pago.';
COMMENT ON COLUMN OTENAS1.DLPMT.Estado_Cuota IS 'P=Pendiente, P=Pagada, A=Atrasada, C=Cancelada.';
COMMENT ON COLUMN OTENAS1.DLPMT.Dias_Atraso IS 'Número de días de atraso en el pago.';
COMMENT ON COLUMN OTENAS1.DLPMT.Monto_Mora IS 'Monto de mora por atraso.';
COMMENT ON COLUMN OTENAS1.DLPMT.Referencia_Pago IS 'Referencia asociada al pago.';
COMMENT ON COLUMN OTENAS1.DLPMT.Numero_Comprobante IS 'Número de comprobante del pago.';
COMMENT ON COLUMN OTENAS1.DLPMT.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.DLPMT.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.DLPMT.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.DLPMT.Observaciones IS 'Observaciones o notas adicionales sobre el pago.';
COMMENT ON COLUMN OTENAS1.DLPMT.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.DLPMT.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.DLPMT.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXDLPMT01 ON OTENAS1.DLPMT (ID_Plan_Pago);
CREATE INDEX OTENAS1.IDXDLPMT02 ON OTENAS1.DLPMT (ID_Prestamo);
CREATE INDEX OTENAS1.IDXDLPMT03 ON OTENAS1.DLPMT (ID_Prestamo, Numero_Cuota);
CREATE INDEX OTENAS1.IDXDLPMT04 ON OTENAS1.DLPMT (Fecha_Pago);
CREATE INDEX OTENAS1.IDXDLPMT05 ON OTENAS1.DLPMT (Estado_Cuota);
CREATE INDEX OTENAS1.IDXDLPMT06 ON OTENAS1.DLPMT (Codigo_Banco, Codigo_Sucursal);
CREATE INDEX OTENAS1.IDXDLPMT07 ON OTENAS1.DLPMT (Created_At);
