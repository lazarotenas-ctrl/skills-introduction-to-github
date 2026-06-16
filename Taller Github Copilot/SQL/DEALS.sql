-- ============================================================================
-- TABLA: DEALS
-- DESCRIPCIÓN: Maestro de Préstamos, Certificados, Giros, Valores al Cobro, Inversiones
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.DEALS (
  ID_Prestamo FOR IDPRES CHAR(30) NOT NULL,
  Numero_Prestamo FOR NUMPRES CHAR(20) NOT NULL WITH DEFAULT ' ',
  ID_Cliente FOR IDCLI CHAR(30) NOT NULL,
  Codigo_Banco FOR CODBCO CHAR(20) NOT NULL WITH DEFAULT ' ',
  Codigo_Sucursal FOR CODSUC CHAR(20) NOT NULL WITH DEFAULT ' ',
  Codigo_Moneda FOR CODMON CHAR(5) NOT NULL WITH DEFAULT 'USD',
  Tipo_Operacion FOR TIPOP CHAR(20) NOT NULL WITH DEFAULT ' ',
  Monto_Aprobado FOR MONAP DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Monto_Desembolsado FOR MONDESE DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Saldo_Deudor FOR SALDEU DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Tasa_Interes FOR TAINT DECIMAL(5,2) NOT NULL WITH DEFAULT 0,
  Plazo_Meses FOR PLAZO INT NOT NULL WITH DEFAULT 0,
  Fecha_Desembolso FOR FEDESEML DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Fecha_Vencimiento FOR FEVENC DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Fecha_Proximo_Pago FOR FEPAGO DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Estado_Operacion FOR ESTOP CHAR(1) NOT NULL WITH DEFAULT 'A',
  Tipo_Garantia FOR TIPGAR CHAR(20) NOT NULL WITH DEFAULT ' ',
  Monto_Garantia FOR MONGAR DECIMAL(18,2) NOT NULL WITH DEFAULT 0,
  Usuario_Creacion FOR USRC CHAR(30) NOT NULL WITH DEFAULT USER,
  Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL WITH DEFAULT USER,
  Version_Registro FOR VREC INT NOT NULL WITH DEFAULT 1,
  Observaciones FOR OBS CHAR(120) NOT NULL WITH DEFAULT ' ',
  Estado_Registro FOR ESTRE CHAR(1) NOT NULL WITH DEFAULT 'A',
  Created_At FOR CREAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Updated_At FOR UPDAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID_Prestamo),
  FOREIGN KEY (ID_Cliente) REFERENCES OTENAS1.CUMST (ID_Cliente)
);

LABEL ON TABLE OTENAS1.DEALS IS 'Maestro de Préstamos, Certificados, Giros, Valores al Cobro';

LABEL ON COLUMN OTENAS1.DEALS (
  ID_Prestamo IS 'ID Único del Préstamo',
  Numero_Prestamo IS 'Número de Préstamo',
  ID_Cliente IS 'ID del Cliente',
  Codigo_Banco IS 'Código del Banco',
  Codigo_Sucursal IS 'Código de la Sucursal',
  Codigo_Moneda IS 'Código de la Moneda',
  Tipo_Operacion IS 'Tipo de Operación',
  Monto_Aprobado IS 'Monto Aprobado',
  Monto_Desembolsado IS 'Monto Desembolsado',
  Saldo_Deudor IS 'Saldo Deudor',
  Tasa_Interes IS 'Tasa de Interés',
  Plazo_Meses IS 'Plazo en Meses',
  Fecha_Desembolso IS 'Fecha de Desembolso',
  Fecha_Vencimiento IS 'Fecha de Vencimiento',
  Fecha_Proximo_Pago IS 'Fecha del Próximo Pago',
  Estado_Operacion IS 'Estado de la Operación',
  Tipo_Garantia IS 'Tipo de Garantía',
  Monto_Garantia IS 'Monto de la Garantía',
  Usuario_Creacion IS 'Usuario que Creó el Registro',
  Usuario_Actualizacion IS 'Usuario que Actualizó el Registro',
  Version_Registro IS 'Versión del Registro',
  Observaciones IS 'Observaciones',
  Estado_Registro IS 'Estado del Registro',
  Created_At IS 'Fecha y Hora de Creación',
  Updated_At IS 'Fecha y Hora de Actualización'
);

COMMENT ON TABLE OTENAS1.DEALS IS 'Maestro de Préstamos, Certificados, Giros, Valores al Cobro. Contiene información de todas las operaciones crediticias del banco.';

COMMENT ON COLUMN OTENAS1.DEALS.ID_Prestamo IS 'Identificador único del préstamo en el sistema.';
COMMENT ON COLUMN OTENAS1.DEALS.Numero_Prestamo IS 'Número de préstamo asignado.';
COMMENT ON COLUMN OTENAS1.DEALS.ID_Cliente IS 'Identificador del cliente acreedor.';
COMMENT ON COLUMN OTENAS1.DEALS.Codigo_Banco IS 'Código del banco originador.';
COMMENT ON COLUMN OTENAS1.DEALS.Codigo_Sucursal IS 'Código de la sucursal originadora.';
COMMENT ON COLUMN OTENAS1.DEALS.Codigo_Moneda IS 'Moneda en que se otorgó el crédito.';
COMMENT ON COLUMN OTENAS1.DEALS.Tipo_Operacion IS 'Préstamo, Certificado, Giro, etc.';
COMMENT ON COLUMN OTENAS1.DEALS.Monto_Aprobado IS 'Monto aprobado para la operación.';
COMMENT ON COLUMN OTENAS1.DEALS.Monto_Desembolsado IS 'Monto efectivamente entregado.';
COMMENT ON COLUMN OTENAS1.DEALS.Saldo_Deudor IS 'Saldo pendiente de pago.';
COMMENT ON COLUMN OTENAS1.DEALS.Tasa_Interes IS 'Tasa de interés anual pactada.';
COMMENT ON COLUMN OTENAS1.DEALS.Plazo_Meses IS 'Plazo total del préstamo en meses.';
COMMENT ON COLUMN OTENAS1.DEALS.Fecha_Desembolso IS 'Fecha en que se desembolsó el préstamo.';
COMMENT ON COLUMN OTENAS1.DEALS.Fecha_Vencimiento IS 'Fecha de vencimiento final del préstamo.';
COMMENT ON COLUMN OTENAS1.DEALS.Fecha_Proximo_Pago IS 'Fecha del próximo pago esperado.';
COMMENT ON COLUMN OTENAS1.DEALS.Estado_Operacion IS 'A=Activo, V=Vencido, C=Cancelado, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.DEALS.Tipo_Garantia IS 'Tipo de garantía: Hipotecaria, Prendaria, etc.';
COMMENT ON COLUMN OTENAS1.DEALS.Monto_Garantia IS 'Valor de la garantía.';
COMMENT ON COLUMN OTENAS1.DEALS.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.DEALS.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.DEALS.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.DEALS.Observaciones IS 'Observaciones o notas adicionales sobre la operación.';
COMMENT ON COLUMN OTENAS1.DEALS.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.DEALS.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.DEALS.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXDEALS01 ON OTENAS1.DEALS (ID_Prestamo);
CREATE INDEX OTENAS1.IDXDEALS02 ON OTENAS1.DEALS (Numero_Prestamo);
CREATE INDEX OTENAS1.IDXDEALS03 ON OTENAS1.DEALS (ID_Cliente);
CREATE INDEX OTENAS1.IDXDEALS04 ON OTENAS1.DEALS (Codigo_Banco, Codigo_Sucursal);
CREATE INDEX OTENAS1.IDXDEALS05 ON OTENAS1.DEALS (Estado_Operacion);
CREATE INDEX OTENAS1.IDXDEALS06 ON OTENAS1.DEALS (Fecha_Vencimiento);
CREATE INDEX OTENAS1.IDXDEALS07 ON OTENAS1.DEALS (Created_At);
