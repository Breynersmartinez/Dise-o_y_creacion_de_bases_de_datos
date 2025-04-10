# Fundamentos de Oracle Database - Guía Rápida 📚

```markdown
# Comandos SQL Básicos para Oracle Database

## Consultas Básicas

### 1. Seleccionar Datos
```sql
SELECT * FROM nombre_tabla;
```
- Selecciona todos los registros de la tabla especificada.

### 2. Selección con Filtros
```sql
SELECT columna1, columna2 FROM tabla WHERE condicion;
```

## Manipulación de Datos

### 3. Insertar Datos
```sql
INSERT INTO nombre_tabla (columna1, columna2) 
VALUES (valor1, valor2);
```

### 4. Actualizar Datos
```sql
UPDATE nombre_tabla
SET columna1 = valor1 
WHERE condicion;
```

### 5. Eliminar Datos
```sql
DELETE FROM nombre_tabla 
WHERE condicion;
```

## Estructura de la Base de Datos

### 6. Crear Tabla
```sql
CREATE TABLE nombre_tabla (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    fecha DATE DEFAULT SYSDATE
);
```

### 7. Modificar Tabla
```sql
ALTER TABLE nombre_tabla
ADD (nueva_columna VARCHAR2(30));

ALTER TABLE nombre_tabla
MODIFY (columna_existente NUMBER(10,2));
```

### 8. Eliminar Tabla
```sql
DROP TABLE nombre_tabla;
```

## Objetos de Base de Datos

### 9. Índices
```sql
CREATE INDEX idx_nombre ON tabla(columna);

-- Índice único
CREATE UNIQUE INDEX idx_unico ON tabla(columna);
```

### 10. Vistas
```sql
CREATE VIEW vista_empleados AS
SELECT id, nombre, salario 
FROM empleados 
WHERE departamento = 'IT';
```

### 11. Secuencias
```sql
CREATE SEQUENCE seq_id
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;
```

## Operaciones Avanzadas

### 12. Uniones (JOINs)
```sql
-- INNER JOIN
SELECT a.col1, b.col2 
FROM tabla1 a
JOIN tabla2 b ON a.id = b.id_tabla1;

-- LEFT JOIN
SELECT a.col1, b.col2 
FROM tabla1 a
LEFT JOIN tabla2 b ON a.id = b.id_tabla1;
```

### 13. Transacciones
```sql
BEGIN
  INSERT INTO tabla1 VALUES (...);
  UPDATE tabla2 SET col1 = val1 WHERE...;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END;
```

## Funciones Comunes

### 14. Funciones de Cadena
```sql
SELECT UPPER(nombre), SUBSTR(descripcion, 1, 10) 
FROM productos;
```

### 15. Funciones de Fecha
```sql
SELECT TO_CHAR(fecha, 'DD/MM/YYYY'), 
       ADD_MONTHS(fecha, 3),
       MONTHS_BETWEEN(SYSDATE, fecha)
FROM eventos;
```

### 16. Funciones Numéricas
```sql
SELECT ROUND(salario, 2), 
       TRUNC(salario), 
       MOD(salario, 1000)
FROM empleados;
```

## PL/SQL Básico

### 17. Bloque Anónimo
```sql
DECLARE
  v_contador NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_contador FROM empleados;
  DBMS_OUTPUT.PUT_LINE('Total empleados: ' || v_contador);
END;
/
```

### 18. Procedimiento Almacenado
```sql
CREATE OR REPLACE PROCEDURE aumentar_salario (
  p_porcentaje IN NUMBER
) AS
BEGIN
  UPDATE empleados 
  SET salario = salario * (1 + p_porcentaje/100);
  COMMIT;
END aumentar_salario;
/
```

## Tips Importantes
- Usa `COMMIT` para confirmar cambios
- Usa `ROLLBACK` para deshacer cambios no confirmados
- `EXPLAIN PLAN FOR` ayuda a analizar el rendimiento de consultas
- `DESCRIBE nombre_tabla` muestra la estructura de una tabla

```

Este archivo README.md está organizado con:
- Encabezados claros por categoría
- Sintaxis SQL resaltada
- Explicaciones breves para cada comando
- Secciones lógicas desde básico a avanzado

Puedes copiar este contenido directamente a tu archivo README.md o modificarlo según tus necesidades específicas.
