// ============================================================================
// Programa: RQERR0001
// Proceso : Demuestra captura de errores y manejo de SQLCODE/WHENEVER.
// Biblioteca destino: OTENAS1
// Archivo fuente: QROGKESRC
// ============================================================================

ctl-opt dftactgrp(*no) actgrp(*new) main(main);

// -----------------------------------------------------------------------------
// Variables de trabajo
// -----------------------------------------------------------------------------
dcl-s wCuenta       char(24) inz('99999999');
dcl-s wSaldo        dec(18:2) inz(0);
dcl-s wMensaje      varchar(100) inz('');

exec sql set option commit = *none;
exec sql whenever sqlerror continue;
exec sql whenever not found continue;

// -----------------------------------------------------------------------------
// Procedimiento principal
// -----------------------------------------------------------------------------
dcl-proc main;
  // Paso 1: Intentar leer una cuenta inexistente para provocar error/control.
  exec sql
    select saldo_actual
      into :wSaldo
      from OTENAS1.GLBLN
     where cuenta_contable = :wCuenta;

  if sqlcod < 0;
    dsply 'RF-08 ERROR SQL DETECTADO';
    dsply %char(sqlcod);
    return;
  elseif sqlcod = 100;
    dsply 'RF-08 REGISTRO NO ENCONTRADO';
    return;
  endif;

  // Paso 2: Salida para pruebas.
  dsply ('RF-08 SALDO LEIDO: ' concat %char(wSaldo));
  dsply 'RF-08 PROCESO FINALIZADO';
end-proc;
