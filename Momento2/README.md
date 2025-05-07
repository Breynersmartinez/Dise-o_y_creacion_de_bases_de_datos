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







| Relación                                   | Tipo de Relación | Explicación                                                                     |
| ------------------------------------------ | ---------------- | ------------------------------------------------------------------------------- |
| **Evento - Logistica\_Evento**             | 1:1              | Un evento tiene una sola logística asociada (por ID\_Evento).                   |
| **Evento - Patrocinador**                  | N\:M             | Varios patrocinadores pueden apoyar varios eventos (requiere tabla intermedia). |
| **Patrocinador - Evento**                  | N\:M             | Mismo caso anterior.                                                            |
| **Stand - Proyecto**                       | 1:1              | Un stand aloja un único proyecto.                                               |
| **Proyecto - Stand**                       | 1:1 o 1\:N       | Un proyecto ocupa un solo stand (según tu modelo, parece ser 1:1).              |
| **Proyecto - Evaluacion**                  | 1\:N             | Un proyecto puede tener varias evaluaciones de diferentes jurados.              |
| **Jurado - Evaluacion**                    | 1\:N             | Un jurado puede evaluar varios proyectos.                                       |
| **Proyecto - Producto**                    | 1\:N             | Un proyecto puede ofrecer varios productos.                                     |
| **Producto - Transaccion**                 | 1\:N             | Un producto puede estar en varias transacciones.                                |
| **Proyecto - Equipo\_Proyecto**            | 1\:N             | Un proyecto tiene varios integrantes en su equipo.                              |
| **Estudiante/Egresado - Equipo\_Proyecto** | 1\:N             | Un estudiante puede participar en varios equipos de proyectos (si se permite).  |
| **Proyecto - Emprendimiento**              | N:1              | Cada proyecto está ligado a un emprendimiento.                                  |
| **Proyecto - Temática**                    | N:1              | Cada proyecto tiene una sola temática.                                          |
| **Visitante - Visita**                     | 1\:N             | Un visitante puede realizar varias visitas a stands.                            |
| **Stand - Visita**                         | 1\:N             | Un stand puede recibir muchas visitas.                                          |
| **Stand - Agenda**                         | 1\:N             | Un stand puede tener varias actividades en su agenda.                           |
| **Visitante - Encuesta**                   | 1\:N             | Un visitante puede llenar varias encuestas (si es el caso).                     |
| **Stand - Evaluacion\_Stand**              | 1\:N             | Un stand puede recibir múltiples evaluaciones.                                  |

---

### 🔁 Ejemplo de relación N\:M (Evento – Patrocinador)

Requiere una tabla intermedia:


