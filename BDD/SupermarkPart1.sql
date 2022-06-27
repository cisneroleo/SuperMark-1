DROP DATABASE supermark;
CREATE DATABASE supermark CHARACTER SET utf8mb4;
USE supermark;

CREATE TABLE usuarios(
id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido1 VARCHAR(30) NOT NULL,
apellido2 VARCHAR(30),
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(9),
fecha_nacimiento DATE NOT NULL,
sexo ENUM('M','F') NOT NULL,

username VARCHAR(18)not null,
-- salted pasword
pasword VARCHAR(18)not null,
email VARCHAR(50) NOT NULL,
lastLogin DATETIME
);

CREATE TABLE clientes(
id_cliente INT UNSIGNED PRIMARY KEY,
FOREIGN KEY (id_cliente) REFERENCES usuarios(id_usuario),
regular BOOLEAN NOT NULL
);

CREATE TABLE admins(
id_admin INT UNSIGNED PRIMARY KEY,
FOREIGN KEY (id_admin) REFERENCES usuarios(id_usuario)
);

-- borrar tabla producto, es to esta solo para testear
CREATE TABLE productos(
id_producto int unsigned auto_increment primary key
);

CREATE TABLE ordenes(
id_orden INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
fecha DATE NOT NULL,
pagoTipo ENUM('efectivo', 'Tdebito', 'Tcredito'),
precioTotal float,
id_cliente INT UNSIGNED,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itemOrden(
id_itemOrden INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_orden INT UNSIGNED,
id_producto INT UNSIGNED,
FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
cantidad INT UNSIGNED NOT NULL,
precioTotal FLOAT
);




