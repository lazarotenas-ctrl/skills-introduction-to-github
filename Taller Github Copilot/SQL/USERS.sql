-- ============================================================================
-- TABLA: USERS
-- DESCRIPCIÓN: Archivo de Autorizaciones por menús
-- AUTOR: Lazaro Tenas
-- FECHA: 2026-06-15
-- ============================================================================

CREATE TABLE OTENAS1.USERS (
  ID_Usuario FOR IDUSR CHAR(30) NOT NULL,
  Codigo_Usuario FOR CODUSR CHAR(20) NOT NULL,
  Nombre_Usuario FOR NOMUSR CHAR(100) NOT NULL WITH DEFAULT ' ',
  Menu FOR MENU CHAR(50) NOT NULL WITH DEFAULT ' ',
  Opcion FOR OPCION CHAR(50) NOT NULL WITH DEFAULT ' ',
  Permiso FOR PERM CHAR(1) NOT NULL WITH DEFAULT 'N',
  Tipo_Usuario FOR TIPUSR CHAR(10) NOT NULL WITH DEFAULT ' ',
  Nivel_Acceso FOR NIVALC INT NOT NULL WITH DEFAULT 0,
  Descripcion_Acceso FOR DESCACC CHAR(120) NOT NULL WITH DEFAULT ' ',
  Email_Usuario FOR EMLUSR CHAR(100) NOT NULL WITH DEFAULT ' ',
  Activo FOR ACTVO CHAR(1) NOT NULL WITH DEFAULT 'S',
  Fecha_Activacion FOR FEACTIV DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Fecha_Desactivacion FOR FEDESAC DATE NOT NULL WITH DEFAULT CURRENT_DATE,
  Ultimo_Acceso FOR ULTACC TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Intentos_Fallidos FOR INTFAL INT NOT NULL WITH DEFAULT 0,
  Usuario_Creacion FOR USRC CHAR(30) NOT NULL WITH DEFAULT USER,
  Usuario_Actualizacion FOR USRA CHAR(30) NOT NULL WITH DEFAULT USER,
  Version_Registro FOR VREC INT NOT NULL WITH DEFAULT 1,
  Observaciones FOR OBS CHAR(120) NOT NULL WITH DEFAULT ' ',
  Estado_Registro FOR ESTRE CHAR(1) NOT NULL WITH DEFAULT 'A',
  Created_At FOR CREAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  Updated_At FOR UPDAT TIMESTAMP NOT NULL WITH DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID_Usuario, Menu, Opcion)
);

LABEL ON TABLE OTENAS1.USERS IS 'Archivo de Autorizaciones por menús';

LABEL ON COLUMN OTENAS1.USERS (
  ID_Usuario IS 'ID Único del Usuario',
  Codigo_Usuario IS 'Código del Usuario',
  Nombre_Usuario IS 'Nombre Completo del Usuario',
  Menu IS 'Menú',
  Opcion IS 'Opción del Menú',
  Permiso IS 'Permiso de Acceso',
  Tipo_Usuario IS 'Tipo de Usuario',
  Nivel_Acceso IS 'Nivel de Acceso',
  Descripcion_Acceso IS 'Descripción del Acceso',
  Email_Usuario IS 'Correo del Usuario',
  Activo IS 'Estado Activo',
  Fecha_Activacion IS 'Fecha de Activación',
  Fecha_Desactivacion IS 'Fecha de Desactivación',
  Ultimo_Acceso IS 'Último Acceso',
  Intentos_Fallidos IS 'Intentos Fallidos',
  Usuario_Creacion IS 'Usuario que Creó el Registro',
  Usuario_Actualizacion IS 'Usuario que Actualizó el Registro',
  Version_Registro IS 'Versión del Registro',
  Observaciones IS 'Observaciones',
  Estado_Registro IS 'Estado del Registro',
  Created_At IS 'Fecha y Hora de Creación',
  Updated_At IS 'Fecha y Hora de Actualización'
);

COMMENT ON TABLE OTENAS1.USERS IS 'Archivo de Autorizaciones por menús. Define los permisos de acceso de los usuarios a los diferentes módulos y opciones del sistema.';

COMMENT ON COLUMN OTENAS1.USERS.ID_Usuario IS 'Identificador único del usuario en el sistema.';
COMMENT ON COLUMN OTENAS1.USERS.Codigo_Usuario IS 'Código único de usuario para logín.';
COMMENT ON COLUMN OTENAS1.USERS.Nombre_Usuario IS 'Nombre completo del usuario.';
COMMENT ON COLUMN OTENAS1.USERS.Menu IS 'Nombre del menú al cual tiene acceso.';
COMMENT ON COLUMN OTENAS1.USERS.Opcion IS 'Opción específica dentro del menú.';
COMMENT ON COLUMN OTENAS1.USERS.Permiso IS 'S=Permitido, N=Denegado.';
COMMENT ON COLUMN OTENAS1.USERS.Tipo_Usuario IS 'Admin, Supervisor, Operador, Consulta.';
COMMENT ON COLUMN OTENAS1.USERS.Nivel_Acceso IS 'Nivel jerárquico de acceso (1-10).';
COMMENT ON COLUMN OTENAS1.USERS.Descripcion_Acceso IS 'Descripción de las funcionalidades permitidas.';
COMMENT ON COLUMN OTENAS1.USERS.Email_Usuario IS 'Correo electrónico del usuario.';
COMMENT ON COLUMN OTENAS1.USERS.Activo IS 'S=Activo, N=Inactivo.';
COMMENT ON COLUMN OTENAS1.USERS.Fecha_Activacion IS 'Fecha de activación del usuario.';
COMMENT ON COLUMN OTENAS1.USERS.Fecha_Desactivacion IS 'Fecha de desactivación del usuario.';
COMMENT ON COLUMN OTENAS1.USERS.Ultimo_Acceso IS 'Fecha y hora del último acceso.';
COMMENT ON COLUMN OTENAS1.USERS.Intentos_Fallidos IS 'Contador de intentos de acceso fallidos.';
COMMENT ON COLUMN OTENAS1.USERS.Usuario_Creacion IS 'Identificación del usuario que creó el registro.';
COMMENT ON COLUMN OTENAS1.USERS.Usuario_Actualizacion IS 'Identificación del usuario que realizó la última actualización.';
COMMENT ON COLUMN OTENAS1.USERS.Version_Registro IS 'Número de versión del registro para control de cambios.';
COMMENT ON COLUMN OTENAS1.USERS.Observaciones IS 'Observaciones o notas adicionales sobre el usuario.';
COMMENT ON COLUMN OTENAS1.USERS.Estado_Registro IS 'Estado del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN OTENAS1.USERS.Created_At IS 'Marca de tiempo de creación del registro.';
COMMENT ON COLUMN OTENAS1.USERS.Updated_At IS 'Marca de tiempo de la última actualización del registro.';

CREATE INDEX OTENAS1.IDXUSERS01 ON OTENAS1.USERS (ID_Usuario);
CREATE INDEX OTENAS1.IDXUSERS02 ON OTENAS1.USERS (Codigo_Usuario);
CREATE INDEX OTENAS1.IDXUSERS03 ON OTENAS1.USERS (Menu, Opcion);
CREATE INDEX OTENAS1.IDXUSERS04 ON OTENAS1.USERS (Tipo_Usuario);
CREATE INDEX OTENAS1.IDXUSERS05 ON OTENAS1.USERS (Activo);
CREATE INDEX OTENAS1.IDXUSERS06 ON OTENAS1.USERS (Created_At);
