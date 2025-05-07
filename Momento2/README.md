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

11. *Visitante*

   * ID\_Visitante (PK)
   * Nombre
   * Correo
   * Tipo (Estudiante/Externo)

11. *Visita*

    * ID\_Visita (PK)
    * ID\_Visitante (FK)
    * ID\_Stand (FK)
    * FechaHora

12. *Agenda*

    * ID\_Agenda (PK)
    * ID\_Stand (FK)
    * Actividad
    * Hora

13. *Emprendimiento*

    * ID\_Emprendimiento (PK)
    * Nombre
    * Tipo\_Negocio
    * Eslogan

14. *Tematica*

    * ID\_Tematica (PK)
    * Nombre\_Tematica

15. *Encuesta*

    * ID\_Encuesta (PK)
    * ID\_Visitante (FK)
    * Satisfaccion
    * Comentarios

16. *Evaluacion\_Stand*

    * ID\_EvalStand (PK)
    * ID\_Stand (FK)
    * Comentarios
    * Puntaje

17. *Logistica\_Evento*

    * ID\_Evento (PK)
    * Fecha
    * Lugar
    * Duracion
    * Patrocinadores
