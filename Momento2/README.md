###  *ENTIDADES Y ATRIBUTOS*

1. *Stand*

   * ID\_Stand (PK)
   * Ubicacion
   * ID\_Proyecto (FK)

2. *Proyecto*

   * ID\_Proyecto (PK)
   * Nombre
   * Estado\_Inscripcion
   * Fecha\_Inscripcion
   * ID\_Emprendimiento (FK)
   * ID\_Tematica (FK)

3. *Equipo\_Proyecto*

   * ID\_Equipo (PK)
   * ID\_Proyecto (FK)
   * ID\_Estudiante (FK)
   * Rol (líder/integrante)

4. *Estudiante / Egresado*

   * ID\_Estudiante (PK)
   * Nombre
   * Correo
   * Tipo (Estudiante/Egresado)

5. *Jurado*

   * ID\_Jurado (PK)
   * Nombre
   * Especialidad
   * Contacto

6. *Evaluacion*

   * ID\_Evaluacion (PK)
   * ID\_Proyecto (FK)
   * ID\_Jurado (FK)
   * Puntaje
   * Comentarios

7. *Producto*

   * ID\_Producto (PK)
   * Nombre
   * Precio
   * Disponibilidad
   * ID\_Proyecto (FK)

8. *Transaccion*

   * ID\_Transaccion (PK)
   * ID\_Producto (FK)
   * Cantidad
   * Valor

9. *Visitante*

   * ID\_Visitante (PK)
   * Nombre
   * Correo
   * Tipo (Estudiante/Externo)

10. *Visita*

    * ID\_Visita (PK)
    * ID\_Visitante (FK)
    * ID\_Stand (FK)
    * FechaHora

11. *Agenda*

    * ID\_Agenda (PK)
    * ID\_Stand (FK)
    * Actividad
    * Hora

12. *Emprendimiento*

    * ID\_Emprendimiento (PK)
    * Nombre
    * Tipo\_Negocio
    * Eslogan

13. *Tematica*

    * ID\_Tematica (PK)
    * Nombre\_Tematica

14. *Encuesta*

    * ID\_Encuesta (PK)
    * ID\_Visitante (FK)
    * Satisfaccion
    * Comentarios

15. *Evaluacion\_Stand*

    * ID\_EvalStand (PK)
    * ID\_Stand (FK)
    * Comentarios
    * Puntaje

16. *Logistica\_Evento*

    * ID\_Evento (PK)
    * Fecha
    * Lugar
    * Duracion
    * Patrocinadores
