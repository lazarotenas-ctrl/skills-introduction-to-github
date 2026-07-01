# Programas SQLRPGLE generados para OTENAS1/QROGKESRC

## Archivos creados
- RQCONS001.sqlrpgle
- RQBAL0001.sqlrpgle
- RQEST0001.sqlrpgle
- RQCON0001.sqlrpgle
- RQJSON001.sqlrpgle
- RQIFS0001.sqlrpgle
- RQLOG0001.sqlrpgle
- RQERR0001.sqlrpgle

## Objetivo
Estos miembros contienen programas SQLRPGLE en formato libre con:
- SQL embebido para lectura y actualización
- manejo de errores mediante SQLCODE y WHENEVER
- comentarios por sección
- salidas con DSPLY para pruebas
- lógica de negocio alineada a los requerimientos del taller

## Transferencia a IBM i
En AS/400 o ACS puede copiarse cada miembro al archivo fuente físico:
- Biblioteca: OTENAS1
- Archivo: QROGKESRC

Ejemplo de carga desde el sistema local:
```sh
CPYFRMSTMF FROMSTMF('/ruta/al/archivo.sqlrpgle')
           TOMBRFILE(OTENAS1/QROGKESRC)
           TOMBR(RF01_CONSULTA_CUENTAS)
```

## Compilación sugerida
```cl
CRTBNDRPG PGM(OTENAS1/RF01_CONSULTA_CUENTAS) SRCFILE(OTENAS1/QROGKESRC) SRCMBR(RF01_CONSULTA_CUENTAS)
```
