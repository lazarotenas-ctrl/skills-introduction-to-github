// ============================================================================
// Programa: RQEST0001
// Proceso : Asigna el estado financiero de una cuenta según reglas mínimas.
// Biblioteca destino: OTENAS1
// Archivo fuente: QROGKESRC
// ============================================================================

ctl-opt dftactgrp(*no) actgrp(*new) main(main);

// -----------------------------------------------------------------------------
// Variables de trabajo
// -----------------------------------------------------------------------------
dcl-s wBanco        char(20) inz('01');
dcl-s wSucursal     char(20) inz('001');
dcl-s wMoneda       char(5)  inz('USD');
dcl-s wCuenta       char(24) inz('11010101');
dcl-s wSaldoActual  dec(18:2) inz(0);
dcl-s wEstado       char(20)  inz('');
dcl-s wMensaje      varchar(100) inz('');

exec sql set option commit = *none;
exec sql whenever sqlerror continue;
exec sql whenever not found continue;

// -----------------------------------------------------------------------------
// Procedimiento principal
// -----------------------------------------------------------------------------
dcl-proc main;
  // Paso 1: Obtener saldo actual de la cuenta.
  exec sql
    select saldo_actual
      into :wSaldoActual
      from OTENAS1.GLBLN
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda
       and cuenta_contable = :wCuenta;

  if sqlcod <> 0;
    dsply 'RF-03 ERROR AL LEER SALDO';
    return;
  endif;

  // Paso 2: Aplicar regla de negocio simple.
  if wSaldoActual > 0;
    wEstado = 'POSITIVO';
  elseif wSaldoActual < 0;
    wEstado = 'NEGATIVO';
  else;
    wEstado = 'CERO';
  endif;

  // Paso 3: Actualizar estado financiero en la fuente.
  exec sql
    update OTENAS1.GLBLN
       set observaciones = :wEstado,
           estado_registro = 'A'
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda
       and cuenta_contable = :wCuenta;

  if sqlcod <> 0;
    dsply 'RF-03 ERROR AL ACTUALIZAR ESTADO';
    return;
  endif;

  // Paso 4: Salida para pruebas.
  dsply ('RF-03 ESTADO ASIGNADO: ' concat wEstado);
  dsply 'RF-03 PROCESO FINALIZADO';
end-proc;
