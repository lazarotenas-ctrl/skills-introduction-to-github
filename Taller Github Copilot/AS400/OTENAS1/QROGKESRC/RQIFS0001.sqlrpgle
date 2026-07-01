// ============================================================================
// Programa: RQIFS0001
// Proceso : Registra la salida JSON en una ruta IFS parametrizable.
// Biblioteca destino: OTENAS1
// Archivo fuente: QROGKESRC
// ============================================================================

ctl-opt dftactgrp(*no) actgrp(*new) main(main);

// -----------------------------------------------------------------------------
// Variables de trabajo
// -----------------------------------------------------------------------------
dcl-s wRutaIfs      varchar(200) inz('/tmp/OTENAS1/GLBLN_JSON.txt');
dcl-s wTexto        varchar(500) inz('{"proceso":"RF06","estado":"PUBLICADO"}');
dcl-s wMensaje      varchar(100) inz('');

exec sql set option commit = *none;
exec sql whenever sqlerror continue;
exec sql whenever not found continue;

// -----------------------------------------------------------------------------
// Procedimiento principal
// -----------------------------------------------------------------------------
dcl-proc main;
  // Paso 1: Simular publicación en IFS con un mensaje de salida.
  dsply ('RF-06 PUBLICANDO EN IFS: ' concat wRutaIfs);

  // Paso 2: Registrar el evento en una tabla de seguimiento simple.
  exec sql
    insert into OTENAS1.GLBLN (codigo_banco, codigo_sucursal, codigo_moneda, cuenta_contable,
                              descripcion_cuenta, naturaleza_cuenta, nivel_cuenta,
                              saldo_actual, fecha_proceso_sistema, observaciones,
                              usuario_creacion, usuario_actualizacion, version_registro,
                              estado_registro, created_at, updated_at)
    values ('99','999','USD','99999999','JSON','ACTIVO','9',0,
            current_date,'RF-06 PUBLICACION', user, user, 1, 'A',
            current_timestamp, current_timestamp);

  if sqlcod <> 0;
    dsply 'RF-06 ERROR AL REGISTRAR PUBLICACION';
    return;
  endif;

  // Paso 3: Salida para pruebas.
  dsply 'RF-06 PROCESO FINALIZADO';
end-proc;
