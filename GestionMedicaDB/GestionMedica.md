# -- 4. Consulta que muestra los pacientes con su EPS correspondiente

```bash
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
```
### Consulta
![image](https://github.com/user-attachments/assets/620127c0-bb56-4d4f-8159-06169d239915)


# -- 5. Consulta del historial medico de los pacientes
```bash
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
```
### Consulta
![image](https://github.com/user-attachments/assets/c8d23e9d-91d6-4a7e-a3d5-d2a890670a8c)

# 6. Consulta de medicos con sus especialidades
```bash
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
```
### Consulta
![image](https://github.com/user-attachments/assets/a86d375c-ac73-4dbb-aad5-1744cb870a68)


#  7. Consulta de pacientes con sus medicos asignados
```bash
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
```
### Consulta 
![image](https://github.com/user-attachments/assets/7b359e35-c749-450b-953e-774a44ffad9b)

# --  8. Consulta completa que muestra pacientes, su EPS, medicos asignados y especialidades
```bash
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
```
### Consulta
![image](https://github.com/user-attachments/assets/5e57e2bf-c433-4797-b01d-34e01f30dc48)
