#!/bin/bash
# GUÍA RÁPIDA DE INICIO
# Para generar scripts SQL para AS400 (DB2 for i)
# Autor: Lazaro Tenas | Fecha: 2026-06-15

# ═══════════════════════════════════════════════════════════════════════════════
# 📚 ARCHIVOS DISPONIBLES EN ESTA CARPETA (SQL/)
# ═══════════════════════════════════════════════════════════════════════════════

# 📖 DOCUMENTACIÓN (Lee primero)
# └─ README.md ........................... Guía completa de ejecución
# └─ INDEX.md ............................ Índice visual y referencias
# └─ RESUMEN_PROYECTO.md ................. Resumen ejecutivo del proyecto
# └─ RESUMEN.sql ......................... Resumen técnico detallado
# └─ CHECKLIST_IMPLEMENTACION.md ......... Plan de implementación (12 fases)

# 📝 SCRIPTS SQL (11 tablas)
# └─ CNOFT.sql ........................... Archivo Maestro de Tablas Comunes
# └─ CNOFC.sql ........................... Archivo de Referencias
# └─ CUMST.sql ........................... Maestro de Clientes ⭐ CRÍTICO
# └─ ACMST.sql ........................... Maestro de Cuentas Detalle
# └─ CUMAD.sql ........................... Direcciones y Beneficiarios
# └─ GLMST.sql ........................... Maestro de Cuentas Contables
# └─ TRANS.sql ........................... Histórico de Transacciones
# └─ DEALS.sql ........................... Maestro de Préstamos/Operaciones
# └─ DLPMT.sql ........................... Plan de Pagos
# └─ BAVEN.sql ........................... Maestro de Proveedores
# └─ USERS.sql ........................... Archivo de Autorizaciones

# 💾 CONSULTAS Y EJEMPLOS
# └─ EJEMPLOS_CONSULTAS.sql .............. 40+ consultas útiles

# ═══════════════════════════════════════════════════════════════════════════════
# 🚀 INICIO RÁPIDO
# ═══════════════════════════════════════════════════════════════════════════════

# PASO 1: Lee la documentación
echo "📖 PASO 1: Lee primero..."
echo "   1. Lee: README.md"
echo "   2. Luego: CHECKLIST_IMPLEMENTACION.md"
echo ""

# PASO 2: Prepara el ambiente
echo "🔧 PASO 2: En tu AS400 (iSeries Navigator o ACS)..."
echo "   1. Crear biblioteca:  CRTLIB LIB(OTENAS1)"
echo "   2. Crear QSQLSRC:     CRTSRCPF FILE(OTENAS1/QSQLSRC) RCDLEN(200)"
echo ""

# PASO 3: Ejecuta en orden
echo "📊 PASO 3: Ejecuta estos scripts en ORDEN:"
echo "   1. CNOFT.sql      ✅ (sin dependencias)"
echo "   2. CNOFC.sql      ✅ (sin dependencias)"
echo "   3. GLMST.sql      ✅ (sin dependencias)"
echo "   4. BAVEN.sql      ✅ (sin dependencias)"
echo "   5. USERS.sql      ✅ (sin dependencias)"
echo "   6. CUMST.sql      ⭐ (base de datos de clientes)"
echo "   7. ACMST.sql      ✅ (depende de CUMST)"
echo "   8. CUMAD.sql      ✅ (depende de CUMST)"
echo "   9. DEALS.sql      ✅ (depende de CUMST)"
echo "   10. DLPMT.sql     ✅ (depende de DEALS)"
echo "   11. TRANS.sql     ✅ (último)"
echo ""

# PASO 4: Verifica
echo "✅ PASO 4: Verifica en AS400..."
echo "   SELECT COUNT(*) FROM SYSCAT.TABLES WHERE TABSCHEMA='OTENAS1'"
echo "   (Debe mostrar: 11 tablas)"
echo ""

# PASO 5: Prueba
echo "🧪 PASO 5: Ejecuta EJEMPLOS_CONSULTAS.sql para verificar"
echo ""

# ═══════════════════════════════════════════════════════════════════════════════
# 📚 INFORMACIÓN RÁPIDA
# ═══════════════════════════════════════════════════════════════════════════════

echo "ESTADÍSTICAS:"
echo "  • 11 Tablas SQL"
echo "  • ~270 campos"
echo "  • ~50+ índices"
echo "  • 5 Foreign Keys"
echo "  • 7 campos de auditoría en cada tabla"
echo ""

echo "TABLAS INCLUIDAS:"
echo "  • CNOFT ........... Referencias de datos comunes"
echo "  • CNOFC ........... Archivo de referencias del sistema"
echo "  • CUMST ........... Maestro de clientes (BASE)"
echo "  • ACMST ........... Cuentas de detalle"
echo "  • CUMAD ........... Direcciones y beneficiarios"
echo "  • GLMST ........... Cuentas contables"
echo "  • TRANS ........... Transacciones histórico"
echo "  • DEALS ........... Préstamos/operaciones"
echo "  • DLPMT ........... Plan de pagos"
echo "  • BAVEN ........... Proveedores"
echo "  • USERS ........... Seguridad/autorizaciones"
echo ""

# ═══════════════════════════════════════════════════════════════════════════════
# ⚡ COMANDOS ÚTILES EN AS400
# ═══════════════════════════════════════════════════════════════════════════════

echo "COMANDOS ÚTILES:"
echo ""
echo "Crear biblioteca:"
echo "  CRTLIB LIB(OTENAS1) TEXT('BD Bancaria')"
echo ""
echo "Crear archivo source:"
echo "  CRTSRCPF FILE(OTENAS1/QSQLSRC) RCDLEN(200)"
echo ""
echo "Ejecutar un script:"
echo "  RUNSQLSTM SRCFILE(OTENAS1/QSQLSRC) SRCMBR(CNOFT)"
echo ""
echo "Ver tabla:"
echo "  DSPFFD FILE(OTENAS1/CNOFT)"
echo ""
echo "Contar tablas:"
echo "  SELECT COUNT(*) FROM SYSCAT.TABLES WHERE TABSCHEMA='OTENAS1'"
echo ""

# ═══════════════════════════════════════════════════════════════════════════════
# 🎯 ARCHIVOS IMPORTANTES
# ═══════════════════════════════════════════════════════════════════════════════

echo "📖 DOCUMENTOS CRÍTICOS:"
echo "  1️⃣  README.md ......................... LEER PRIMERO"
echo "  2️⃣  CHECKLIST_IMPLEMENTACION.md ...... SEGUIR DURANTE INSTALACIÓN"
echo "  3️⃣  EJEMPLOS_CONSULTAS.sql .......... PRUEBAS Y VALIDACIÓN"
echo "  4️⃣  RESUMEN.sql ...................... REFERENCIA TÉCNICA"
echo ""

# ═══════════════════════════════════════════════════════════════════════════════
# ⚠️ CONSIDERACIONES IMPORTANTES
# ═══════════════════════════════════════════════════════════════════════════════

echo "⚠️  IMPORTANTE:"
echo "  • CUMST es la tabla BASE - ejecutar ANTES de las demás"
echo "  • DLPMT depende de DEALS"
echo "  • ACMST, CUMAD y DEALS dependen de CUMST"
echo "  • Ver orden correcto en: CHECKLIST_IMPLEMENTACION.md"
echo "  • Todos los scripts usan biblioteca OTENAS1"
echo "  • Todos los scripts crean en archivo QSQLSRC"
echo ""

# ═══════════════════════════════════════════════════════════════════════════════
# 🏁 CHECKLIST RÁPIDO
# ═══════════════════════════════════════════════════════════════════════════════

echo "✅ CHECKLIST RÁPIDO:"
echo "  [ ] Leí README.md"
echo "  [ ] Leí CHECKLIST_IMPLEMENTACION.md"
echo "  [ ] Creé biblioteca OTENAS1"
echo "  [ ] Creé archivo QSQLSRC"
echo "  [ ] Ejecuté CNOFT.sql"
echo "  [ ] Ejecuté CNOFC.sql"
echo "  [ ] Ejecuté GLMST.sql"
echo "  [ ] Ejecuté BAVEN.sql"
echo "  [ ] Ejecuté USERS.sql"
echo "  [ ] Ejecuté CUMST.sql"
echo "  [ ] Ejecuté ACMST.sql"
echo "  [ ] Ejecuté CUMAD.sql"
echo "  [ ] Ejecuté DEALS.sql"
echo "  [ ] Ejecuté DLPMT.sql"
echo "  [ ] Ejecuté TRANS.sql"
echo "  [ ] Verifiqué con: SELECT COUNT(*) FROM SYSCAT.TABLES"
echo "  [ ] Ejecuté EJEMPLOS_CONSULTAS.sql"
echo ""

# ═══════════════════════════════════════════════════════════════════════════════
# 📞 AYUDA
# ═══════════════════════════════════════════════════════════════════════════════

echo "📞 AYUDA:"
echo "  ¿Cómo ejecutar?       → Ver README.md"
echo "  ¿Paso a paso?         → Ver CHECKLIST_IMPLEMENTACION.md"
echo "  ¿Qué hacer primero?   → Ver RESUMEN_PROYECTO.md"
echo "  ¿Ejemplos de SQL?     → Ver EJEMPLOS_CONSULTAS.sql"
echo "  ¿Referencia técnica?  → Ver RESUMEN.sql"
echo "  ¿Índice de tablas?    → Ver INDEX.md"
echo ""

# ═══════════════════════════════════════════════════════════════════════════════
# 🎉 LISTO PARA COMENZAR
# ═══════════════════════════════════════════════════════════════════════════════

echo "═══════════════════════════════════════════════════════════════════════════════"
echo "✨ TODO ESTÁ LISTO PARA USAR ✨"
echo ""
echo "Proyecto: Scripts SQL para Base de Datos Bancaria AS400"
echo "Plataforma: IBM AS400 / DB2 for i"
echo "Autor: Lazaro Tenas"
echo "Fecha: 2026-06-15"
echo "Estado: ✅ PRODUCCIÓN READY"
echo ""
echo "🚀 COMIENZA AHORA:"
echo "   1. Abre README.md"
echo "   2. Sigue CHECKLIST_IMPLEMENTACION.md"
echo "   3. Ejecuta scripts en orden"
echo "   4. ¡Éxito!"
echo "═══════════════════════════════════════════════════════════════════════════════"
echo ""
