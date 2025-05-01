
--------------------- TABLAS ----------------------------------

-- CREACION TABLA EPS_SERVICIO_SALUD
CREATE TABLE EPS_SERVICIO_SALUD(
    ID_EPS NUMBER(10) PRIMARY KEY,
    NOMBRE VARCHAR(50)
)

-- TABLA PACIENTES 
CREATE TABLE EPS_PACIENTE(
    IDENTIFICACION NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(50),
    APELLIDOS VARCHAR2(50),
    FECHA_NACIMIENTO DATE,
    GENERO VARCHAR2(20),
    DIRECCION VARCHAR(50),
    TELEFONO VARCHAR2(15),
    CONTACTO_EMERGENCIA VARCHAR2(15),
    ID_EPS NUMBER(10)
)
  ALTER TABLE EPS_PACIENTE ADD CONSTRAINT paciente_fk_ideps FOREIGN KEY (ID_EPS) REFERENCES EPS_SERVICIO_SALUD(ID_EPS);

-- TABLA TIPO MEDICO
CREATE TABLE TipoMedico(
    idTipo NUMBER(10) PRIMARY KEY,
    descripcion VARCHAR2(100)
)

-- TABLA MEDICO
CREATE TABLE Medico(
    identificacion NUMBER(10) PRIMARY KEY,
    nombre VARCHAR2(50),
    apellidos VARCHAR2(50),
    registroMedico VARCHAR2(100),
    idTipo NUMBER(10)
)
   ALTER TABLE Medico ADD CONSTRAINT medico_fk_idtipo FOREIGN KEY (idTipo) REFERENCES TipoMedico(idTipo);


-- TABLA PACIENTE MEDICO 
CREATE TABLE PacienteMedico(
    id NUMBER(10) PRIMARY KEY,
    identificacionPaciente NUMBER(10),
    identificacionMedico NUMBER(10)
)
ALTER TABLE PacienteMedico ADD CONSTRAINT pacientemedico_fk_paciente FOREIGN KEY (identificacionPaciente) REFERENCES EPS_PACIENTE(IDENTIFICACION);
 ALTER TABLE PacienteMedico ADD   CONSTRAINT pacientemedico_fk_medico FOREIGN KEY (identificacionMedico) REFERENCES Medico(identificacion);

-- TABLA HISTORIAL MEDICO DEL PACIENTE 
CREATE TABLE HistorialMedico(
    id NUMBER(10) PRIMARY KEY,
    descripcion VARCHAR2(100),
    identificacion NUMBER(10)  
)
ALTER TABLE HistorialMedico ADD CONSTRAINT historial_fk_identificacion FOREIGN KEY (identificacion) REFERENCES EPS_PACIENTE(IDENTIFICACION);

-- TABLA DE ESPECIALIDADES 
CREATE TABLE Especialidad(
    idEspecialidad NUMBER(10) PRIMARY KEY,
    descripcion VARCHAR2(100)
)

-- TABLA ESPECIALIDAD DEL MEDICO
CREATE TABLE MedicoEspecialidad(
    id NUMBER(10) PRIMARY KEY,
    descripcion VARCHAR2(100),
    identificacion NUMBER(10),
    idEspecialidad NUMBER(10)
)

  ALTER TABLE MedicoEspecialidad ADD CONSTRAINT medicoespecialidad_fk_medico FOREIGN KEY (identificacion) REFERENCES Medico(identificacion);
  ALTER TABLE MedicoEspecialidad ADD CONSTRAINT medicoespecialidad_fk_especialidad FOREIGN KEY (idEspecialidad) REFERENCES Especialidad(idEspecialidad);
---------------------------------------- INSERCION DE DATOS ---------------

-- DATOS EPS
INSERT INTO EPS_SERVICIO_SALUD VALUES (1, 'Sanitas');
INSERT INTO EPS_SERVICIO_SALUD VALUES (2, 'Sura');
INSERT INTO EPS_SERVICIO_SALUD VALUES (3, 'SOS');
INSERT INTO EPS_SERVICIO_SALUD VALUES (4, 'Colsanitas');

-- INSERTAR REGISTROS EN LA TABLA EPS_PACIENTE 
INSERT INTO EPS_PACIENTE VALUES (1355323, 'LAURA', 'MARTINEZ', TO_DATE('27-07-2005', 'DD-MM-YYYY'), 'MASCULINO', 'CRA 14 #8-26', '3138619952', '6695297', 1);
INSERT INTO EPS_PACIENTE VALUES (1234567, 'JUAN', 'PEREZ', TO_DATE('15-05-1990', 'DD-MM-YYYY'), 'MASCULINO', 'CALLE 10 #15-23', '3124567890', '5551234', 2);
INSERT INTO EPS_PACIENTE VALUES (15432, 'MARIA', 'GARCIA', TO_DATE('20-09-1985', 'DD-MM-YYYY'), 'FEMENINO', 'AV 5 #23-12', '3109876543', '5559876', 3);

-- DATOS PARA TIPO MÉDICO
INSERT INTO TipoMedico VALUES (1, 'Médico General');
INSERT INTO TipoMedico VALUES (2, 'Especialista');
INSERT INTO TipoMedico VALUES (3, 'Subespecialista');

-- DATOS PARA MÉDICOS
INSERT INTO Medico VALUES (789456, 'CARLOS', 'GOMEZ', '123456', 1);
INSERT INTO Medico VALUES (855625, 'BREINER', 'MARTINEZ', '654321', 2);
INSERT INTO Medico VALUES (123789, 'ANDRES', 'LOPEZ', '987654', 2);

-- INSERCCION DE DATOS PACIENTE MEDICO
INSERT INTO PacienteMedico VALUES (1, 1234567, 789456);
INSERT INTO PacienteMedico VALUES (3, 1355323, 855625);

-- DATOS PARA ESPECIALIDADES
INSERT INTO Especialidad VALUES (1, 'Dermatología');
INSERT INTO Especialidad VALUES (2, 'Oncología');
INSERT INTO Especialidad VALUES (3, 'Cardiología');
INSERT INTO Especialidad VALUES (4, 'Neurología');

-- DATOS PARA MEDICO-ESPECIALIDAD
INSERT INTO MedicoEspecialidad VALUES (1, 'Especialista Senior', 855625, 1);
INSERT INTO MedicoEspecialidad VALUES (2, 'Especialista Jefe', 855625, 2);
INSERT INTO MedicoEspecialidad VALUES (3, 'Especialista Junior', 789456, 3);

-- INSERCCION DE DATOS HISTORIAL MEDICO
INSERT INTO HistorialMedico VALUES (1, 'El paciente padece de dermatitis, esta actualmente en tratamiento medico', 1234567);
INSERT INTO HistorialMedico VALUES (2, 'El paciente padece de cancer de garganta, esta actualmente en tratamiento medico', 15432);

------------------------------------- CONSULTAS --------------

-- 1. Consulta básica de todas las EPS
SELECT * FROM EPS_SERVICIO_SALUD;

-- 2. Ordenar los registros de EPS por ID
SELECT * FROM EPS_SERVICIO_SALUD ORDER BY ID_EPS ASC;

-- 3. Ordenar los registros de EPS por nombre alfabeticamente
SELECT * FROM EPS_SERVICIO_SALUD ORDER BY NOMBRE ASC;

-- 4. Consulta que muestra los pacientes con su EPS correspondiente
SELECT 
    p.IDENTIFICACION,
    p.NOMBRE || ' ' || p.APELLIDOS AS nombre_completo,
    p.GENERO,
    p.TELEFONO,
    e.NOMBRE AS eps
FROM 
    EPS_PACIENTE p
INNER JOIN 
    EPS_SERVICIO_SALUD e ON p.ID_EPS = e.ID_EPS
ORDER BY 
    p.APELLIDOS, p.NOMBRE;

-- 5. Consulta del historial medico de los pacientes
SELECT 
    p.IDENTIFICACION,
    p.NOMBRE || ' ' || p.APELLIDOS AS nombre_completo,
    h.descripcion AS historial_medico
FROM 
    EPS_PACIENTE p
INNER JOIN 
    HistorialMedico h ON p.IDENTIFICACION = h.identificacion
ORDER BY 
    p.IDENTIFICACION;

-- 6. Consulta de medicos con sus especialidades
SELECT 
    m.identificacion,
    m.nombre || ' ' || m.apellidos AS nombre_completo,
    m.registroMedico,
    t.descripcion AS tipo_medico,
    e.descripcion AS especialidad,
    me.descripcion AS nivel_especialidad
FROM 
    Medico m
INNER JOIN 
    TipoMedico t ON m.idTipo = t.idTipo
LEFT JOIN 
    MedicoEspecialidad me ON m.identificacion = me.identificacion
LEFT JOIN 
    Especialidad e ON me.idEspecialidad = e.idEspecialidad
ORDER BY 
    m.apellidos, m.nombre;

-- 7. Consulta de pacientes con sus medicos asignados
SELECT 
    p.IDENTIFICACION AS id_paciente,
    p.NOMBRE || ' ' || p.APELLIDOS AS nombre_paciente,
    m.identificacion AS id_medico,
    m.nombre || ' ' || m.apellidos AS nombre_medico,
    t.descripcion AS tipo_medico
FROM 
    EPS_PACIENTE p
INNER JOIN 
    PacienteMedico pm ON p.IDENTIFICACION = pm.identificacionPaciente
INNER JOIN 
    Medico m ON pm.identificacionMedico = m.identificacion
INNER JOIN 
    TipoMedico t ON m.idTipo = t.idTipo
ORDER BY 
    p.APELLIDOS, p.NOMBRE;

-- 8. Consulta completa que muestra pacientes, su EPS, medicos asignados y especialidades
SELECT 
    p.IDENTIFICACION AS id_paciente,
    p.NOMBRE || ' ' || p.APELLIDOS AS nombre_paciente,
    eps.NOMBRE AS eps,
    m.nombre || ' ' || m.apellidos AS nombre_medico,
    tm.descripcion AS tipo_medico,
    es.descripcion AS especialidad,
    me.descripcion AS nivel_especialidad,
    hm.descripcion AS historial_medico
FROM 
    EPS_PACIENTE p
INNER JOIN 
    EPS_SERVICIO_SALUD eps ON p.ID_EPS = eps.ID_EPS
LEFT JOIN 
    HistorialMedico hm ON p.IDENTIFICACION = hm.identificacion
LEFT JOIN 
    PacienteMedico pm ON p.IDENTIFICACION = pm.identificacionPaciente
LEFT JOIN 
    Medico m ON pm.identificacionMedico = m.identificacion
LEFT JOIN 
    TipoMedico tm ON m.idTipo = tm.idTipo
LEFT JOIN 
    MedicoEspecialidad me ON m.identificacion = me.identificacion
LEFT JOIN 
    Especialidad es ON me.idEspecialidad = es.idEspecialidad
ORDER BY 
    p.APELLIDOS, p.NOMBRE;
