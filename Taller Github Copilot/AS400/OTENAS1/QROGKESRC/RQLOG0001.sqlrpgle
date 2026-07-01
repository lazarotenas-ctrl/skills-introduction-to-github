// ============================================================================
// Programa: RQLOG0001
// Proceso : Registra inicio, fin, totales y resultados de la ejecución.
// Biblioteca destino: OTENAS1
// Archivo fuente: QROGKESRC
// ============================================================================

ctl-opt dftactgrp(*no) actgrp(*new) main(main);

// -----------------------------------------------------------------------------
// Variables de trabajo
// -----------------------------------------------------------------------------
dcl-s wInicio      timestamp inz(*sys); 
dcl-s wFin         timestamp inz(*sys);
dcl-s wTotal       int(10) inz(0);
dcl-s wEstado      char(20) inz('FINALIZADO');

exec sql set option commit = *none;
exec sql whenever sqlerror continue;
exec sql whenever not found continue;

// -----------------------------------------------------------------------------
// Procedimiento principal
// -----------------------------------------------------------------------------
dcl-proc main;
  // Paso 1: Registrar inicio de ejecución.
  wInicio = current_timestamp;
  dsply 'RF-07 INICIO DE TRAZABILIDAD';

  // Paso 2: Obtener total de registros procesados.
  exec sql
    select count(*)
      into :wTotal
      from OTENAS1.GLBLN;

  if sqlcod <> 0;
    wEstado = 'ERROR';
    dsply 'RF-07 ERROR AL LEER TOTAL';
    return;
  endif;

  // Paso 3: Cerrar la trazabilidad con estado final.
  wFin = current_timestamp;
  dsply ('RF-07 TOTAL PROCESADAS: ' concat %char(wTotal));
  dsply 'RF-07 PROCESO FINALIZADO';
end-proc;
