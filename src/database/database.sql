DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE IF NOT EXISTS biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE biblioteca;


create table autor(
	codigo_autor int auto_increment,
  nombre varchar(50) unique not null,
  pais varchar(30) not null,
  fecha_nac date not null,
  descripcion_autor text not null,
  primary key (codigo_autor)
);

create table libro(
  codigo_libro int auto_increment,
  titulo varchar(40) unique not null,
  genero varchar(40) not null,
  editorial varchar(30) not null,
  n_pag int not null,
  idioma enum('Inglés','Español') not null,
  fecha_publ date not null,
  encuadernacion varchar(30) not null,
  precio decimal(3,2) not null,
  descripcion_libro text not null,
  serie varchar(100),
  numero int,
  codigo_autor int not null,
  primary key(codigo_libro),
  foreign key (codigo_autor) references autor(codigo_autor) ON UPDATE CASCADE ON DELETE CASCADE
);

create table compra(
  codigo_compra int auto_increment,
  unidades int not null,
  codigo_libro int not null,
  primary key (codigo_compra),
  foreign key (codigo_libro) references libro(codigo_libro) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO autor VALUES (1,'Sarah J Mass','Estados Unidos','1986-03-05','Autora número 1 del New York Times, y su obra, en la que destaca la saga Trono de cristal, es un fenómeno superventas internacional. Se han vendido más de nueve millones de ejemplares de sus libros y estos se publican en treinta y siete idiomas. Sarah nació en Nueva York, pero actualmente vive en Pensilvania con su marido, su hijo y su perro.');
INSERT INTO autor VALUES (2,'Stephen King','Estados Unidos','1947-09-21','Stephen King (nacido el 21 de septiembre de 1947 en Portland, Maine) es un destacado escritor estadounidense de terror, ficción sobrenatural y más. Con más de 500 millones de libros vendidos, ha publicado 65 novelas y numerosas adaptaciones cinematográficas y televisivas.');
INSERT INTO autor VALUES (3,'Marie Lu','China','1984-07-11','Marie Lu nació en China, pero se mudó junto con su familia a Texas en 1989. En 2006 se graduó en Ciencias políticas en la Universidad del Sur de California, aunque acabó trabajando en el campo de la literatura y de la animación. Actualmente vive en Los Ángeles, California, con su marido y sus perros.');

INSERT INTO libro VALUES (1,'Trono de cristal', 'Fantasía', 'Editorial Hidra', 528, 'Español', '2020-11-02', 'Tapa blanda', 18.15, 'En las tenebrosas minas de sal de Endovier, una muchacha de dieciocho años cumple cadena perpetua. Es una asesina profesional, la mejor en lo suyo, pero ha cometido un error fatal. La han capturado. El joven capitán Westfall le ofrece un trato: la libertad a cambio de un enorme sacrificio. Celaena debe representar al príncipe en un torneo a muerte, en el que deberá luchar con los asesinos y ladrones más peligrosos del reino. Viva o muerta, Celaena será libre. Tanto si gana como si pierde, está a punto de descubrir su verdadero destino. Pero ¿qué pasará entretanto con su corazón de asesina?','Trono de cristal',1,1);
INSERT INTO libro VALUES (2,'Corona de medianoche', 'Fantasía', 'Editorial Hidra', 512, 'Español', '2021-03-08', 'Tapa blanda', 18.15, 'Cargada de acción y personajes inolvidables, la segunda parte de esta saga superventas que se ha convertido en un fenómeno en todo el mundo entusiasmará a la enorme base de fans de Sarah J. Maas.Celaena Sardothien se ha convertido en la campeona del rey, aunque dista mucho de ser leal a la Corona. El rey es perverso, y Celaena, atrapada en la red de intrigas y misterios del castillo de cristal, no puede confiar en nadie, ni siquiera en el príncipe Dorian, en el capitán de la guardia, Chaol, o en su amiga, la princesa Nehemia.Cuando algo absolutamente inesperado suceda, Celaena se verá obligada a decidir de una vez por todas a quién ofrecerle su lealtad… y por quién luchar.','Trono de cristal',2,1);
INSERT INTO libro VALUES (3,'Heredera de fuego', 'Fantasía', 'Editorial Hidra', 672, 'Español', '2021-09-06', 'Tapa blanda', 18.15, 'Como asesina del rey, Celaena Sardothien está obligada a servir al tirano que asesinó a su mejor amiga. Pero se ha prometido a sí misma que se lo hará pagar. Las respuestas que Celaena necesita para destruir al rey se encuentran más allá del mar, en Wendlyn. Y Chaol, capitán de la guardia real, ha puesto su futuro en peligro al enviarla allí.Y mientras Celaena busca su destino en Wendlyn, una nueva amenaza se prepara para asaltar los cielos. ¿Encontrará Celaena las fuerzas necesarias no solo para ganar sus propias batallas, sino para ir a una guerra que podría poner a prueba la lealtad hacia los suyos y enfrentarla a aquellos que han llegado a convertirse en sus seres más queridos?','Trono de cristal',3,1);
INSERT INTO libro VALUES (4,'Misery', 'Terror', 'Debolsillo', 376, 'Español', '2003-03-20', 'Tapa blanda', 14.59, 'Paul Shledon es un escritor que sufre un grave accidente y recobra el conocimiento en una apartada casa en la que vive una misteriosa mujer, corpulenta y de extraño carácter. Se trata de una antigua enfermera, involucrada en varias muertes misteriosas ocurridas en diversos hospitales. Fanática de un personaje de una serie de libros que él ha decido dejar de escribir, está dispuesta a hacer todo lo necesario para "convencerlo" de que retome la escritura. Esta mujer es capaz de los mayores horrores, y Paul, con las piernas rotas y entre terribles dolores, tendrá que luchar por su vida.', null ,1,2);

