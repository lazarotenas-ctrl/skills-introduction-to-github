// ============================================================================
// Programa: RQJSON001
// Proceso : Genera un payload JSON mínimo para una cuenta mayor.
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
dcl-s wJson         varchar(500) inz('');

exec sql set option commit = *none;
exec sql whenever sqlerror continue;
exec sql whenever not found continue;

// -----------------------------------------------------------------------------
// Procedimiento principal
// -----------------------------------------------------------------------------
dcl-proc main;
  // Paso 1: Obtener saldo y estado para construir el JSON.
  exec sql
    select saldo_actual
      into :wSaldoActual
      from OTENAS1.GLBLN
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda
       and cuenta_contable = :wCuenta;

  if sqlcod <> 0;
    dsply 'RF-05 ERROR AL LEER DATOS';
    return;
  endif;

  if wSaldoActual > 0;
    wEstado = 'POSITIVO';
  elseif wSaldoActual < 0;
    wEstado = 'NEGATIVO';
  else;
    wEstado = 'CERO';
  endif;

  // Paso 2: Crear texto JSON de salida.
  wJson = '{"cuenta":"' concat wCuenta concat '","saldo":' concat %char(wSaldoActual)
          concat ',"estado":"' concat wEstado concat '"}';

  // Paso 3: Marcar la cuenta como preparada para la publicación JSON.
  exec sql
    update OTENAS1.GLBLN
       set observaciones = 'RF-05 JSON GENERADO'
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda
       and cuenta_contable = :wCuenta;

  if sqlcod <> 0;
    dsply 'RF-05 ERROR AL REGISTRAR JSON';
    return;
  endif;

  // Paso 4: Salida para pruebas.
  dsply wJson;
  dsply 'RF-05 PROCESO FINALIZADO';
end-proc;
