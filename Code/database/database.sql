DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE IF NOT EXISTS biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE biblioteca;

create table libros(
  codigo_libro int auto_increment,
  titulo varchar(40) not null,
  editorial varchar(20) not null,
  n_pag int not null,
  fecha_publ date not null,
  precio decimal(3,2) not null,
  codigo_autor int not null,
  primary key(codigo_libro),
  foreign key (codigo_autor) references autor(codigo_autor) ON UPDATE CASCADE ON DELETE CASCADE
);

create table autor(
	codigo_autor int auto_increment,
    nombre varchar(50) not null,
    pais varchar(35) not null,
    fecha_nac date not null,
    primary key (codigo_autor)
);