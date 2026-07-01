// ============================================================================
// Programa: RQCON0001
// Proceso : Consolida los resultados de consulta, balance y estado en un resumen.
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
dcl-s wCount        int(10)  inz(0);
dcl-s wMovimientos  int(10)  inz(0);
dcl-s wResumen      varchar(250) inz('');

exec sql set option commit = *none;
exec sql whenever sqlerror continue;
exec sql whenever not found continue;

// -----------------------------------------------------------------------------
// Procedimiento principal
// -----------------------------------------------------------------------------
dcl-proc main;
  // Paso 1: Consultar cuentas procesadas.
  exec sql
    select count(*)
      into :wCount
      from OTENAS1.GLBLN
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda;

  if sqlcod <> 0;
    dsply 'RF-04 ERROR AL CONTAR CUENTAS';
    return;
  endif;

  // Paso 2: Contar movimientos asociados.
  exec sql
    select count(*)
      into :wMovimientos
      from OTENAS1.TRANS
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda
       and cuenta_contable = :wCuenta;

  if sqlcod <> 0;
    dsply 'RF-04 ERROR AL CONTAR MOVIMIENTOS';
    return;
  endif;

  // Paso 3: Crear resumen consolidado.
  wResumen = 'CUENTAS=' concat %char(wCount) concat ' MOVIMIENTOS=' concat %char(wMovimientos);

  // Paso 4: Actualizar el registro con el resumen consolidado.
  exec sql
    update OTENAS1.GLBLN
       set observaciones = :wResumen
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda
       and cuenta_contable = :wCuenta;

  if sqlcod <> 0;
    dsply 'RF-04 ERROR AL GUARDAR RESUMEN';
    return;
  endif;

  // Paso 5: Salida para pruebas.
  dsply wResumen;
  dsply 'RF-04 PROCESO FINALIZADO';
end-proc;
