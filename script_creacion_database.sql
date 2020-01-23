CREATE SCHEMA `peliculas_db` DEFAULT CHARACTER SET utf8 ;

create table Categoria(
id_categoria int PRIMARY KEY AUTO_INCREMENT NOT NULL,
cat_nombre VARCHAR(50) NOT NULL
);


create table Producto(
id_producto int PRIMARY KEY AUTO_INCREMENT NOT NULL,
prod_titulo varchar(50) UNIQUE NOT NULL,
id_categoria INT NOT NULL,
prod_genero varchar(50),
prod_año int,
prod_origen varchar(50),
prod_artista varchar(50),
prod_album varchar(50),
prod_episodios int,
prod_temporadas int,
prod_puntaje int default 0,
FOREIGN KEY(id_categoria) REFERENCES Categoria(id_categoria)
);


create table Comentario(
id_comentario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_producto INT NOT NULL,
com_usuario varchar(50) NOT NULL,
com_mensaje varchar(255),
com_puntaje int NOT NULL,
FOREIGN KEY(id_producto) REFERENCES Producto(id_producto) 
);

insert into Categoria(id_categoria,cat_nombre)
values(1,'Pelicula'),(2,'Serie'),(3,'Cancion');


insert into Producto(prod_titulo,id_categoria,prod_genero,prod_año,prod_origen,prod_artista,prod_album,prod_episodios,prod_temporadas )
values('Rocky',1,'Accion',1980,'USA',null,null,null,null),('Rocky 2',1,'Accion',1985,'USA',null,null,null,null),('Rocko',1,'Comedia',1988,'Canada',null,null,null,null),
('Bobs Burguers',2,'Comedia',2011,'USA',null,null,150,9),('Stranger Things',2,'Misterio/Drama',2015,'USA',null,null,36,3),
('Despacito',3,'Rap',2017,'Puerto Rico','Luis Phonsi','LasCanciones',null,null),('Despacito 2',3,'Rap',2020,'Canada','Luis Phonsi','LasCanciones2',null,null);




DELIMITER $$
create procedure nuevapelicula(titulo varchar(50),genero varchar(50),anio int, origen varchar(50))
begin

insert into Producto(prod_titulo,id_categoria,prod_genero,prod_año,prod_origen)
values(titulo,1,genero,anio,origen);

end;




create procedure nuevaserie(titulo varchar(50),genero varchar(50),anio int, origen varchar(50),episodios int,temporadas int)
begin

insert into Producto(prod_titulo,id_categoria,prod_genero,prod_año,prod_origen,prod_episodios,prod_temporadas)
values(titulo,2,genero,anio,origen,episodios,temporadas);

end;


create procedure nuevacancion(titulo varchar(50),genero varchar(50),anio int, origen varchar(50),artista varchar(50),album varchar(50))
begin

insert into Producto(prod_titulo,id_categoria,prod_genero,prod_año,prod_origen,prod_artista,prod_album)
values(titulo,3,genero,anio,origen,artista,album);

end;

create procedure eliminarProducto(producto int)
begin
delete from comentario where id_producto = producto;
delete from producto where id_producto = producto;

end;

create procedure eliminarComentario(comentario int)
begin
declare producto int;
declare suma int default 0;
declare cantComentarios int default 0;
declare puntajeActual int default 0;
set producto = (select id_producto from comentario where id_comentario = comentario);
delete from Comentario where id_comentario = comentario;
set suma = ifnull((select sum(com_puntaje) from Comentario where id_producto = producto),0);
set cantComentarios =  ifnull((select count(com_puntaje) from Comentario where id_producto = producto),1);

set puntajeActual = suma/ cantComentarios;

update Producto 
set prod_puntaje = puntajeActual where id_producto = producto;

end;

create procedure nuevoComentario(producto int,usuario varchar(50),mensaje varchar(255), puntaje int)
begin
declare suma int default 0;
declare cantComentarios int default 0;
declare puntajeActual int default 0;
insert into Comentario(id_producto,com_usuario,com_mensaje,com_puntaje)
values(producto,usuario,mensaje,puntaje);

set suma = ifnull((select sum(com_puntaje) from Comentario where id_producto = producto),0);
set cantComentarios =  ifnull((select count(com_puntaje) from Comentario where id_producto = producto),1);

set puntajeActual = suma/ cantComentarios;

update Producto 
set prod_puntaje = puntajeActual where id_producto = producto;

end;




create procedure actualizarComentario(comentario int,usuario varchar(50),mensaje varchar(255), puntaje int)
begin
declare suma int default 0;
declare cantComentarios int default 0;
declare puntajeActual int default 0;
declare producto int;
set producto = (select id_producto from Comentario where id_comentario = comentario);
update Comentario
set com_usuario = usuario,com_mensaje = mensaje,com_puntaje = puntaje where id_comentario = comentario;

set suma = ifnull((select sum(com_puntaje) from Comentario where id_producto = producto),0);
set cantComentarios =  ifnull((select count(com_puntaje) from Comentario where id_producto = producto),1);

set puntajeActual = suma/ cantComentarios;

update Producto 
set prod_puntaje = puntajeActual where id_producto = producto;

end;

create procedure actualizarPelicula(pelicula int, titulo varchar(50),genero varchar(50), anio int, origen varchar(50)  )
begin

update Producto
set prod_titulo = titulo, prod_genero = genero, prod_año = anio, prod_origen = origen where id_producto = pelicula;

end;

CALL nuevoComentario(1,'usuario1','Buenisimo',9);
call nuevoComentario(1,'usuario2','meeh',7);
call nuevoComentario(2,'usuario1','la 1 es mejor',5);

create procedure actualizarSerie(serie int, titulo varchar(50),genero varchar(50), anio int, origen varchar(50), episodios int, temporadas int  )
begin

update Producto
set prod_titulo = titulo, prod_genero = genero, prod_año = anio, prod_origen = origen ,prod_episodios = episodios, prod_temporadas = temporadas  where id_producto = serie  ;

end;

create procedure actualizarCancion(cancion int, titulo varchar(50),genero varchar(50), anio int, origen varchar(50), artista varchar(50), album varchar(50)  )
begin

update Producto
set prod_titulo = titulo, prod_genero = genero, prod_año = anio, prod_origen = origen ,prod_artista = artista, prod_album = album  where id_producto = cancion  ;

end;



