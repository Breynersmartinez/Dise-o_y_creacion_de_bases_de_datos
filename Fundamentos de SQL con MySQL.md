

## **1. Fundamentos de SQL con MySQL**

### **1.1. ¿Qué es una base de datos relacional?**
Una base de datos relacional organiza los datos en **tablas** (filas y columnas), donde cada tabla tiene una relación con otra mediante **claves** (primarias y foráneas).

### **1.2. Conceptos clave**
- **Tabla**: Estructura que almacena datos (ej: `clientes`, `productos`).
- **Columna (Campo)**: Atributo de una tabla (ej: `nombre`, `edad`).
- **Fila (Registro)**: Entrada individual en una tabla.
- **Clave Primaria (PK)**: Identificador único de un registro (ej: `id_cliente`).
- **Clave Foránea (FK)**: Campo que referencia a una PK en otra tabla para establecer relaciones.

### **1.3. Comandos básicos SQL**
#### **a) Crear una base de datos**
```sql
CREATE DATABASE nombre_base_de_datos;
```

#### **b) Usar una base de datos**
```sql
USE nombre_base_de_datos;
```

#### **c) Crear una tabla**
```sql
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    edad INT CHECK (edad >= 18)
);
```

#### **d) Insertar datos**
```sql
INSERT INTO clientes (nombre, email, edad) 
VALUES ('Juan Pérez', 'juan@example.com', 25);
```

#### **e) Consultar datos (SELECT)**
```sql
SELECT * FROM clientes; -- Todos los campos
SELECT nombre, email FROM clientes WHERE edad > 20;
```

#### **f) Actualizar datos (UPDATE)**
```sql
UPDATE clientes SET edad = 26 WHERE id_cliente = 1;
```

#### **g) Eliminar datos (DELETE)**
```sql
DELETE FROM clientes WHERE id_cliente = 1;
```

---

## **2. Ejercicios Prácticos**

### **Ejercicio 1: Crear una base de datos y una tabla**
1. Crea una base de datos llamada `tienda`.
2. Crea una tabla `productos` con los campos:
   - `id_producto` (entero, clave primaria, autoincremental)
   - `nombre` (texto, no nulo)
   - `precio` (decimal, no nulo)
   - `stock` (entero, valor por defecto 0)

**Solución:**
```sql
CREATE DATABASE tienda;
USE tienda;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0
);
```

---

### **Ejercicio 2: Insertar y consultar datos**
1. Inserta 3 productos en la tabla `productos`.
2. Muestra todos los productos con precio mayor a 50.

**Solución:**
```sql
-- Insertar datos
INSERT INTO productos (nombre, precio, stock) 
VALUES ('Laptop', 1200.99, 10),
       ('Mouse', 25.50, 30),
       ('Teclado', 60.00, 15);

-- Consultar productos con precio > 50
SELECT * FROM productos WHERE precio > 50;
```

---

### **Ejercicio 3: Actualizar y eliminar registros**
1. Actualiza el stock del producto con `id_producto = 2` a 50.
2. Elimina el producto con `id_producto = 3`.

**Solución:**
```sql
-- Actualizar stock
UPDATE productos SET stock = 50 WHERE id_producto = 2;

-- Eliminar producto
DELETE FROM productos WHERE id_producto = 3;
```

---

### **Ejercicio 4: Consultas avanzadas**
1. Crea una tabla `pedidos` con:
   - `id_pedido` (PK, autoincremental)
   - `id_cliente` (entero)
   - `fecha_pedido` (fecha)
   - `total` (decimal)
2. Realiza una consulta que muestre los pedidos ordenados por fecha descendente.

**Solución:**
```sql
-- Crear tabla pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    total DECIMAL(10, 2)
);

-- Insertar datos de ejemplo
INSERT INTO pedidos (id_cliente, fecha_pedido, total)
VALUES (1, '2023-10-01', 150.50),
       (2, '2023-10-05', 200.75);

-- Consultar pedidos ordenados por fecha
SELECT * FROM pedidos ORDER BY fecha_pedido DESC;
```

---

## **3. Relaciones entre tablas**
Para trabajar con relaciones, necesitas:
- **Clave primaria (PK)**: Identifica un registro de forma única.
- **Clave foránea (FK)**: Hace referencia a una PK en otra tabla.

**Ejemplo:**
```sql
-- Tabla clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla pedidos (con FK)
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
```

---

## **4. Ejercicio Final: Base de datos de una librería**
Crea una base de datos para una librería con las tablas:
- `libros` (id_libro, titulo, autor, precio)
- `ventas` (id_venta, id_libro, fecha_venta, cantidad)

**Tareas:**
1. Crea las tablas con las relaciones adecuadas.
2. Inserta datos de ejemplo.
3. Realiza una consulta que muestre los libros más vendidos.

**Solución propuesta:**
```sql
-- Crear base de datos
CREATE DATABASE libreria;
USE libreria;

-- Tabla libros
CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(50),
    precio DECIMAL(10, 2)
);

-- Tabla ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    fecha_venta DATE,
    cantidad INT,
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

-- Insertar datos
INSERT INTO libros (titulo, autor, precio)
VALUES ('El Principito', 'Antoine de Saint-Exupéry', 15.99),
       ('Cien años de soledad', 'Gabriel García Márquez', 20.50);

INSERT INTO ventas (id_libro, fecha_venta, cantidad)
VALUES (1, '2023-10-10', 5),
       (2, '2023-10-15', 3);

-- Consulta: Libros más vendidos
SELECT l.titulo, SUM(v.cantidad) AS total_vendido
FROM libros l
JOIN ventas v ON l.id_libro = v.id_libro
GROUP BY l.titulo
ORDER BY total_vendido DESC;
```

