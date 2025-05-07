###  *ENTIDADES Y ATRIBUTOS*

1. *Evento*
  * ID_evento
  *  Fecha_inicio
  *  Fecha_fin
  *  Lugar
  *  Nombre
  *  Descripcion
    

2. *Patrocinador*
   * ID_patrocinador
   * nombre
   * Contacto
   * Aporte

3.    *Stand*

   * ID\_Stand (PK)
   * Ubicacion
   * ID\_Proyecto (FK)

4.  *Proyecto*

   * ID\_Proyecto (PK)
   * Nombre
   * Estado\_Inscripcion
   * Fecha\_Inscripcion
   * ID\_Emprendimiento (FK)
   * ID\_Tematica (FK)

5. *Equipo\_Proyecto*

   * ID\_Equipo (PK)
   * ID\_Proyecto (FK)
   * ID\_Estudiante (FK)
   * Rol (líder/integrante)

6. *Estudiante / Egresado*

   * ID\_Estudiante (PK)
   * Nombre
   * Correo
   * Tipo (Estudiante/Egresado)

7. *Jurado*

   * ID\_Jurado (PK)
   * Nombre
   * Especialidad
   * Contacto

8. *Evaluacion*

   * ID\_Evaluacion (PK)
   * ID\_Proyecto (FK)
   * ID\_Jurado (FK)
   * Puntaje
   * Comentarios

9. *Producto*

   * ID\_Producto (PK)
   * Nombre
   * Precio
   * Disponibilidad
   * ID\_Proyecto (FK)

10. *Transaccion*

   * ID\_Transaccion (PK)
   * ID\_Producto (FK)
   * Cantidad
   * Valor

11.  *Visitante*

   * ID\_Visitante (PK)
   * Nombre
   * Correo
   * Tipo (Estudiante/Externo)

12. *Visita*

    * ID\_Visita (PK)
    * ID\_Visitante (FK)
    * ID\_Stand (FK)
    * FechaHora

13. *Agenda*

    * ID\_Agenda (PK)
    * ID\_Stand (FK)
    * Actividad
    * Hora

14. *Emprendimiento*

    * ID\_Emprendimiento (PK)
    * Nombre
    * Tipo\_Negocio
    * Eslogan

15. *Tematica*

    * ID\_Tematica (PK)
    * Nombre\_Tematica

16. *Encuesta*

    * ID\_Encuesta (PK)
    * ID\_Visitante (FK)
    * Satisfaccion
    * Comentarios

17. *Evaluacion\_Stand*

    * ID\_EvalStand (PK)
    * ID\_Stand (FK)
    * Comentarios
    * Puntaje

18. *Logistica\_Evento*

    * ID\_Evento (PK)
    * Fecha
    * Lugar
    * Duracion
    * Patrocinadores



###  RELACIONES UNO A MUCHOS (1\:N)

1. **Proyecto -> Stand**

   * Un proyecto puede tener **uno o varios stands**.
   * Relación: `Proyecto (1) --- (N) Stand`

2. **Proyecto -> Producto**

   * Un proyecto puede tener **varios productos**.
   * Relación: `Proyecto (1) --- (N) Producto`

3. **Proyecto -> Evaluación**

   * Un proyecto puede recibir **varias evaluaciones**.
   * Relación: `Proyecto (1) --- (N) Evaluacion`

4. **Proyecto → Equipo\_Proyecto**

   * Un proyecto puede tener **muchos estudiantes** participando.
   * Relación: `Proyecto (1) --- (N) Equipo_Proyecto`

5. **Estudiante -> Equipo\_Proyecto**

   * Un estudiante puede participar en **varios proyectos** (como líder o integrante).
   * Relación: `Estudiante (1) --- (N) Equipo_Proyecto`

6. **Jurado -> Evaluacion**

   * Un jurado puede evaluar **muchos proyectos**.
   * Relación: `Jurado (1) --- (N) Evaluacion`

7. **Producto -> Transaccion**

   * Un producto puede tener **varias transacciones**.
   * Relación: `Producto (1) --- (N) Transaccion`

8. **Stand -> Visita**

   * Un stand puede recibir **muchas visitas**.
   * Relación: `Stand (1) --- (N) Visita`

9. **Visitante -> Visita**

   * Un visitante puede hacer **varias visitas** a distintos stands.
   * Relación: `Visitante (1) --- (N) Visita`

10. **Visitante -> Encuesta**

* Un visitante puede llenar **una o varias encuestas**.
* Relación: `Visitante (1) --- (N) Encuesta`

11. **Stand -> Evaluacion\_Stand**

* Un stand puede tener **varias evaluaciones de stand**.
* Relación: `Stand (1) --- (N) Evaluacion_Stand`

12. **Stand -> Agenda**

* Un stand puede tener **varias actividades en la agenda**.
* Relación: `Stand (1) --- (N) Agenda`

13. **Tematica -> Proyecto**

* Una temática puede agrupar **muchos proyectos**.
* Relación: `Tematica (1) --- (N) Proyecto`

14. **Emprendimiento -> Proyecto**

* Un emprendimiento puede tener **varios proyectos**.
* Relación: `Emprendimiento (1) --- (N) Proyecto`

---

###  RELACIONES MUCHOS A UNO (N:1)

Estas son simplemente las inversas de las anteriores (por ejemplo, muchos proyectos pertenecen a una temática).
Ejemplo:

* **Stand -> Proyecto**
* **Evaluacion -> Jurado**
* **Producto -> Proyecto**
* etc.

---

###  RELACIONES MUCHOS A MUCHOS (N\:M)

1. **Proyecto <-> Estudiante** (a través de la tabla intermedia `Equipo_Proyecto`)

   * Un proyecto tiene varios estudiantes, y un estudiante puede participar en varios proyectos.

2. **Stand <-> Visitante** (a través de `Visita`)

   * Un visitante puede visitar varios stands, y un stand puede ser visitado por varios visitantes.

3. **Stand <-> Evaluacion\_Stand**

   * Si hay varios evaluadores por stand, también se puede modelar como muchos a muchos (aunque actualmente parece uno a muchos).




