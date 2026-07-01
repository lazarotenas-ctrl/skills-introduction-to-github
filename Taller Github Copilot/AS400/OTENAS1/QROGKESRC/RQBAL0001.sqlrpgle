// ============================================================================
// Programa: RQBAL0001
// Proceso : Calcula el balance por cuenta mayor a partir de transacciones.
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
dcl-s wSaldoInicial dec(18:2) inz(120000.00);
dcl-s wDebitos      dec(18:2) inz(0);
dcl-s wCreditos     dec(18:2) inz(0);
dcl-s wBalance      dec(18:2) inz(0);
dcl-s wMensaje      varchar(100) inz('');

exec sql set option commit = *none;
exec sql whenever sqlerror continue;
exec sql whenever not found continue;

// -----------------------------------------------------------------------------
// Procedimiento principal
// -----------------------------------------------------------------------------
dcl-proc main;
  // Paso 1: Sumar débitos y créditos para la cuenta contable.
  exec sql
    select coalesce(sum(case when debito_credito = 'D' then monto else 0 end),0),
           coalesce(sum(case when debito_credito = 'C' then monto else 0 end),0)
      into :wDebitos, :wCreditos
      from OTENAS1.TRANS
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda
       and cuenta_contable = :wCuenta;

  if sqlcod <> 0;
    dsply 'RF-02 ERROR AL CALCULAR MOVIMIENTOS';
    return;
  endif;

  // Paso 2: Calcular balance final.
  wBalance = wSaldoInicial + wDebitos - wCreditos;

  // Paso 3: Actualizar el saldo en GLBLN.
  exec sql
    update OTENAS1.GLBLN
       set saldo_actual = :wBalance,
           observaciones = 'RF-02 BALANCE CALCULADO'
     where codigo_banco = :wBanco
       and codigo_sucursal = :wSucursal
       and codigo_moneda = :wMoneda
       and cuenta_contable = :wCuenta;

  if sqlcod <> 0;
    dsply 'RF-02 ERROR AL ACTUALIZAR BALANCE';
    return;
  endif;

  // Paso 4: Salida para pruebas.
  dsply ('RF-02 BALANCE CALCULADO: ' concat %char(wBalance));
  dsply 'RF-02 PROCESO FINALIZADO';
end-proc;
