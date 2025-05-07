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

    **relaciones cardinales** entre las entidades del sistema (uno a muchos, muchos a uno y muchos a muchos):
---

### **RELACIONES UNO A MUCHOS (1\:N)**

* **Emprendimiento -> Proyecto**
  Un emprendimiento puede tener **muchos proyectos**, pero un proyecto pertenece a un solo emprendimiento.

* **Proyecto -> Producto**
  Un proyecto puede tener **muchos productos**, pero cada producto es de **un solo proyecto**.

* **Proyecto -> Evaluación**
  Un proyecto puede tener muchas evaluaciones de diferentes jurados.

* **Stand -> Agenda**
  Un stand puede tener muchas actividades en su agenda.

* **Visitante -> Encuesta / Visita**
  Un visitante puede responder muchas encuestas y visitar varios stands.

---

### **RELACIONES MUCHOS A UNO (N:1)**


* **Producto -> Proyecto**
* **Evaluación -> Proyecto**
* **Agenda -> Stand**
* **Visita -> Stand**

---

### **RELACIONES MUCHOS A MUCHOS (M\:N)**

Estas relaciones normalmente necesitan una tabla intermedia (entidad débil o relación con atributos propios):

* **Estudiante/Egresado <-> Proyecto (Equipo\_Proyecto)**
  Un estudiante puede estar en varios proyectos, y un proyecto puede tener varios estudiantes.
  Se modela con la entidad intermedia **Equipo\_Proyecto**, que incluye el atributo `Rol`.

* **Visitante <-> Stand (Visita)**
  Un visitante puede visitar varios stands y un stand puede recibir varios visitantes.
  Se resuelve con la entidad **Visita**, que además tiene `FechaHora`.

* **Proyecto <-> Jurado (Evaluación)**
  Cada jurado puede evaluar varios proyectos, y cada proyecto puede ser evaluado por varios jurados.
  Se modela con la entidad **Evaluación**, que incluye `Puntaje` y `Comentarios`.


