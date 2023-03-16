/*Primero, se genera la BD*/
CREATE SCHEMA prueba_bd;

/*Luego, se usa dicha BD, para trabajar en ella*/
USE prueba_bd;

/*Ahora, se generán las tablas asociadas al ejercicio*/
CREATE TABLE producto(
	id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(30),
    tipo_producto_id INT,
    precio_producto_unitario_venta INT
);

CREATE TABLE tipo_producto(
	id_tipo_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo_producto VARCHAR(30)
);

CREATE TABLE proveedores(
	id_proveedores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(30),
    direccion_proveedor VARCHAR(80),
    telefono_proveedor INT
);

CREATE TABLE ventas(
	id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATETIME,
    producto_id INT,
    cantidad_vendida INT,
    monto_total_venta INT
);

CREATE TABLE compra(
	id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_compra DATETIME,
    producto_id INT,
    cantidad_comprada INT,
    precio_producto_unitario_compra INT,
    monto_total_compra INT
);

/*Ahora, se generarán las relaciones entre tablas*/
ALTER TABLE producto ADD CONSTRAINT fk_tipo_producto FOREIGN KEY (tipo_producto_id) REFERENCES tipo_producto(id_tipo_producto);
ALTER TABLE ventas ADD CONSTRAINT fk_producto_id_venta FOREIGN KEY (producto_id) REFERENCES producto(id_producto);
ALTER TABLE compra ADD CONSTRAINT fk_producto_id_compra FOREIGN KEY (producto_id) REFERENCES producto(id_producto);

/*Luego, crear tabla relacional "proveedor_productos" */

CREATE TABLE proveedor_producto (
    id_proveedor_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    proveedor_id INT,
    producto_id INT
);

/*Luego, generar relaciones */
ALTER TABLE proveedor_producto ADD CONSTRAINT fk_proveedor_id FOREIGN KEY (proveedor_id) REFERENCES proveedores (id_proveedores);
ALTER TABLE proveedor_producto ADD CONSTRAINT fk_producto_id FOREIGN KEY (producto_id) REFERENCES producto (id_producto);

/*Se pobla "tipo_producto" */
INSERT INTO tipo_producto (id_tipo_producto, nombre_tipo_producto) VALUES (1, 'Lácteos');
INSERT INTO tipo_producto (id_tipo_producto, nombre_tipo_producto) VALUES (2, 'Panadería');
INSERT INTO tipo_producto (id_tipo_producto, nombre_tipo_producto) VALUES (3, 'Granos y cereales');
INSERT INTO tipo_producto (id_tipo_producto, nombre_tipo_producto) VALUES (4, 'Aceites y condimentos');

/*Se pobla "producto" */
INSERT INTO producto (id_producto, nombre_producto, tipo_producto_id, precio_producto_unitario_venta) VALUES (1, 'Leche descremada', 1, 1200);
INSERT INTO producto (id_producto, nombre_producto, tipo_producto_id, precio_producto_unitario_venta) VALUES (2, 'Pan blanco', 2, 1000);
INSERT INTO producto (id_producto, nombre_producto, tipo_producto_id, precio_producto_unitario_venta) VALUES (3, 'Arroz integral', 3, 1800);
INSERT INTO producto (id_producto, nombre_producto, tipo_producto_id, precio_producto_unitario_venta) VALUES (4, 'Aceite de oliva', 4, 4000);
INSERT INTO producto (id_producto, nombre_producto, tipo_producto_id, precio_producto_unitario_venta) VALUES (5, 'Queso de Cabra', 1, 3500);

/*Se pobla "proveedores" */
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor A', 'Calle Falsa 123', 5691234);
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor B', 'Avenida Siempre Viva 742', 5698765);
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor C', 'Avenida Revolución 456', 5695678);
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES ('Proveedor D', 'Calle 9 3/4', 5694321);

/*Se pobla "ventas" */
INSERT INTO ventas (fecha_venta, producto_id, cantidad_vendida, monto_total_venta) VALUES ('2022-01-01 10:30:00', 1, 10, 12000);
INSERT INTO ventas (fecha_venta, producto_id, cantidad_vendida, monto_total_venta) VALUES ('2022-02-01 11:00:00', 2, 20, 20000);
INSERT INTO ventas (fecha_venta, producto_id, cantidad_vendida, monto_total_venta) VALUES ('2022-03-15 15:30:00', 3, 15, 27000);
INSERT INTO ventas (fecha_venta, producto_id, cantidad_vendida, monto_total_venta) VALUES ('2022-04-22 09:45:00', 4, 5, 20000);
INSERT INTO ventas (fecha_venta, producto_id, cantidad_vendida, monto_total_venta) VALUES ('2022-05-18 12:15:00', 5, 8, 28000);

/*Se pobla "compra" */
INSERT INTO compra (fecha_compra, producto_id, cantidad_comprada, precio_producto_unitario_compra, monto_total_compra) VALUES ('2022-01-05 13:30:00', 1, 100, 1000, 100000);
INSERT INTO compra (fecha_compra, producto_id, cantidad_comprada, precio_producto_unitario_compra, monto_total_compra) VALUES ('2022-02-10 16:45:00', 2, 200, 800, 160000);
INSERT INTO compra (fecha_compra, producto_id, cantidad_comprada, precio_producto_unitario_compra, monto_total_compra) VALUES ('2022-03-20 08:15:00', 3, 150, 1500, 225000);
INSERT INTO compra (fecha_compra, producto_id, cantidad_comprada, precio_producto_unitario_compra, monto_total_compra) VALUES ('2022-04-30 10:00:00', 4, 50, 3500, 175000);
INSERT INTO compra (fecha_compra, producto_id, cantidad_comprada, precio_producto_unitario_compra, monto_total_compra) VALUES ('2022-05-25 14:30:00', 5, 80, 2800, 224000);

/*Se realiza la primera consulta básica */
SELECT nombre_producto, precio_producto_unitario_venta
FROM producto;

/*Se realiza la segunda consulta básica */
SELECT nombre_proveedor, direccion_proveedor
FROM proveedores;

/*Se realiza la consulta con JOIN */
SELECT producto.nombre_producto AS Producto, tipo_producto.nombre_tipo_producto AS Tipo
FROM producto JOIN tipo_producto ON producto.tipo_producto_id = tipo_producto.id_tipo_producto;







