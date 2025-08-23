
---

## 🔹 1. Funciones de **Agregación**

Se usan para calcular valores sobre un conjunto de filas.

```sql
-- Promedio
SELECT AVG(salario) AS promedio_salario FROM empleados;

-- Contar registros
SELECT COUNT(*) AS total_empleados FROM empleados;

-- Valor máximo y mínimo
SELECT MAX(salario) AS mayor, MIN(salario) AS menor FROM empleados;

-- Suma total
SELECT SUM(salario) AS suma_salarios FROM empleados;
```

---

## 🔹 2. Funciones de **Texto / Cadenas**

Sirven para trabajar con columnas tipo `VARCHAR` o `TEXT`.

```sql
-- Pasar a mayúsculas o minúsculas
SELECT UPPER(nombre), LOWER(nombre) FROM clientes;

-- Longitud de una cadena
SELECT LENGTH(nombre) AS caracteres FROM clientes;

-- Concatenar valores
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo FROM clientes;

-- Substring (extraer parte del texto)
SELECT SUBSTRING(nombre FROM 1 FOR 3) AS primeras_letras FROM clientes;
```

---

## 🔹 3. Funciones de **Números**

Muy útiles para cálculos.

```sql
-- Redondear
SELECT ROUND(AVG(salario), 2) AS promedio_redondeado FROM empleados;

-- Potencia
SELECT POWER(2, 3);  -- resultado: 8

-- Valor absoluto
SELECT ABS(-25);  -- resultado: 25
```

---

## 🔹 4. Funciones de **Fecha y Hora**

PostgreSQL tiene muchísimas funciones de tiempo.

```sql
-- Fecha y hora actual
SELECT NOW();

-- Solo fecha actual
SELECT CURRENT_DATE;

-- Extraer año, mes, día
SELECT EXTRACT(YEAR FROM fecha_nacimiento) AS anio FROM empleados;

-- Calcular edad
SELECT AGE(CURRENT_DATE, fecha_nacimiento) AS edad FROM empleados;
```

---

## 🔹 5. Funciones de **Conversión**

Cambiar tipos de datos.

```sql
-- Convertir texto a número
SELECT CAST('123' AS INTEGER);

-- Convertir número a texto
SELECT CAST(123 AS TEXT);
```

---

## 🔹 6. Funciones Condicionales

Parecidas a un IF en programación.

```sql
-- CASE
SELECT nombre,
       CASE 
         WHEN salario > 2000 THEN 'Alto'
         ELSE 'Bajo'
       END AS categoria_salario
FROM empleados;

-- COALESCE (si un valor es NULL, usa otro por defecto)
SELECT COALESCE(telefono, 'No registrado') FROM clientes;
```

---


¿Quieres que te arme un **mapa visual (tipo chuleta)** con todas estas funciones organizadas por categoría para llevarlo como apoyo rápido? 🚀
