create DATABASE Hoteleria;
/*==============================================================*/
/* Table: TipoPersonal                                          */
/*==============================================================*/
create table TipoPersonal 
(
   id_tipo_personal  integer not null,
   nombre_tipo       varchar(30),
   descripcion_tipo   varchar(70) ,
    primary key (id_tipo_personal)
);
/*==============================================================*/
/* Table: Personal                                              */
/*==============================================================*/
create table Personal 
(
   id_personal  integer not null,
   id_tipo_personal  integer not null,
   cedula int,
   nombres varchar(30),
   telefono1 int,
   telefono2 int,
   direccion1 varchar(60),
   direccion2 varchar(60),
   email varchar(60),
   primary key (id_personal),
   foreign key (id_tipo_personal) references TipoPersonal (id_tipo_personal)
);

/*==============================================================*/
/* Table: Cliente                                              */
/*==============================================================*/
create table Cliente 
(
   id_cliente  integer not null,
   cedula int,
   nombres varchar(30),
   telefono1 int,
   telefono2 int,
   direccion1 varchar(60),
   direccion2 varchar(60),
   email varchar(60),
   primary key (id_cliente)
);

/*==============================================================*/
/* Table: Factura                                              */
/*==============================================================*/
create table Factura 
(
   id_factura  integer not null,
   id_cliente  integer not null,
   num_factura varchar(10),
   total float,
   fecha date,
   primary key (id_factura),
   foreign key (id_cliente) references Cliente (id_cliente)
);
/*==============================================================*/
/* Table: Servicio                                              */
/*==============================================================*/
create table Servicio 
(
   id_servicio  integer not null,
   nombre_servicio varchar(20),
   costo_servicio float,
   descripcion varchar(60),
   primary key (id_servicio)
);
/*==============================================================*/
/* Table: Promocion                                              */
/*==============================================================*/
create table Promocion 
(
   id_promocion  integer not null,
   descripcion varchar(60),
   porcentaje_descuento int,
   primary key (id_promocion)
);
/*==============================================================*/
/* Table: Paquete                                              */
/*==============================================================*/
create table Paquete 
(
   id_paquete  integer not null,
   id_servicio integer not null,
   id_promocion integer not null,
   Costo float,
   fecha date,
   primary key (id_paquete),
   foreign key (id_servicio) references Servicio (id_servicio),
   foreign key (id_promocion) references Promocion (id_promocion)
);


/*==============================================================*/
/* Table: Habitacion                                              */
/*==============================================================*/
create table Habitacion 
(
   id_habitacion  integer not null,
   numero_cama int,
   descripcion varchar(50),
   primary key (id_habitacion)
);

/*==============================================================*/
/* Table: Reservacion                                              */
/*==============================================================*/
create table Reservacion 
(
   id_reservacion  integer not null,
   id_cliente  integer not null,
   id_paquete  integer not null ,
   id_habitacion integer not null,
   descripcion varchar(50),
   fecha_inicio date,
   fecha_fin date,
   Calificacion varchar(15),
   primary key (id_reservacion),
   foreign key (id_cliente) references Cliente (id_cliente),
   foreign key (id_paquete) references Paquete (id_paquete),
   foreign key (id_habitacion) references Habitacion (id_habitacion)
);


/*==============================================================*/
/* Table: Mantenimiento                                              */
/*==============================================================*/
create table Mantenimiento 
(
   id_mantenimiento  integer not null,
   id_habitacion  integer not null,
   nombre varchar(50),
   recursos varchar(50),
   primary key (id_mantenimiento),
   foreign key (id_habitacion) references Habitacion (id_habitacion)
);
/*==============================================================*/
/* Table: Servicio                                              */
/*==============================================================*/
create table PersonalServicio 
(
   id_servicio  integer not null,
   id_personal integer not null,
   fecha date,
   primary key (id_servicio,id_personal),
   foreign key (id_servicio) references Servicio (id_servicio),
   foreign key (id_personal) references Personal (id_personal)
);
/*==============================================================*/
/* Table: DetalleFactura                                              */
/*==============================================================*/
create table DetalleFactura 
(
   id_detalle  integer not null,
   id_factura  integer not null,
   id_paquete integer not null,
   num_detalle varchar(10),
   costo_detalle float,
   cantidad int,
   primary key (id_detalle),
   foreign key (id_factura) references Factura (id_factura),
   foreign key (id_paquete) references Paquete (id_paquete)
);

-- Inserciones en la tabla TipoPersonal
insert into TipoPersonal values(1,'Recepcion','Persona que receptas los pedidos de los clientes');
insert into TipoPersonal values(2,'Limpieza','Personal que limpia las instalaciones');
insert into TipoPersonal values(3,'Administracion','Personal que administra recursos del hotel');
select * from TipoPersonal;
-- Inserciones en la tabla Personal
insert into Personal values (1,1,1302546895,'Omar Diaz',0965243125,0954284521,'Av 1 y Av 2','Calle Comercio y Sucre','omar@gmail.com');
insert into Personal values (2,1,1302546895,'Andres Suarez',0965243125,0954284521,'Av 1 y Av 2','Calle Comercio y Sucre','andre@gmail.com');
insert into Personal values (3,2,1302546895,'Fernando Palma',0965243125,0954284521,'Av 1 y Av 2','Cale Comercio y Sucre','fer@gmail.com');
insert into Personal values (4,3,1302546895,'Carlos Fernandez',0965243125,0954284521,'Av 1 y Av 2','Calle Comercio y Sucre','carlos@gmail.com');
select * from Personal;
-- Inserciones en la tabla Cliente
insert into Cliente values (1,1302546895,'Pedro Garcia',0965243125,0954284521,'Av 1 y Av 2','Cale Comercio y Sucre','pedro@gmail.com');
insert into Cliente values (2,1302546895,'Iker Laz',0965243125,0954284521,'Av 1 y Av 2','Cale Comercio y Sucre','ikerl@gmail.com');
insert into Cliente values (3,1302546895,'Pablo Moreira',0965243125,0954284521,'Av 1 y Av 2','Cale Comercio y Sucre','pablo11@gmail.com');
insert into Cliente values (4,1302546895,'Jaime Quimiz',0965243125,0954284521,'Av 1 y Av 2','Cale Comercio y Sucre','jaime10@gmail.com');
insert into Cliente values (5,1302546895,'Alejandro Intriago',0965243125,0954284521,'Av 1 y Av 2','Cale Comercio y Sucre','ale@gmail.com');
select * from cliente;
-- Inserciones en la tabla Factura
insert into Factura values (1,1,'FACT-001',1000,'2021-05-02');
insert into Factura values (2,2,'FACT-002',2000,'2020-08-10');
insert into Factura values (3,2,'FACT-003',50000,'2020-07-15');
insert into Factura values (4,3,'FACT-004',10000,'2022-10-24');
insert into Factura values (5,4,'FACT-005',30000,'2021-12-30');
select * from factura;
-- Inserciones en la tabla Servicio
insert into servicio values(1,'Restaurante',300,'Comida gourmet preparada por chefs');
insert into servicio values(2,'Licoreria',100,'Todo tipo de licor');
insert into servicio values(3,'Masaje',90,'Masajes relajantes');
insert into servicio values(4,'Discoteca',70,'Diversion en las noches');
insert into servicio values(5,'Television por cable',20,'DIRECTV en las habitaciones');
select * from servicio;
-- Inserciones en la tabla Promocion
insert into promocion values(1,'Promocion por vacaciones',50);
insert into promocion values(2,'Promocion matrimonio',20);
insert into promocion values(3,'Promocion por historial',60);
insert into promocion values(4,'Promocion familiar',40);
select * from promocion;
-- Inserciones en la tabla paquete
insert into paquete values (1,1,2,300,'2021-05-02');
insert into paquete values (2,1,1,250,'2021-06-20');
insert into paquete values (3,3,3,300,'2022-09-10');
insert into paquete values (4,5,2,300,'2022-09-10');
insert into paquete values (5,2,3,300,'2022-09-10');
insert into paquete values (6,3,4,300,'2021-09-10');
insert into paquete values (7,4,4,300,'2022-09-10');
select * from paquete;
-- Inserciones en la tabla Habitacion
insert into habitacion values (1,2,'Suite');
insert into habitacion values (2,3,'Normal');
insert into habitacion values (3,1,'Presidencial');
insert into habitacion values (4,4,'Suite');
insert into habitacion values (5,3,'Normal');
insert into habitacion values (6,3,'Normal');
insert into habitacion values (7,3,'Normal');
insert into habitacion values (8,5,'Normal');
select * from habitacion;
-- Inserciones en la tabla Reservacion
insert into reservacion values (1,2,1,1,'Reserva x','2021-05-05','2021-05-08','Buena');
insert into reservacion values (2,1,2,2,'Reserva y','2021-06-22','2021-06-24','Regular');
insert into reservacion values (3,3,3,2,'Reserva z','2022-09-10','2022-09-13','Buena');
insert into reservacion values (4,3,3,8,'Reserva a','2022-09-13','2022-09-15','Mala');
insert into reservacion values (5,4,5,5,'Reserva b','2022-09-11','2022-09-16','Buena');
insert into reservacion values (6,3,3,6,'Reserva a','2022-09-13','2022-09-15','Mala');
insert into reservacion values (7,1,4,7,'Reserva y','2021-06-22','2021-06-24','Regular');
insert into reservacion values (8,2,4,3,'Reserva y','2021-06-22','2021-06-24','Regular');
insert into reservacion values (9,1,4,4,'Reserva y','2021-06-22','2021-06-24','Regular');
insert into reservacion values (10,2,1,4,'Reserva x','2021-05-05','2021-06-20','Buena');
insert into reservacion values (11,3,2,4,'Reserva x','2021-05-05','2021-06-20','Buena');
select * from reservacion;
-- Inserciones en la tabla Mantenimiento
insert into Mantenimiento values(1,1,'Mantenimiento a las camas','kit de herramientas');
insert into Mantenimiento values(2,1,'Mantenimiento a los televisores','kit de herramientas');
insert into Mantenimiento values(3,2,'Mantenimiento a los banos','kit de herramientas y sifoneros');
insert into Mantenimiento values(4,3,'Mantenimiento a las puertas','kit de herramientas');
insert into Mantenimiento values(5,4,'Mantenimiento a las camas','kit de herramientas');
select * from mantenimiento;
-- Inserciones en la tabla personalservicio
insert into personalservicio values (1,1,'2021-05-07');
insert into personalservicio values (2,1,'2022-05-07');
insert into personalservicio values (3,2,'2021-10-11');
insert into personalservicio values (4,3,'2020-06-07');
insert into personalservicio values (5,2,'2021-12-13');
insert into personalservicio values (1,3,'2022-01-24');
insert into personalservicio values (5,1,'2022-11-14');
select * from personalservicio;
-- Inserciones en la tabla detallefactura
insert into detallefactura values(1,1,2,'DET-001',500,1);
insert into detallefactura values(2,3,1,'DET-002',200,1);
insert into detallefactura values(3,5,3,'DET-003',900,2);
insert into detallefactura values(4,3,5,'DET-004',300,1);
insert into detallefactura values(5,4,1,'DET-005',400,2);
insert into detallefactura values(6,3,6,'DET-006',400,2);
insert into detallefactura values(7,2,7,'DET-007',400,2);
SELECT * FROM DETALLEFACTURA;



/*CONSULTAS*/
-- 1. Historico de Ingresos por habitacion
select 
	extract (year from factura.fecha) as año ,
	habitacion.id_habitacion as Numero_habitacion,
	sum(factura.total) as Ingresos
from
	habitacion
inner join reservacion on reservacion.id_habitacion = habitacion.id_habitacion
inner join cliente on cliente.id_cliente = reservacion.id_cliente
inner join factura on cliente.id_cliente = factura.id_cliente
	group by año,habitacion.id_habitacion
	order by año asc;
-- 2. Historico de Ingreso por Clientes
select 
	extract (year from factura.fecha) as año ,
	cliente.nombres as Nombre_cliente,
	sum(factura.total) as Ingresos
from 
	cliente
inner join factura on cliente.id_cliente = factura.id_cliente
group by año,cliente.nombres
order by año asc;

-- 3. Historico de Ingresos por servicios que no son alojamiento
select 
	extract (year from factura.fecha) as año ,
	servicio.nombre_servicio as Nombre_servicio,
	sum(factura.total) as Ingresos
from servicio
inner join paquete on paquete.id_servicio = servicio.id_servicio
inner join detallefactura on detallefactura.id_paquete = paquete.id_paquete
inner join factura on factura.id_factura = detallefactura.id_factura
	where servicio.nombre_servicio != 'Alojamiento'
	group by año,servicio.nombre_servicio
	order by año asc;
-- 4. Historico de calificaciones por anio en habitaciones

select 
	extract (year from reservacion.fecha_fin) as año ,
	habitacion.id_habitacion as Numero_habitacion,
    reservacion.calificacion as Calificacion,
	count(reservacion.calificacion) as Cantidad_calificaciones
from
reservacion
inner join habitacion on reservacion.id_habitacion = habitacion.id_habitacion
	group by año ,habitacion.id_habitacion,reservacion.calificacion
	order by año asc;
/* 5. Trigger: Que impida que a un cliente se le de una reservación en el hotel cuando este cliente haya tenido en las 
ultimas dos veces que estuvo en el hotel 2 calificaciones malas.*/

CREATE or replace FUNCTION triggerreservacion() 
   RETURNS TRIGGER  as $triggerreservacion$
BEGIN
   if (select count(*) from reservacion inner join cliente on reservacion.id_cliente = cliente.id_cliente 
	   where reservacion.calificacion = 'Mala' 
	   group by reservacion.id_cliente having count(*) = 3)
   then
raise notice ' "ERROR" No puede ingresar una nueva reservacion!';
   end if;
   return null;
END;
$triggerreservacion$ language 'plpgsql';
 
CREATE or replace TRIGGER  triggerreservacion AFTER  insert 
   ON reservacion
   FOR EACH ROW EXECUTE PROCEDURE triggerreservacion();
   
insert into reservacion values (1,3,3,1,'Reserva a','2022-09-13','2022-09-15','Mala');
insert into reservacion values (2,3,3,1,'Reserva b','2022-09-13','2022-09-15','Mala');
insert into reservacion values (3,3,4,1,'Reserva b','2022-09-13','2022-09-15','Mala');
select *  from reservacion;



-- 6.Cursor
-- Mostrar por año cuantas familias se han registrado en cada habitacion y cuanto dinero se ha recaudado por esa habitacion
begin;
declare Cursor_familia_ingresos cursor for 
select
extract(year from (Factura.fecha)) as anioo,
Habitacion.id_habitacion as numero_habitacion  ,
count(promocion.id_promocion) as cantidad_familias,
SUM(Factura.total) as total_ingresos
from Factura
inner join Detallefactura on detallefactura.id_factura = Factura.id_factura
inner join paquete on paquete.id_paquete=detallefactura.id_paquete
inner join promocion on paquete.id_promocion=promocion.id_promocion
inner join reservacion on paquete.id_paquete=reservacion.id_paquete
inner join habitacion on reservacion.id_habitacion=habitacion.id_habitacion
group by anioo,Habitacion.id_habitacion;
--open Cursor_familia_ingresos;
FETCH Cursor_familia_ingresos ;
commit;
close Cursor_familia_ingresos;


-- 7.Procedimiento almacenado 
-- Ingresar como parametro el nombre de un cliente y me consulte por año cuantas reservas ha tenido
begin;
CREATE OR replace FUNCTION reserva(clientenombre varchar) RETURNS TABLE(anio text,cliente varchar,cantidad int)
as $$
select 
		extract (year from (reservacion.fecha_inicio)) as año,
        nombres as cliente,
        count(*) as cantidad_reservacion
	from
		Reservacion
		inner join cliente on cliente.id_cliente = Reservacion.id_cliente
	where cliente.nombres=clientenombre
	group by  año,cliente.nombres;
$$ 
LANGUAGE SQL STABLE;
end;
select reserva('Pedro Garcia') as Reservas;

--8. Reporte en Diagrama de barras de los Ingresos por año
select 
	extract(year from(factura.fecha)) as año,
	sum(factura.total) as Ingresos
from Factura
group by año;





	   
