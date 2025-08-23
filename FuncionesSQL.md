
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



### 🔹 1. Consultas básicas

```sql
SELECT * FROM products;     -- ver toda la tabla
SELECT product_name FROM products;  -- solo una columna
SELECT * FROM products LIMIT 10;   -- limitar resultados
```

👉 *Ojo:* pusiste `PRODCUTS` en algunos lados, el correcto es **PRODUCTS**.

---

### 🔹 2. Conteos

```sql
SELECT COUNT(1) FROM employees;   -- cuántos registros tiene employees
SELECT COUNT(1) FROM products;    -- cuántos productos hay
```

👉 *Tip:* `COUNT(1)`, `COUNT(*)` o `COUNT(columna)` sirven parecido, pero cada uno tiene su matiz.

---

### 🔹 3. JOIN entre tablas

```sql
SELECT p.product_name, c.category_name
FROM products p
INNER JOIN categories c 
    ON p.category_id = c.category_id
WHERE UPPER(p.product_name) = 'TOFU';
```

👉 Aquí usaste `UPPER()` para no depender de mayúsculas/minúsculas, ¡muy bien!

---

### 🔹 4. Funciones de agregación

```sql
SELECT MIN(unit_price) AS valor_minimo, 
       MAX(unit_price) AS valor_maximo, 
       AVG(unit_price) AS valor_promedio,
       ROUND(AVG(unit_price)::NUMERIC, 4) AS valor_promedio_redondeado
FROM products;
```

---

### 🔹 5. Filtros con `WHERE` e `IN`

```sql
SELECT product_name, units_in_stock 
FROM products 
WHERE units_in_stock IN (120, 22, 24, 35, 42, 9);
```

---

### 🔹 6. SUMA de productos en bodega

```sql
SELECT SUM(units_in_stock) AS "productos en bodega"
FROM products;
```

---

### 🔹 7. LIKE para patrones de texto

```sql
-- Contienen la letra S
SELECT * FROM products WHERE product_name LIKE '%s%';

-- Terminan en N
SELECT * FROM products WHERE product_name LIKE '%n';

-- Contienen "cho"
SELECT * FROM products WHERE product_name LIKE '%cho%';
```

👉 *Ojo:* si quisieras **productos que empiezan por S**, sería:

```sql
SELECT * FROM products WHERE product_name LIKE 'S%';
```

---

### 🔹 8. Fechas y rangos

```sql
SELECT customer_id, order_date, freight, order_id
FROM orders
WHERE customer_id = 'VICTE'
  AND order_date BETWEEN '1996-01-01' AND '1997-12-31';
```

---

## 📌 Resumen

* **Básico:** `SELECT`, `WHERE`, `LIMIT`, `COUNT`, `SUM`.
* **Texto:** `LIKE`, `UPPER`.
* **Agregación:** `AVG`, `MIN`, `MAX`, `ROUND`.
* **JOINS:** combinar tablas.
* **Fechas:** `BETWEEN`.

Con esto ya tienes el **kit de supervivencia SQL** 🛠️ para cualquier clase inicial.

---
