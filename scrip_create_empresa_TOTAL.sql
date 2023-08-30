CREATE SCHEMA empresa;
USE empresa;

-- CREACCION DE LAS TABLAS DEL SCHEMA

CREATE TABLE clientes(
 n_cliente INT NOT NULL auto_increment,
 nombre VARCHAR(30) NOT NULL,
 apellido varchar(30),
 dni INT NOT NULL,
 email VARCHAR(50),
 PRIMARY KEY(n_cliente));
 
CREATE TABLE  sectores(
 n_sector INT NOT NULL auto_increment,
 nombre VARCHAR(50),
 PRIMARY KEY(n_sector));
 
CREATE TABLE   empleados(
 n_empleado INT NOT NULL auto_increment,
 nombre VARCHAR(30) NOT NULL,
 apellido varchar(30) not null,
 DNI INT NOT NULL,
 sueldo INT,
 n_sector INT NOT NULL,
 email VARCHAR(50),
 PRIMARY KEY(n_empleado),
 FOREIGN KEY(n_sector) REFERENCES sectores(n_sector));
 
  CREATE TABLE categorias(
 n_categoria int auto_increment,
 nombre VARCHAR(50),
 PRIMARY KEY(n_categoria));
 
CREATE TABLE  productos(
 n_producto INT NOT NULL auto_increment,
 nombre VARCHAR(30) NOT NULL,
 precio float,
 precio_final float,
 categoria INT,
 n_proveedor INT NOT NULL,
 PRIMARY KEY(n_producto),
 FOREIGN KEY(categoria) references categorias(n_categoria));
 
 
CREATE TABLE proveedores(
 n_proveedor INT NOT NULL auto_increment,
 nombre VARCHAR(30) NOT NULL,
 email varchar(50),
 telefono int,
 PRIMARY KEY(n_proveedor));
 
CREATE TABLE  stock(
 n_producto INT NOT NULL,
 cantidad INT,
 vencimiento DATE,
 n_proveedor INT NOT NULL,
 PRIMARY KEY(n_producto,n_proveedor),
 FOREIGN KEY(n_producto) REFERENCES productos(n_producto),
 FOREIGN KEY(n_proveedor)REFERENCES proveedores(n_proveedor));
 
CREATE TABLE  pedidos(
 n_pedido INT NOT NULL AUTO_INCREMENT,
 n_cliente INT NOT NULL,
 n_producto INT NOT NULL,
 cantidad int,
 fecha DATE,
 PRIMARY KEY(n_pedido),
 FOREIGN KEY(n_cliente) REFERENCES clientes(n_cliente),
 FOREIGN KEY(n_producto)REFERENCES productos(n_producto));
 
CREATE TABLE ventas(
 n_venta INT NOT NULL AUTO_INCREMENT,
 n_empleado INT NOT NULL,
 n_pedido INT NOT NULL,
 n_cliente INT NOT NULL,
 fecha DATE,
 PRIMARY KEY(n_venta),
 FOREIGN KEY(n_pedido) REFERENCES pedidos(n_pedido),
 FOREIGN KEY(n_empleado) REFERENCES empleados(n_empleado),
 FOREIGN KEY(n_cliente) REFERENCES clientes(n_cliente));
  
CREATE TABLE  decomisos(
 n_decomiso INT NOT NULL AUTO_INCREMENT,
 n_empleado INT NOT NULL,
 cantidad INT,
 motivo VARCHAR(250) NOT NULL,
 n_producto INT NOT NULL,
 fecha DATE,
 PRIMARY KEY(n_decomiso),
 FOREIGN KEY(n_empleado) REFERENCES empleados(n_empleado),
 FOREIGN KEY(n_producto) REFERENCES productos(n_producto));
 
CREATE TABLE  ingresos(
 n_ingreso INT NOT NULL AUTO_INCREMENT,
 n_empleado INT NOT NULL,
 n_proveedor INT NOT NULL,
 n_producto INT NOT NULL,
 cantidad INT NOT NULL,
 fecha DATE,
 PRIMARY KEY(n_ingreso),
 FOREIGN KEY(n_empleado) REFERENCES empleados(n_empleado),
 FOREIGN KEY(n_proveedor) REFERENCES proveedores(n_proveedor),
 FOREIGN KEY(n_producto) REFERENCES productos(n_producto));

 CREATE TABLE _DECOMISOS(
 N_DECOMISO INT,
 N_EMPLEADO INT,
 n_producto int,
 MOTIVO VARCHAR(100),
 FECHA datetime);

 CREATE TABLE _INGRESOS(
 n_ingreso INT,
 n_producto INT,
 cantidad INT,
 FECHA DATETIME);

-- INSERSERCION DE DATOS

-- TABLA SECTORES

INSERT INTO sectores values(null,'Deposito'),
						   (null,'Mantenimiento'),
						   (null,'Ventas)'),
						   (null,'Secretaria'),
                           (null,'Administativo');

-- TABLA EMPLEADOS

INSERT INTO empleados(nombre,apellido,dni,sueldo,n_sector,email) 
VALUES('omar','calixto',34567609,10000,4,'omar@gamil.com'),
      ('julian','martin',34567325,20000,3,'juliam@gamil.com'),
      ('valentin','gutierrez',34587765,12000,2,'valen_45@gamil.com'),
      ('josefina','alvarez',34567365,10000,4,'jose_fina@gamil.com'),
      ('juan','perez',34512765,20000,3,'atr_juan@gamil.com'),
	  ('vicente','canizzo',34554765,12000,2,'vicente23@gamil.com'),
      ('julieta','villegas',34787765,18000,1,'villa_juli@gamil.com'),
      ('floerencia','steiner',34117765,18000,1,'flooor_mza@gamil.com'),
      ('aneley','massa',34567711,20000,3,'ane_bonita@gamil.com'),
      ('fernanda','chimeno',34567700,15000,5,'ferchu_04@gamil.com'),
      ('jose','ortuvia',34567755,18000,1,'ortu-jose@gamil.com'),
      ('ana','gimenez',34567722,10000,4,'gimenita@gamil.com'),
      ('gabriela','transito',34567555,20000,3,'semaforoactivo@gamil.com'),
      ('maximiliano','alba',34567360,18000,1,'elgordonoduerme@gamil.com'),
	  ('daniela','quiroga',35567761,18000,1,'bombona@gamil.com'),
	  ('belen','rojas',36567765,15000,5,'rojas_moras@gamil.com'),
      ('paola','garrido',38544322,15000,5,'garrido_full@gamil.com'),
	  ('estefania','suarez',33567476,20000,3,'tefi89@gamil.com'),
      ('sofia','ormeno',22435690,20000,3,'flocloremax@gamil.com');

-- TABLA CLIENTES

INSERT INTO CLIENTES(nombre,dni,apellido,email)
VALUES('Matty',33495362,'Yeld','myeld0@topsy.com'),
      ('Susanetta',11471718,'Soughton','ssoughton1@wiley.com'),
      ('Merilyn',34603340,'Appleford','mappleford2@symantec.com'),
      ('Kristien',74803902,'Andreucci','kandreucci3@jimdo.com'),
      ('Frederigo',48982022,'Dilkes','fdilkes4@yellowbook.com'),
	  ('Jacky',54157057,'Berriball','jberriball5@chronoengine.com'),
      ('Annadiana',83907014,'Trower','atrower6@spiegel.de'),
      ('Trisha',84950505,'Bourges','tbourges7@comsenz.com'),
      ('Dean',93118773,'Housecraft','dhousecraft8@behance.net'),
      ('Tanner',41173047,'Cranke','tcranke9@go.com'),
      ('Minny',06486887,'Ruzicka','mruzickaa@wunderground.com'),
      ('Kele',97800390,'Ritmeyer','kritmeyerb@oaic.gov.au'),
      ('Dredi',61032099,'Jencken','djenckenc@seattletimes.com'),
      ('Hanson',26353262,'Sterzaker','hsterzakerd@aboutads.info'),
      ('Siana',88611350,'Dashper','sdashpere@theglobeandmail.com'),
      ('Giustino',45429296,'Kempe','gkempef@google.nl'),
      ('Sada',15402026,'Pechold','specholdg@netlog.com'),
      ('Moyra',42642469,'Persey','mperseyh@wix.com'),
      ('Lanette',90235521,'Easeman','leasemani@columbia.edu'),
      ('Lucien',35955437,'Stollenbeck','lstollenbeckj@photobucket.com');

-- TABLA PROVEEDORES

INSERT INTO PROVEEDORES(nombre,email,telefono)
VALUES('calsa','calsa@gmail.com',2345671),
      ('narampol','naram@gmail.com',1256891),
      ('pepitos','pepe@mail.com',3254892),
      ('da nica','danica@mail.com',5476129),
      ('obleas','o@hotmail.com',3256870);



-- TABLA CATEGORIAS

INSERT INTO CATEGORIAS VALUES(NULL,'Alimentos'),
                             (NULL,'Snack'),
                             (NULL,'Cigarrillos'),
                             (NULL,'Bebidas'),
                             (NULL,'Limpieza'),
                             (NULL,'infusiones'),
                             (NULL,'golosinas');
                             
-- TABLA PRODUCTOS

INSERT INTO PRODUCTOS(nombre,precio,precio_final,categoria,n_proveedor)
VALUES('Sopa' ,9,10.89,1,2),
	  ('papas fritas',109,131.89,2,1),
      ('cigarrillos - Assorted Box',93,112.53,3,5),
      ('Cereales',8,9.68,2,3),
      ('Cookie - Dough Variety',71,85.91,2,5),
      ('Banana Daiquiri',3,3.63,4,3),
      ('Cheese - Grana Padano',540,653.4,7,2),
      ('Cup - Paper',78,94.38,5,1),
      ('Vinagre - Red Wine',43,52.03,1,4),
      ('jugo - Canned Premium',84,101.64,4,2),
      ('Pesto - Primerba Paste',78,94.38,1,3),
      ('chocolate - Choc Chk',05,6.05,7,4),
      ('barras All Bran Bars',11,13.31,7,1),
      ('Pepper - Red Thai',61,73.81,4,3),
	  ('Pepper Squash',98,118.58,4,2),
      ('Te - English Breakfast',874,1057.54,6,4),
      ('Cornflakes',61,73.81,7,5),
      ('Glass - Juice Clear',18,21.78,5,5),
      ('Ecolab - Mikroklene',66,79.86,4,2);
      
-- TABLA PEDIDOS

INSERT INTO pedidos(n_cliente,n_producto,cantidad,fecha)
VALUES(14,3,15,'2023-02-01'),
      (12,4,10,'2023-02-01'),
      (1,10,10,'2023-02-01'),
      (18,15,8,'2023-02-01'),
      (3,8,15,'2023-02-01'),
	  (8,6,8,'2023-02-01'),
	  (5,2,8,'2023-02-01'),
      (15,3,15,'2023-02-01'),
      (7,9,12,'2023-02-01'),
      (14,11,10,'2023-02-01'),
      (14,3,15,'2018-02-01'),
      (12,4,10,'2028-02-01'),
      (1,10,8,'2019-02-01'),
      (18,15,15,'2019-02-01'),
      (3,8,10,'2020-02-01'),
      (8,6,15,'2020-02-01'),
      (5,2,8,'2022-02-01'),
      (15,3,8,'2022-02-01'),
      (7,9,10,'2022-02-01'),
      (14,11,15,'2022-02-01');
      
-- TABLA VENTAS

INSERT INTO ventas(n_empleado,n_pedido,n_cliente,fecha)
VALUES(13,20,12,'2023-02-01'),
      (13,19,1,'2023-02-01'),
      (18,18,4,'2023-02-01'),
      (18,17,1,'2023-02-01'),
      (19,16,7,'2023-02-01'),
      (9,15,8,'2023-02-01'),
      (5,14,9,'2023-02-01'),
      (13,13,13,'2023-02-01'),
      (2,12,12,'2023-02-01'),
      (2,11,3,'2023-02-01'),
      (18,10,2,'2018-02-01'),
      (19,9,6,'2028-02-01'),
      (19,8,18,'2019-02-01'),
      (18,7,17,'2019-02-01'),
      (2,6,3,'2020-02-01'),
      (18,5,5,'2020-02-01'),
      (5,4,4,'2022-02-01'),
      (9,3,9,'2022-02-01'),
      (9,2,15,'2022-02-01'),
      (19,1,19,'2022-02-01');
	
      
-- TABLA INGRESOS

INSERT INTO ingresos(n_empleado,n_proveedor,n_producto,cantidad,fecha)
VALUES(11,3,4,40,'2023-02-01'),
      (11,5,3,10,'2023-02-05'),
      (11,2,1,50,'2023-02-01'),
      (15,3,4,30,'2023-02-08'),
      (15,5,5,25,'2023-02-04'),
      (15,5,17,12,'2023-02-10'),
      (8,3,6,11,'2023-02-01'),
      (8,2,7,17,'2023-02-01'),
      (7,5,18,90,'2023-02-01'),
      (15,3,11,78,'2023-02-01'),
      (15,2,10,46,'2018-02-09'),
	  (8,5,3,33,'2018-02-04'),
      (8,3,14,22,'2019-02-01'),
      (11,5,5,19,'2019-02-01'),
      (7,5,17,67,'2020-02-03'),
      (11,3,4,73,'2020-02-09'),
      (11,2,15,23,'2022-02-05'),
      (11,3,6,12,'2022-02-02'),
      (11,1,13,15,'2022-02-01'),
      (7,1,8,84,'2022-02-01');

-- TABLA DECOMISOS

INSERT INTO decomisos(n_empleado,cantidad,motivo,n_producto,fecha)
VALUES(7,4,'vencido',3,'2023-02-01'),
      (7,10,'rotura',15,'2023-02-05'),
      (8,5,'vencido',18,'2023-02-01'),
      (11,3,'vencido',4,'2023-02-08'),
      (14,12,'vencido',12,'2023-02-04'),
      (15,1,'vencido',11,'2023-02-10'),
      (14,1,'devoluciones',11,'2023-02-01'),
      (7,1,'rotura',5,'2023-02-01'),
      (8,9,'rotura',4,'2023-02-01'),
      (14,8,'devoluciones',7,'2023-02-01'),
      (15,6,'devoluciones',9,'2018-02-09'),
      (11,3,'vencido',7,'2018-02-04'),
      (11,2,'vencido',9,'2019-02-01'),
      (15,11,'vencido',19,'2019-02-01'),
      (7,6,'rotura',16,'2020-02-03'),
      (7,7,'rotura',15,'2020-02-09'),
      (7,3,'rotura',13,'2022-02-05'),
      (8,2,'vencido',14,'2022-02-02'),
      (11,5,'rotura',17,'2022-02-01'),
      (14,8,'vencido',8,'2022-02-01');      

-- TABLA STOCK

INSERT INTO stock(n_producto,cantidad,vencimiento,n_proveedor)
VALUES(1,20,'2027-06-02',2),
      (2,50,'2028-04-02',1),
      (3,30,'2023-09-12',5),
      (4,100,'2024-04-08',3),
      (5,70,'2024-03-05',5),
      (6,90,'2025-09-03',3),
      (7,120,'2025-02-05',2),
      (8,150,'2026-04-12',1),
      (9,170,'2025-01-05',4),
      (10,200,'2024-04-12',2),
      (11,230,'2028-03-22',3),
      (12,30,'2024-06-02',4),
      (13,320,'2026-08-12',1),
      (14,230,'2024-07-03',3),
      (15,60,'2025-04-02',2),
      (16,70,'2026-08-06',4),
      (17,130,'2023-04-01',5),
      (18,109,'2024-07-07',5),
      (19,288,'2025-04-02',2);
      
      
-- CREACIONES DE VISTAS

CREATE VIEW ventas_empleados AS (
SELECT e.nombre, count(*) AS cantidad_ventas FROM ventas v 
JOIN empleados e ON e.n_empleado = v.n_empleado GROUP BY v.n_empleado);

CREATE VIEW producto_max_decomisado AS (
SELECT p.nombre,d.motivo,d.cantidad FROM decomisos d
JOIN productos p ON d.n_producto = p.n_producto
 WHERE cantidad = (SELECT max(cantidad)FROM decomisos));

CREATE VIEW contacto_proveedores AS(
SELECT pv.nombre AS proveedor,pd.nombre AS producto,pv.telefono FROM productos pd
JOIN proveedores pv ON pd.n_proveedor = pv.n_proveedor
  GROUP BY n_producto);
  
  CREATE VIEW  mayor_stock AS (
  SELECT p.nombre, s.cantidad,s.vencimiento FROM stock s
  JOIN productos p ON s.n_producto = p.n_producto 
  WHERE cantidad =(SELECT max(cantidad) FROM stock));

CREATE VIEW cliente_mayor_pedidos AS (
SELECT c.nombre,count(p.n_pedido) AS cantidad FROM pedidos p
JOIN clientes c ON p.n_cliente = c.n_cliente
 GROUP BY p.n_cliente ORDER BY cantidad desc LIMIT 1);
 
 
-- CRACIONES DE FUNCIONES

DELIMITER //
CREATE FUNCTION `sumar_iva`(precio float) returns float
DETERMINISTIC

BEGIN
DECLARE total_iva float;
SET total_iva = (precio * 1.21);
RETURN total_iva;

END//

DELIMITER ;

DELIMITER //
CREATE FUNCTION cant_empleado_sector (sector int) RETURNS int
DETERMINISTIC
BEGIN
DECLARE empleados_sector int;
SET empleados_sector = (SELECT count(*) FROM empleados  WHERE n_sector = sector);
return empleados_sector;

END//
DELIMITER ;

-- funcion realizada para usar en el SP(1)
DELIMITER //
CREATE FUNCTION `multiplicar`(param1 int,param2 int) RETURNS INT
DETERMINISTIC
BEGIN
declare resultado int;
SET resultado = (param1 * param2);
return resultado;
END//
DELIMITER ;


-- CREACIÓN DE STORED PROCEDURE

-- multiplica la cantidad de cada producto por su precio y luego suma todos los resultados 
-- para dar el total de dinero que hay invertido en stock
DELIMITER //
CREATE procedure `inversion_stock` ( OUT total int)
BEGIN
SET TOTAL =(
SELECT SUM( multiplicar(s.cantidad,p.precio)) as total from stock s
JOIN productos p ON s.n_producto = p.n_producto);
END//
DELIMITER ;

-- modifica la tabla stock en el campo cantidad sumandole al stock actual un nuevo ingreso de mercaderia
DELIMITER //
CREATE PROCEDURE ingresar_stock(IN ingreso INT, IN producto INT)
BEGIN
UPDATE stock SET cantidad = (cantidad + ingreso) where n_producto = producto;
END //
DELIMITER ;


-- CREACION DE TRIGGER

 CREATE TRIGGER `AU_DECOMISO`
 AFTER INSERT ON decomisos
 FOR EACH ROW 
 INSERT INTO _decomisos (n_decomiso,n_empleado,n_producto,motivo,fecha)
 values(new.n_decomiso,new.n_empleado,new.n_producto,new.motivo,current_timestamp());
 
 
  DELIMITER //
 CREATE TRIGGER `FECHA`
 BEFORE INSERT ON DECOMISOS
 FOR EACH ROW
 BEGIN
 SET NEW.FECHA = current_timestamp();
 END//
DELIMITER ; 








