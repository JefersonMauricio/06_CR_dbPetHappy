CREATE DATABASE dbPetHappy
GO

USE dbPetHappy
GO

CREATE TABLE CLIENTE (
    CODCLI char(6)  NOT NULL,
    DNICLI char(8)  NOT NULL,
    NOMCLI varchar(40)  NOT NULL,
    APECLI varchar(50)  NOT NULL,
    CELCLI char(9)  NOT NULL,
    EMACLI varchar(80)  NOT NULL,
    ESTACLI char(1)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY (CODCLI)
);
GO

--Creamos la tabla VENDEDOR
CREATE TABLE VENDEDOR (
    CODVEND char(6)  NOT NULL,
    NOMVEND varchar(50)  NOT NULL,
    APEVEND varchar(50)  NOT NULL,
    DNIVEND char(8)  NOT NULL,
    CELVEND char(9)  NOT NULL,
    DOMVEND varchar(80)  NOT NULL,
    ESTVEND char(1)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    CONSTRAINT VENDEDOR_pk PRIMARY KEY  (CODVEND)
);
GO

CREATE TABLE PRODUCTO (
    CODPROD char(4)  NOT NULL,
    NOMPROD varchar(50)  NOT NULL,
    PREPROD decimal(4,2)  NOT NULL,
	STOPROD integer NOT NULL,
    CATPROD char(1)  NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY  (CODPROD)
);
GO

CREATE TABLE UBIGEO (
    CODUBI char(6)  NOT NULL,
    DEPUBI varchar(80)  NOT NULL,
    PROVUBI char(80)  NOT NULL,
    DISTUBI varchar(80)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY  (CODUBI)
);
GO

CREATE TABLE VENTA (
    IDVENT int  NOT NULL IDENTITY(1,1),
    FECVENT date  NOT NULL,
    TIPVENT char(1)  NOT NULL,
    CODVEND char(6)  NOT NULL,
    CODCLI char(6)  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY  (IDVENT)
);
GO

--Creamos la tabla VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENTDET int  NOT NULL IDENTITY(1,1),
    CODPROD char(4)  NOT NULL,
    IDVENT int  NOT NULL,
	CANTVENTDET int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY  (IDVENTDET)
);
GO

--Relacionar Ubigeo -> Cliente
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);
GO

--Relacionar Ubigeo -> Trabajador
ALTER TABLE VENDEDOR ADD CONSTRAINT VENDEDOR_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);
GO

--Relacionar Cliente -> Venta
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (CODCLI)
    REFERENCES CLIENTE (CODCLI);
GO

--Relacionar Producto -> VentaDetalle
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRODUCTO
    FOREIGN KEY (CODPROD)
    REFERENCES PRODUCTO (CODPROD);
GO

--Relacionar Venta -> VentaDetalle
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA
    FOREIGN KEY (IDVENT)
    REFERENCES VENTA (IDVENT);
GO

--Relacionar Trabajador -> Venta
ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR
    FOREIGN KEY (CODVEND)
    REFERENCES VENDEDOR (CODVEND);
GO

--Insertar registros en la tabla UBIGEO
INSERT INTO Ubigeo
(CODUBI, DEPUBI, PROVUBI, DISTUBI)
VALUES
('140401', 'Lima', 'Cañete', 'San Vicente de Cañete'),
('140402', 'Lima', 'Cañete', 'Calango'),
('140403', 'Lima', 'Cañete', 'Cerro Azul'),
('140404', 'Lima', 'Cañete', 'Coayllo'),
('140405', 'Lima', 'Cañete', 'Chilca'),
('140406', 'Lima', 'Cañete', 'Imperial'),
('140407', 'Lima', 'Cañete', 'Lunahuaná'),
('140408', 'Lima', 'Cañete', 'Mala'),
('140409', 'Lima', 'Cañete', 'Nuevo Imperial'),
('140410', 'Lima', 'Cañete', 'Pacarán'),
('140411', 'Lima', 'Cañete', 'Quilmaná'),
('140412', 'Lima', 'Cañete', 'San Antonio'),
('140413', 'Lima', 'Cañete', 'San Luis'),
('140414', 'Lima', 'Cañete', 'Santa Cruz de Flores'),
('140415', 'Lima', 'Cañete', 'Zúñiga'),
('140416', 'Lima', 'Cañete', 'Asia')
GO

--Insertar registros en la tabla CLIENTE
INSERT INTO Cliente
(CODCLI, DNICLI, NOMCLI, APECLI, CELCLI, EMACLI, ESTACLI, CODUBI)
VALUES
('CL0001','45781233','Alicia','García Campos','929185236','agarcia@gmail.com','I','140409'),
('CL0002','15487922','Juana','Ávila Chumpitaz','923568741','javila@gmail.com','A','140402'),
('CL0003','15253588','Oscar','Coronado Vásquez','932615478','ocoronado@gmail.com','A','140403'),
('CL0004','85213566','Luis','Barrios Palomino','932817645','lbarrios@outlook.com','I','140409'),
('CL0005','15482566','María','Tarazona Mendoza','978400123','mtarazona@outlook.com','A','140407'),
('CL0006','15428211','Pedro','Sánchez Dávila','941533268','psanchez@yahoo.com','A','140402'),
('CL0007','47129533','Aldo','Torres Zavala','958866221','atorres@yahoo.com','I','140405'),
('CL0008','48171533','Fiorella','Monteza Alzamora','992255441','fmonteza@gmail.com','A','140408'),
('CL0009','15429866','Gloria','Linares Rodríguez','954415950','glinares@hotmail.com','A','140403'),
('CL0010','85251592','Esperanza','Stark Parker','901133258','estark@yahoo.com','I','140405')
Go

--Insertar registros en la tabla PRODUCTO
INSERT INTO Producto
(CODPROD, NOMPROD, PREPROD,STOPROD,CATPROD)
VALUES 
('P001','MONGE MAXI PUPPY & JUNIOR CHICKEN 12 KG','66.50','100','A'),
('P002','MONGE MINI PUPPY & JUNIOR CHICKEN 3 KG','20.00','100','A'),
('P003','MONGE MEDIUM PUPPY & JUNIOR CHICKEN','24.00','100','A'),
('P004','ROYAL CANIN MAXI ADULTO 15 KG','67.00','100','C'),
('P005','BRIT CARE ADULT LARGE BREED SALMON & POTATO 12 KG','58.50','100','C'),
('P006','BRIT CARE ADULT LARGE BREED LAMB & RICE','52.00','100','C'),
('P007','OPTIMUM SOBRE ADULTO RAZAS PEQUEÑAS POLLO 100 G','7.00','100','E'),
('P008','PRO PLAN ADULTO CARNE POUCH 100 GR','2.50','100','A'),
('P009','ROYAL CANIN MEDIUM PUPPY POUCH 140 GR ','7.00','100','C'),
('P010','ZEUS COLLAR SEMIFIJO ROJO','5.00','100','A'),
('P011','ZEUS ARNES FIGURA A CORAL','6.50','100','A'),
('P012','ZEEDOG NEOPRO BUBBLEGUM H-HARNESS','20.00','100','A'),
('P013','AFP PLATO DE ENFRIAMIENTO','12.00','100','A'),
('P014','ZEEDOG ZEE.MAT CORAL','12.00','100','E'),
('P015','ZEEDOG ZEE.MAT LIME','11.50','100','A'),
('P016','ADIESTRADOR DE CACHORROS 500ML','14.00','100','C'),
('P017','AFP DOG SPARKLE SET','14,00.','100','A'),
('P018','BALSAMO AVENA NATURAL 320 CC','8.00','100','C');
GO

--Insertar registros en la tabla TRABAJADOR
INSERT INTO VENDEDOR
(CODVEND, NOMVEND, APEVEND, DNIVEND, CELVEND, DOMVEND, ESTVEND, CODUBI)
VALUES
('T00001','Jeferson','Mauricio Sanchez','73954835','918304550','Anex.San Jeronimo','A','140401'),
('T00002','Pedro','Porras Luyo','73183575','986062248','Anex. Jita','A','140401')
 GO


/* Insertar la primera VENTA (1) */
INSERT INTO Venta
(FECVENT, TIPVENT, CODVEND, CODCLI)
VALUES
('2022/09/02','D','T00001','CL0001')
GO


 INSERT INTO Venta_Detalle
(CODPROD,CANTVENTDET,IDVENT)
VALUES
('P001','3','1'),
('P008','2','1')
GO