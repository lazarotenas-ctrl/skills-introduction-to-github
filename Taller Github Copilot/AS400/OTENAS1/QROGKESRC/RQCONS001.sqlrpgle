// ============================================================================
// Programa: RQCONS001
// Proceso : Consulta de cuentas mayores desde GLBLN con filtros.
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
dcl-s wDesde        char(24) inz('11000000');
dcl-s wHasta        char(24) inz('11999999');
dcl-s wFechaProceso date     inz(d'2026-06-30');
dcl-s wCount        int(10)  inz(0);
dcl-s wMensaje      varchar(100) inz('');

// -----------------------------------------------------------------------------
// SQLRPGLE: manejo de errores
// -----------------------------------------------------------------------------
exec sql set option commit = *none;
exec sql whenever sqlerror continue;
exec sql whenever not found continue;

// -----------------------------------------------------------------------------
// Procedimiento principal
// -----------------------------------------------------------------------------
dcl-proc main;
  // Paso 1: Consultar cuentas mayores con filtros configurables.
  exec sql
    select count(*)
      into :wCount
      from OTENAS1.GLBLN
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda
       and cuenta_contable between :wDesde and :wHasta
       and fecha_proceso_sistema <= :wFechaProceso;

  if sqlcod <> 0;
    wMensaje = 'RF-01 ERROR EN CONSULTA DE CUENTAS';
    dsply wMensaje;
    return;
  endif;

  // Paso 2: Marcar la ejecución de consulta en la fuente de datos.
  exec sql
    update OTENAS1.GLBLN
       set observaciones = 'RF-01 CONSULTA EJECUTADA'
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda
       and cuenta_contable between :wDesde and :wHasta;

  if sqlcod <> 0;
    dsply 'RF-01 ERROR AL ACTUALIZAR REGISTRO';
    return;
  endif;

  // Paso 3: Salida para pruebas.
  dsply ('RF-01 CUENTAS ENCONTRADAS: ' concat %char(wCount));
  dsply 'RF-01 PROCESO FINALIZADO';
end-proc;
