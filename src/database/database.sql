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
  encuadernacion enum('Tapa blanda','Tapa dura') not null,
  precio decimal(5,2) not null,
  descripcion_libro text not null,
  serie varchar(100),
  numero int,
  codigo_autor int not null,
  primary key(codigo_libro),
  foreign key (codigo_autor) references autor(codigo_autor) ON UPDATE CASCADE ON DELETE CASCADE
);

create table compra(
  codigo_compra int auto_increment,
  primary key (codigo_compra)
);

create table detalle_compra(
  codigo_compra int auto_increment,
  codigo_libro int not null,
  unidades int not null,
  primary key (codigo_compra,codigo_libro),
  foreign key (codigo_libro) references libro(codigo_libro) ON UPDATE CASCADE ON DELETE CASCADE,
  foreign key (codigo_compra) references compra(codigo_compra) ON UPDATE CASCADE ON DELETE CASCADE
)

INSERT INTO autor VALUES (1,'Sarah J Mass','Estados Unidos','1986-03-05','Autora número 1 del New York Times, y su obra, en la que destaca la saga Trono de cristal, es un fenómeno superventas internacional. Se han vendido más de nueve millones de ejemplares de sus libros y estos se publican en treinta y siete idiomas. Sarah nació en Nueva York, pero actualmente vive en Pensilvania con su marido, su hijo y su perro.');
INSERT INTO autor VALUES (2,'Stephen King','Estados Unidos','1947-09-21','Stephen King (nacido el 21 de septiembre de 1947 en Portland, Maine) es un destacado escritor estadounidense de terror, ficción sobrenatural y más. Con más de 500 millones de libros vendidos, ha publicado 65 novelas y numerosas adaptaciones cinematográficas y televisivas.');
INSERT INTO autor VALUES (3,'Marie Lu','China','1984-07-11','Marie Lu nació en China, pero se mudó junto con su familia a Texas en 1989. En 2006 se graduó en Ciencias políticas en la Universidad del Sur de California, aunque acabó trabajando en el campo de la literatura y de la animación. Actualmente vive en Los Ángeles, California, con su marido y sus perros.');
INSERT INTO autor VALUES (4, 'V.E. Schwab', 'Estados Unidos', '1987-07-07', 'V.E. Schwab es una autora de fantasía y ciencia ficción conocida por sus series aclamadas como "Shades of Magic" y "Vicious". Su trabajo destaca por sus mundos imaginativos y complejos personajes.');
INSERT INTO autor VALUES (5, 'Susan Ee', 'Estados Unidos', '1980-01-01', 'Susan Ee es una autora de fantasía y ciencia ficción conocida por su serie "Ángeles Caídos", que ha sido un éxito internacional y ha cautivado a los lectores con su mezcla de acción y romance en un mundo post-apocalíptico.');
INSERT INTO autor VALUES (6, 'Emily McIntire', 'Estados Unidos', '1988-09-01', 'Emily McIntire es una autora de romance contemporáneo y fantasía, conocida por su serie "Hooked", que reimagina cuentos de hadas clásicos con un giro oscuro y emocional.');
INSERT INTO autor VALUES (7, 'Alexandra Christo', 'Reino Unido', '1994-04-01', 'Alexandra Christo es una autora de fantasía conocida por sus reimaginaciones de cuentos clásicos. Su obra "Matar un reino" ha sido aclamada por su narrativa oscura y personajes complejos.');
INSERT INTO autor VALUES (8, 'Josh Malerman', 'Estados Unidos', '1970-02-24', 'Josh Malerman es un autor de terror y ficción, conocido por su novela "A ciegas", que se convirtió en un fenómeno cultural y fue adaptada a una película exitosa. Su estilo inquietante y original ha capturado la atención de los lectores.');
INSERT INTO autor VALUES (9, 'Tahereh Mafi', 'Estados Unidos', '1988-11-09', 'Tahereh Mafi es una autora de fantasía y ciencia ficción, conocida por su serie "Shatter Me", que combina romance, acción y un mundo distópico con una prosa poética.');
INSERT INTO autor VALUES (10, 'Gillian Flynn', 'Estados Unidos', '1982-02-24', 'Gillian Flynn es una autora estadounidense conocida por sus novelas de suspense psicológico, incluyendo "Gone Girl". Su estilo intrigante y personajes complejos han ganado numerosos premios.');
INSERT INTO autor VALUES (11, 'Lian Banks', 'Reino Unido', '1985-02-10', 'Lian Banks es un autor contemporáneo conocido por sus novelas de thriller psicológico y misterio.');
INSERT INTO autor VALUES (12, 'Rebeca Yaros', 'Estados Unidos', '1990-06-15', 'Rebeca Yaros es una autora de fantasía y romance, conocida por sus historias llenas de emoción y personajes profundos.');
INSERT INTO autor VALUES (13, 'Carmen Mola', 'España', '2021-10-01','Carmen Mola es el seudónimo con el que los escritores españoles Jorge Díaz, Agustín Martínez y Antonio Mercero publicaron la saga de novelas iniciada con La novia gitana en la editorial Alfaguara a partir de 2018, con el personaje de la inspectora Elena Blanco como protagonista. La identidad verdadera de estos autores se conoció en octubre de 2021, cuando ganaron el Premio Planeta con su nueva novela La Bestia.');
INSERT INTO autor VALUES (14, 'Paula Hawkins', 'Reino Unido', '1971-08-26', 'Paula Hawkins es una autora británica famosa por su novela de suspense psicológico "La chica del tren", que se convirtió en un bestseller internacional y fue adaptada al cine. Su escritura se centra en las complejidades de las relaciones humanas y el oscuro lado de la vida cotidiana.');
INSERT INTO autor VALUES (15, 'Carlos Ruiz Zafón', 'España', '1964-09-25', 'Carlos Ruiz Zafón fue un destacado escritor español, nacido en Barcelona en 1964 y fallecido en 2020. Comenzó su carrera literaria escribiendo novelas juveniles, pero alcanzó la fama internacional con La sombra del viento (2001), parte de la tetralogía El cementerio de los libros olvidados. Su estilo literario combina el misterio, el drama y el realismo mágico, ambientado en una Barcelona gótica y llena de secretos. A lo largo de su carrera, su obra ha sido traducida a más de 40 idiomas, convirtiéndolo en uno de los autores españoles contemporáneos más leídos en el mundo. Además de su labor como escritor, también trabajó como guionista en Hollywood.');
INSERT INTO autor VALUES (16, 'Harlan Coben', 'Estados Unidos', '1962-01-04', 'Harlan Coben es un autor de thrillers que ha vendido millones de copias en todo el mundo. Sus novelas, a menudo llenas de giros inesperados, han sido adaptadas a series de televisión y películas, destacando su habilidad para mantener a los lectores al borde de sus asientos.');
INSERT INTO autor VALUES (17, 'Karin Slaughter', 'Estados Unidos', '1971-01-06', 'Karin Slaughter es una reconocida autora de thriller y misterio, famosa por sus novelas que combinan intriga y emociones profundas. Sus obras han sido traducidas a más de 30 idiomas.');
INSERT INTO autor VALUES (18, 'Ruth Ware', 'Reino Unido', '1977-09-28', 'Ruth Ware es una autora de thriller psicológico, conocida por sus tramas llenas de giros sorprendentes y atmósferas inquietantes. Sus libros han sido aclamados por la crítica y han alcanzado gran popularidad.');
INSERT INTO autor VALUES (19, 'H. P. Lovecraft', 'Estados Unidos', '1890-08-20', 'Howard Phillips Lovecraft fue un escritor estadounidense, pionero del género de horror cósmico. Sus obras influyeron profundamente en la literatura de terror, destacándose por la creación de mitologías y criaturas sobrenaturales como Cthulhu. Lovecraft desarrolló un universo literario que explora la insignificancia del ser humano ante fuerzas cósmicas incomprensibles.');
INSERT INTO autor VALUES (20, 'Edgar Allan Poe', 'Estados Unidos', '1809-01-19', 'Edgar Allan Poe fue un escritor, poeta, crítico y editor estadounidense, conocido por sus relatos macabros y sus contribuciones al género de terror y misterio. Su obra "El cuervo" y cuentos como "El corazón delator" son clásicos de la literatura gótica.');
INSERT INTO autor VALUES (21, 'Clive Barker', 'Reino Unido', '1952-10-05', 'Clive Barker es un escritor, cineasta y artista británico, conocido por sus obras de terror y fantasía oscura. Su serie "Books of Blood" y novelas como "Hellbound Heart", que inspiró la saga cinematográfica "Hellraiser", lo han convertido en una figura clave del horror moderno.');
INSERT INTO autor VALUES (22, 'Shirley Jackson', 'Estados Unidos', '1916-12-14', 'Shirley Jackson fue una escritora estadounidense reconocida por sus relatos de terror psicológico y horror gótico. Su novela "La maldición de Hill House" es una de las obras más influyentes en el género de casas embrujadas.');
INSERT INTO autor VALUES (23, 'Bram Stoker', 'Irlanda', '1847-11-08', 'Bram Stoker fue un novelista irlandés, famoso por su obra "Drácula", que definió las características modernas de la figura del vampiro. Su estilo narrativo, que combina el terror con elementos de romance gótico, sigue influyendo en la cultura popular.');
INSERT INTO autor VALUES (24, 'Mary Shelley', 'Reino Unido', '1797-08-30', 'Mary Shelley fue una escritora británica, autora de "Frankenstein o el moderno Prometeo". Esta novela es considerada una de las primeras obras de ciencia ficción y una pieza esencial de la literatura de terror.');
INSERT INTO autor VALUES (25, 'Runyx', 'España', '1985-03-12', 'Runyx es una autora española conocida por sus novelas de dark romance, que combinan elementos de terror y romance. Sus tramas intrigantes han capturado la atención de lectores en todo el mundo.');

INSERT INTO libro VALUES (1,'Trono de cristal', 'Fantasía', 'Hidra', 528, 'Español', '2020-11-02', 'Tapa blanda', 18.15, 'En las tenebrosas minas de sal de Endovier, una muchacha de dieciocho años cumple cadena perpetua. Es una asesina profesional, la mejor en lo suyo, pero ha cometido un error fatal. La han capturado. El joven capitán Westfall le ofrece un trato: la libertad a cambio de un enorme sacrificio. Celaena debe representar al príncipe en un torneo a muerte, en el que deberá luchar con los asesinos y ladrones más peligrosos del reino. Viva o muerta, Celaena será libre. Tanto si gana como si pierde, está a punto de descubrir su verdadero destino. Pero ¿qué pasará entretanto con su corazón de asesina?','Trono de cristal',1,1);
INSERT INTO libro VALUES (2,'Corona de medianoche', 'Fantasía', 'Hidra', 512, 'Español', '2021-03-08', 'Tapa blanda', 18.15, 'Cargada de acción y personajes inolvidables, la segunda parte de esta saga superventas que se ha convertido en un fenómeno en todo el mundo entusiasmará a la enorme base de fans de Sarah J. Maas.Celaena Sardothien se ha convertido en la campeona del rey, aunque dista mucho de ser leal a la Corona. El rey es perverso, y Celaena, atrapada en la red de intrigas y misterios del castillo de cristal, no puede confiar en nadie, ni siquiera en el príncipe Dorian, en el capitán de la guardia, Chaol, o en su amiga, la princesa Nehemia.Cuando algo absolutamente inesperado suceda, Celaena se verá obligada a decidir de una vez por todas a quién ofrecerle su lealtad… y por quién luchar.','Trono de cristal',2,1);
INSERT INTO libro VALUES (3,'Heredera de fuego', 'Fantasía', 'Hidra', 672, 'Español', '2021-09-06', 'Tapa blanda', 18.15, 'Como asesina del rey, Celaena Sardothien está obligada a servir al tirano que asesinó a su mejor amiga. Pero se ha prometido a sí misma que se lo hará pagar. Las respuestas que Celaena necesita para destruir al rey se encuentran más allá del mar, en Wendlyn. Y Chaol, capitán de la guardia real, ha puesto su futuro en peligro al enviarla allí.Y mientras Celaena busca su destino en Wendlyn, una nueva amenaza se prepara para asaltar los cielos. ¿Encontrará Celaena las fuerzas necesarias no solo para ganar sus propias batallas, sino para ir a una guerra que podría poner a prueba la lealtad hacia los suyos y enfrentarla a aquellos que han llegado a convertirse en sus seres más queridos?','Trono de cristal',3,1);
INSERT INTO libro VALUES (4, 'Reina de sombras', 'Fantasía', 'Hidra', 648, 'Español', '2015-09-01', 'Tapa blanda', 18.15, 'Celaena Sardothien, ahora como Aelin Ashryver Galathynius, debe reunir a sus aliados y enfrentarse a una nueva amenaza mientras busca recuperar su reino y descubrir su verdadero destino.', 'Trono de cristal', 4, 1);
INSERT INTO libro VALUES (5, 'Imperio de tormentas', 'Fantasía', 'Hidra', 720, 'Español', '2016-09-06', 'Tapa blanda', 18.15, 'Aelin debe luchar contra la oscuridad y las traiciones mientras se prepara para la guerra que determinará el futuro de su reino y de todos los reinos.', 'Trono de cristal', 5, 1);
INSERT INTO libro VALUES (6, 'Torre del alba', 'Fantasía', 'Hidra', 480, 'Español', '2017-09-07', 'Tapa blanda', 18.15, 'Mientras Aelin se recupera de sus heridas, su grupo de amigos debe enfrentarse a sus propios desafíos y peligros, preparando el terreno para la batalla final.', 'Trono de cristal', 6, 1);
INSERT INTO libro VALUES (7, 'Reino de cenizas', 'Fantasía', 'Hidra', 720, 'Español', '2018-10-23', 'Tapa blanda', 18.15, 'Aelin y sus amigos deben unir fuerzas para enfrentar a la oscuridad en una guerra que cambiará el destino de todos. La lucha por la libertad y la justicia está en juego.', 'Trono de cristal', 7, 1);
INSERT INTO libro VALUES (8,'Misery', 'Terror', 'Debolsillo', 376, 'Español', '2003-03-20', 'Tapa blanda', 14.59, 'Paul Shledon es un escritor que sufre un grave accidente y recobra el conocimiento en una apartada casa en la que vive una misteriosa mujer, corpulenta y de extraño carácter. Se trata de una antigua enfermera, involucrada en varias muertes misteriosas ocurridas en diversos hospitales. Fanática de un personaje de una serie de libros que él ha decido dejar de escribir, está dispuesta a hacer todo lo necesario para "convencerlo" de que retome la escritura. Esta mujer es capaz de los mayores horrores, y Paul, con las piernas rotas y entre terribles dolores, tendrá que luchar por su vida.', null ,null,2);
INSERT INTO libro VALUES (9, 'Legend', 'Distopía', 'Putnam', 368, 'Español', '2011-11-29', 'Tapa dura', 11.99, 'En una sociedad dividida por la guerra, dos jóvenes con orígenes opuestos se cruzan en un mundo lleno de secretos y conspiraciones.', 'Legend', 1, 3);
INSERT INTO libro VALUES (10, 'Prodigy', 'Distopía', 'Putnam', 384, 'Español', '2013-01-29', 'Tapa dura', 11.99, 'June y Day deben decidir en quién confiar mientras luchan por la libertad en un mundo donde la traición está a la vuelta de la esquina.', 'Legend', 2, 3);
INSERT INTO libro VALUES (11, 'Champion', 'Distopía', 'Putnam', 368, 'Español', '2013-11-05', 'Tapa dura', 11.99, 'El destino de la República y su futuro están en manos de June y Day mientras enfrentan decisiones difíciles que cambiarán el curso de sus vidas.', 'Legend', 3, 3);
INSERT INTO libro VALUES (12, 'The Invisible Life of Addie LaRue', 'Fantasía', 'Tor Books', 448, 'Inglés', '2020-10-06', 'Tapa blanda', 24.99, 'Una joven hace un trato para vivir eternamente, pero es olvidada por todos. Su historia se desarrolla a lo largo de los siglos.', null, null, 4);
INSERT INTO libro VALUES (13, 'Angelfall', 'Distopía', 'Skyscape', 368, 'Inglés', '2011-05-01', 'Tapa blanda', 16.99, 'En un mundo devastado por una guerra entre ángeles y humanos, la joven Penryn se encuentra en una lucha desesperada por salvar a su hermana y a sí misma.', 'Ángeles Caídos', 1, 5);
INSERT INTO libro VALUES (14, 'World After', 'Distopía', 'Skyscape', 384, 'Inglés', '2013-11-19', 'Tapa blanda', 16.99, 'Penryn y su compañero ángel Raffe deben enfrentar nuevos peligros y traiciones mientras buscan sobrevivir en un mundo donde los ángeles son tanto enemigos como aliados.', 'Ángeles Caídos', 2, 5);
INSERT INTO libro VALUES (15, 'End of Days', 'Distopía', 'Skyscape', 480, 'Inglés', '2014-05-12', 'Tapa blanda', 16.99, 'La batalla final por la humanidad se acerca, y Penryn debe decidir en quién confiar y qué sacrificios está dispuesta a hacer para salvar a los que ama.', 'Ángeles Caídos', 3, 5);
INSERT INTO libro VALUES (16, 'Hooked', 'Romance', 'Montena', 300, 'Inglés', '2021-06-15', 'Tapa blanda', 14.99, 'Una reimaginación oscura del cuento de Peter Pan, donde Wendy se enfrenta a un mundo de magia y peligro para salvar a sus seres queridos.', 'Never after series', 1, 6);
INSERT INTO libro VALUES (17, 'Scarred', 'Romance', 'Montena', 320, 'Inglés', '2022-02-22', 'Tapa blanda', 14.99, 'La historia de un amor prohibido que desafía las normas de un mundo mágico y peligroso, explorando la redención y la lucha por el amor.', 'Never after series', 2, 6);
INSERT INTO libro VALUES (18, 'Wretched', 'Romance', 'Montena', 380, 'Inglés', '2021-12-05', 'Tapa blanda', 14.99, 'La historia de una sirena atrapada entre dos mundos, luchando por encontrar su lugar mientras navega por el amor y la traición.', 'Never after series', 3, 6);
INSERT INTO libro VALUES (19, 'Twisted', 'Romance', 'Montena', 350, 'Inglés', '2021-05-10', 'Tapa blanda', 14.99, 'Una reimaginación oscura de la historia de Rapunzel, donde los secretos y la pasión se entrelazan en una lucha por la libertad.', 'Never after series', 4, 6);
INSERT INTO libro VALUES (20, 'Matar un reino', 'Fantasía', 'Gran travesía', 400, 'Español', '2018-03-06', 'Tapa blanda', 17.99, 'Una reimaginación oscura del cuento de la sirenita, donde la princesa de los mares se ve atrapada en un mundo de traiciones y secretos mientras busca venganza.', null, null, 7);
INSERT INTO libro VALUES (21, 'A ciegas', 'Terror', 'Planeta', 300, 'Español', '2014-05-13', 'Tapa blanda', 16.99, 'En un mundo post-apocalíptico donde una presencia desconocida lleva a las personas a la locura si la ven, una madre y sus dos hijos deben emprender un peligroso viaje a ciegas para sobrevivir.', null, null, 8);
INSERT INTO libro VALUES (22, 'Shatter Me', 'Distopía', 'HarperCollins', 338, 'Español', '2011-11-15', 'Tapa blanda', 16.99, 'Juliette tiene un don mortal: su toque puede matar. Atrapada en una prisión, su vida cambia cuando se encuentra con Adam, un soldado que podría ser su única esperanza.', 'Shatter Me', 1, 11);
INSERT INTO libro VALUES (23, 'Unravel Me', 'Distopía', 'HarperCollins', 461, 'Español', '2013-02-05', 'Tapa blanda', 17.99, 'Juliette lucha con su poder y su identidad mientras se enfrenta a nuevos enemigos y descubre más sobre su pasado.', 'Shatter Me', 2, 9);
INSERT INTO libro VALUES (24, 'Ignite Me', 'Distopía', 'HarperCollins', 416, 'Español', '2014-02-04', 'Tapa blanda', 17.99, 'Juliette debe elegir entre su amor por Adam y su conexión con Warner, mientras enfrenta una nueva amenaza para su mundo.', 'Shatter Me', 3, 9);
INSERT INTO libro VALUES (25, 'Restore Me', 'Distopía', 'HarperCollins', 368, 'Español', '2018-03-06', 'Tapa blanda', 17.99, 'Después de los eventos de "Ignite Me", Juliette lucha por mantener el control en un mundo que se tambalea entre la paz y la guerra.', 'Shatter Me', 4, 9);
INSERT INTO libro VALUES (26, 'Una corte de rosas y espinas', 'Fantasía', 'Cross books', 432, 'Español', '2015-05-05', 'Tapa dura', 26.15, 'Cuando Feyre, una cazadora, mata a un lobo, es llevada a Prythian, un mundo mágico, donde se enfrenta a un alto fae que le revela secretos sobre su propio destino.', 'Una corte de rosas y espinas', 1, 1);
INSERT INTO libro VALUES (27, 'Una corte de niebla y furia', 'Fantasía', 'Cross books', 640, 'Español', '2016-05-03', 'Tapa dura', 26.15, 'Feyre se enfrenta a nuevos retos y debe encontrar su lugar en un mundo lleno de fae y antiguas profecías, mientras la amenaza de la guerra se cierne sobre Prythian.', 'Una corte de rosas y espinas', 2, 1);
INSERT INTO libro VALUES (28, 'Una corte de alas y ruina', 'Fantasía', 'Cross books', 704, 'Español', '2017-05-02', 'Tapa dura', 26.15, 'La guerra ha llegado a Prythian y Feyre y sus amigos deben luchar por la supervivencia mientras enfrentan enemigos que desean destruir todo lo que aman.', 'Una corte de rosas y espinas', 3, 1);
INSERT INTO libro VALUES (29, 'Una corte de hielo y estrellas', 'Fantasía', 'Cross books', 272, 'Español', '2018-05-01', 'Tapa dura', 26.15, 'Una colección de historias que expanden el universo de Prythian, explorando a fondo a los personajes y su desarrollo tras los eventos de la serie principal.', 'Una corte de rosas y espinas', 4, 1);
INSERT INTO libro VALUES (30, 'Una corte de llamas plateadas', 'Fantasía', 'Cross books', 560, 'Español', '2021-01-26', 'Tapa dura', 26.15, 'La historia sigue a Feyre y sus amigos mientras enfrentan nuevos desafíos en el mundo de Prythian, explorando temas de amor, traición y poder.', 'Una corte de rosas y espinas', 5, 1);
INSERT INTO libro VALUES (31, 'Mr. Mercedes', 'Thriller', 'Sinma', 432, 'Español', '2015-06-02', 'Tapa blanda', 14.99, 'Un exdetective de la policía se obsesiona con un caso sin resolver sobre un asesino que se escapó tras una masacre. Ahora debe enfrentarse al criminal antes de que ataque de nuevo.', null, null, 2);
INSERT INTO libro VALUES (32, 'Heridas abiertas', 'Thriller', 'Salamandra', 368, 'Español', '2012-04-10', 'Tapa blanda', 18.99, 'Una periodista regresa a su pueblo natal para cubrir el asesinato de dos adolescentes, enfrentándose a su oscuro pasado y a secretos familiares que podrían destruirla.', null, null, 10);
INSERT INTO libro VALUES (33, 'La fábrica de avispas', 'Fantasía', 'Planeta', 512, 'Español', '2018-07-10', 'Tapa blanda', 17.99, 'En un mundo donde las personas pueden convertirse en avispas, un joven debe enfrentarse a su destino mientras desentraña los secretos de su familia y su propia identidad.', null, null, 11);
INSERT INTO libro VALUES (34, 'Alas de sangre', 'Fantasía', 'Planeta', 432, 'Español', '2015-09-01', 'Tapa blanda', 19.99, 'Una joven descubre que tiene el poder de controlar las sombras mientras se enfrenta a una antigua amenaza que busca desatar el caos en su mundo.', 'Empireo',1, 12);
INSERT INTO libro VALUES (35, 'Alas de hierro', 'Fantasía', 'Planeta', 480, 'Español', '2016-04-25', 'Tapa blanda', 19.99, 'La batalla entre los seres de luz y de sombra se intensifica mientras la protagonista debe elegir entre su amor y su deber, enfrentándose a sacrificios inimaginables.','Empireo', 2, 12);
INSERT INTO libro VALUES (36, 'La Bestia', 'Thriller', 'Alfaguara', 544, 'Español', '2021-10-28', 'Tapa dura', 22.90, 'En el Madrid de 1834, una misteriosa epidemia asola la ciudad y una bestia sanguinaria comienza a sembrar el terror, mientras tres personajes muy diferentes entre sí se unen en una lucha desesperada por sobrevivir.', null, null, 13);
INSERT INTO libro VALUES (37, 'La chica del tren', 'Thriller', 'Planeta', 496, 'Español', '2015-06-15', 'Tapa blanda', 16.99, 'Rachel viaja en el tren todos los días, observando a una pareja desde la ventana. Un día, presencia algo sorprendente que la lleva a involucrarse en un misterio que cambiará su vida para siempre.', null, null, 14);
INSERT INTO libro VALUES (38, 'El juego del ángel', 'Thriller', 'Planeta', 608, 'Español', '2008-04-15', 'Tapa blanda', 19.99, 'En la Barcelona de los años 1920, un joven escritor recibe una oferta que lo sumergirá en un mundo de conspiraciones y misterios literarios.', null, null, 15);
INSERT INTO libro VALUES (39, 'No se lo digas a nadie', 'Thriller', 'RBA', 512, 'Español', '2016-04-01', 'Tapa blanda', 16.99, 'Una madre luchadora debe enfrentarse a un oscuro secreto del pasado que amenaza con destruir su vida y la de su familia.', null, null, 16);
INSERT INTO libro VALUES (40, 'La buena hija', 'Thriller', 'HarperCollins', 512, 'Español', '2017-08-01', 'Tapa blanda', 18.99, 'Dos hermanas quedan atrapadas en un violento crimen que cambiará sus vidas para siempre, enfrentándose a un oscuro pasado y a decisiones desgarradoras.', null, null, 17);
INSERT INTO libro VALUES (41, 'En un bosque muy oscuro', 'Thriller', 'RBA', 416, 'Español', '2016-07-26', 'Tapa blanda', 17.99, 'Una mujer es invitada a un fin de semana en una casa de campo, pero lo que comienza como una escapada relajante se convierte en una pesadilla cuando surgen secretos del pasado.', null, null, 18);
INSERT INTO libro VALUES (42, 'El llamado de Cthulhu', 'Terror', 'Alma Clásicos ilustrados', 128, 'Español', '1928-10-01', 'Tapa dura', 12.99, 'Una de las obras más emblemáticas de H. P. Lovecraft, en la que se narra el descubrimiento de una antigua y maligna entidad conocida como Cthulhu, que yace dormida en las profundidades del océano, esperando su despertar.', null, null, 19);
INSERT INTO libro VALUES (43, 'La caída de la casa Usher', 'Terror', 'Alianza Editorial', 104, 'Español', '1845-04-15', 'Tapa blanda', 7.99, 'Un inquietante relato de Edgar Allan Poe en el que el protagonista visita la casa de un amigo enfermo, solo para ser arrastrado a un espiral de locura y destrucción junto con la maldita mansión.', null, null, 20);
INSERT INTO libro VALUES (44, 'El cuervo', 'Terror', 'Alma Clásicos ilustrados', 64, 'Español', '1845-01-29', 'Tapa blanda', 5.99, 'El poema más famoso de Edgar Allan Poe, "El cuervo", relata el encuentro entre un hombre solitario y un cuervo que repite la palabra "Nunca más", explorando la desesperación, la pérdida y la locura.', null, null, 20);
INSERT INTO libro VALUES (45, 'El gato negro', 'Terror', 'Alianza Editorial', 128, 'Español', '1843-08-19', 'Tapa blanda', 6.99, 'Un perturbador relato de Poe en el que un hombre, acosado por su culpa y paranoia tras cometer un crimen atroz, ve cómo su vida se desmorona debido a la aparición recurrente de un misterioso gato negro.', null, null, 20);
INSERT INTO libro VALUES (46, 'El corazón delator', 'Terror', 'Planeta', 96, 'Español', '1843-01-01', 'Tapa blanda', 5.49, 'Uno de los cuentos más célebres de Poe, que narra la historia de un hombre que, obsesionado por el ojo de un anciano, lo asesina, pero su locura lo lleva a confesar debido al sonido persistente de un corazón latiendo bajo el suelo.', null, null, 20);
INSERT INTO libro VALUES (47, 'La máscara de la muerte roja', 'Terror', 'Saga', 96, 'Español', '1842-05-01', 'Tapa dura', 7.99, 'En este macabro cuento, Poe narra la historia de un príncipe que intenta escapar de una plaga mortal refugiándose en su castillo, solo para descubrir que ni la riqueza ni el poder pueden salvarlo de la muerte.', null, null, 20);
INSERT INTO libro VALUES (48, 'El pozo y el péndulo', 'Terror', 'Del Fondo', 144, 'Español', '1842-01-01', 'Tapa blanda', 6.99, 'Relato de horror psicológico en el que un prisionero de la Inquisición Española enfrenta una muerte lenta y angustiosa en una celda llena de trampas mortales, destacando el estilo oscuro y opresivo de Poe.', null, null, 20);
INSERT INTO libro VALUES (49, 'Los crímenes de la calle Morgue', 'Terror', 'Austral', 160, 'Español', '1841-04-01', 'Tapa blanda', 8.99, 'Considerado uno de los primeros relatos de detectives, Poe presenta al detective Dupin, quien resuelve un misterioso asesinato en París, sentando las bases para el género policíaco.', null, null, 20);
INSERT INTO libro VALUES (50, 'El retrato oval', 'Terror', 'Elejandria', 80, 'Español', '1842-04-01', 'Tapa blanda', 4.99, 'Un breve pero intenso relato de Poe, en el que un hombre descubre un retrato tan realista que parece poseer una parte del alma de la modelo, en una historia que explora el arte, la obsesión y la muerte.', null, null, 20);
INSERT INTO libro VALUES (51, 'Berenice', 'Terror', 'Elejandria', 112, 'Español', '1835-03-01', 'Tapa blanda', 6.49, 'Este relato narra la historia de un hombre que, obsesionado con la dentadura perfecta de su prima Berenice, comete un acto atroz, sumergiéndose en un abismo de locura.', null, null, 20);
INSERT INTO libro VALUES (52, 'Ligeia', 'Terror', 'Elejandria', 144, 'Español', '1838-09-01', 'Tapa blanda', 7.49, 'Un cuento de horror gótico en el que el narrador se obsesiona con su primera esposa, Ligeia, quien parece regresar de la muerte para atormentar a su segunda esposa, en una historia que mezcla el amor, la muerte y lo sobrenatural.', null, null, 20);
INSERT INTO libro VALUES (53, 'Hellraiser', 'Terror', 'HarperCollins', 224, 'Inglés', '1986-11-01', 'Tapa blanda', 14.99, 'En esta novela de Clive Barker, Frank Cotton abre una caja que promete placeres más allá de lo imaginable, pero en lugar de éxtasis, desata una horrorosa dimensión de dolor y tortura a manos de los cenobitas.', null, null, 21);
INSERT INTO libro VALUES (54, 'La maldición de Hill House', 'Terror', 'Minúscula', 256, 'Inglés', '1959-10-16', 'Tapa blanda', 16.99, 'Una de las novelas más influyentes del terror moderno, donde un grupo de personas se enfrenta a los horrores sobrenaturales que se manifiestan en una antigua y misteriosa mansión.', null, null, 22);
INSERT INTO libro VALUES (55, 'Drácula', 'Terror', 'Alma Clásicos ilustrados', 576, 'Español', '1897-05-26', 'Tapa dura', 19.99, 'La icónica novela de Bram Stoker que narra la historia del conde Drácula, un vampiro que viaja desde Transilvania a Inglaterra para expandir su reino de terror.', null, null, 23);
INSERT INTO libro VALUES (56, 'Frankenstein', 'Terror', 'Random house', 280, 'Inglés', '1818-01-01', 'Tapa blanda', 11.99, 'La revolucionaria obra de Mary Shelley, en la que el científico Víctor Frankenstein crea una criatura a partir de cadáveres, solo para ser perseguido por las consecuencias de jugar con la vida y la muerte.', null, null, 24);
INSERT INTO libro VALUES (57, 'El juego de Gerald', 'Thriller', 'DeBolsillo', 496, 'Español', '1992-05-19', 'Tapa blanda', 8.99, 'Un juego sexual entre un matrimonio en una cabaña aislada sale terriblemente mal cuando Gerald muere inesperadamente, dejando a su esposa Jessie esposada a la cama sin posibilidad de escapar, mientras sus demonios internos resurgen.', null, null, 2);
INSERT INTO libro VALUES (58, 'La milla verde', 'Thriller', 'DeBolsillo', 448, 'Español', '1996-03-28', 'Tapa blanda', 9.49, 'En el corredor de la muerte, los guardias se ven obligados a confrontar lo inexplicable cuando un prisionero condenado, John Coffey, parece tener poderes sobrenaturales. Un thriller emotivo que también es una reflexión sobre el castigo y la compasión.', null, null, 2);
INSERT INTO libro VALUES (59, 'El visitante', 'Thriller', 'Plaza & Janés', 592, 'Español', '2018-05-22', 'Tapa dura', 11.49, 'Cuando un respetado maestro de escuela es acusado de un asesinato brutal con pruebas innegables en su contra, el detective Ralph Anderson se enfrenta a un caso desconcertante que desafía la lógica, llevando la investigación a un terreno paranormal.', null, null, 2);
INSERT INTO libro VALUES (60, 'Una obsesión perversa', 'Fantasía', 'Umbriel', 432, 'Español', '2018-09-25', 'Tapa blanda', 17.95, 'Victor Vale y Eli Ever, dos jóvenes brillantes pero arrogantes, descubren una forma de desarrollar habilidades extraordinarias tras experimentar cercanas a la muerte. Sin embargo, sus caminos se separan y pronto se convierten en enemigos, cada uno obsesionado con derrotar al otro en este thriller psicológico lleno de moral ambigua y acción trepidante.', 'Villains', 1, 4);
INSERT INTO libro VALUES (61, 'Una venganza mortal', 'Fantasía', 'Umbriel', 480, 'Español', '2019-02-26', 'Tapa blanda', 18.95, 'En esta secuela de "Una obsesión perversa", Victor y Eli, ahora con sus poderes al máximo, enfrentan las consecuencias de sus decisiones pasadas mientras nuevos personajes con habilidades sobrenaturales entran en juego. La lucha por el control y la venganza alcanza su punto culminante en una trama llena de giros, oscuridad y emociones intensas.', 'Villains', 2, 4);
INSERT INTO libro VALUES (62, 'Perdida', 'Thriller', 'Random House', 576, 'Español', '2013-05-28', 'Tapa blanda', 19.90, 'Nick y Amy Dunne parecen tener el matrimonio perfecto hasta que, en su quinto aniversario, Amy desaparece misteriosamente. Las sospechas rápidamente recaen sobre Nick, cuya conducta sospechosa y comportamiento errático lo convierten en el principal sospechoso. En este thriller psicológico cargado de tensión, las mentiras, manipulaciones y oscuros secretos se desvelan para mostrar que las apariencias engañan.', null, null, 10);
INSERT INTO libro VALUES (63, 'La novia gitana', 'Thriller', 'DeBolsillo', 408, 'Español', '2018-05-17', 'Tapa blanda', 18.90, 'La inspectora Elena Blanco se enfrenta a un caso aterrador: una joven de origen gitano desaparece y es hallada brutalmente asesinada de una forma que recuerda a otro crimen no resuelto.', ' Novia Gitana', 1, 13);
INSERT INTO libro VALUES (64, 'La red púrpura', 'Thriller', 'DeBolsillo', 400, 'Español', '2019-04-04', 'Tapa blanda', 19.90, 'Elena Blanco sigue las pistas de una red criminal que difunde contenido violento en la deep web mientras lucha contra sus propios demonios personales, con giros inesperados que la pondrán al borde de la ley.', 'Novia Gitana', 2, 13);
INSERT INTO libro VALUES (65, 'La nena', 'Thriller', 'DeBolsillo', 432, 'Español', '2020-09-17', 'Tapa dura', 20.90, 'La inspectora Blanco y su equipo se enfrentan a un nuevo caso en el que la desaparición de una mujer se convierte en el eje de una trama retorcida y peligrosa que amenaza sus propias vidas.', 'Novia Gitana', 3, 13);
INSERT INTO libro VALUES (66, 'The predator', 'Romance', 'B', 360, 'Español', '2023-01-12', 'Tapa dura', 20.90, 'Tristan Caine es una anomalía en los bajos fondos de la mafia. Es el único miembro de los Tenebrae que no pertenece a la familia. Sus habilidades no tienen igual, su moralidad es más que cuestionable y sus motivaciones son todo un enigma. Es letal, y lo sabe.Morana Vitalio tambien es consciente de ello. Es la hija de la familia rival, una mente tecnológica brillante capaz de hacer con un ordenador lo que Tristan con una pistola. Cuando un misterio de hace más de veinte años vuelve a salir a la luz, Morana se infiltra en la casa de Caine dispuesta a matarlo…, aunque ignora los lazos que los unen y que harán que el odio, el deseo y el pasado los aten sin remedio.', 'Darkverse', 1, 25);
INSERT INTO libro VALUES (67, 'The reaper', 'Romance', 'B', 355, 'Español', '2023-04-15', 'Tapa dura', 16.90, 'Tristan Caine, el Cazador, no estaba preparado para la llegada de Morana Vitalio. Tras romper una promesa que llevaba defendiendo años, dentro de él se origina una batalla encarnizada entre su futuro y su pasado. La única certeza que tiene es que la vida de Morana aún le pertenece.A Morana Vitalio, la línea entre enemigos y aliados cada vez le parece más difusa. Su mundo se ha desintegrado ante sus ojos y, ahora, se enfrenta al vacío de lo desconocido en territorio hostil. La única certeza que tiene es que ella es la dueña de su propia vida.', 'Darkverse', 2, 25);
INSERT INTO libro VALUES (68, 'The emperor', 'Romance', 'B', 393, 'Español', '2023-11-25', 'Tapa dura', 16.90, 'Dante Maroni ha sido entrenado desde su nacimiento. Un rebelde silencioso en las sombras, ha aprendido a ocultar su crueldad bajo su encanto, su brutalidad bajo sus trajes y su amor por una mujer bajo su silencio. Al infiltrarse en el sindicato responsable de los niños desaparecidos, Dante descubre información que destroza su realidad y lo obliga a desencadenar un juego letal. Hija del ama de llaves de Maroni, Amara ama a Dante desde hace más tiempo del que lo conoce. Secuestrada y torturada a la temprana edad de quince años, se pierde a sí misma, a su vida y a su hogar tal como lo conoce. Años después, protegida sin saberlo, encuentra algo parecido a la normalidad cuando su mundo vuelve a colapsar, lo que la obliga a unirse al juego.', 'Darkverse', 3, 25);
INSERT INTO libro VALUES (69, 'The finisher', 'Romance', 'B', 420, 'Español', '2024-01-03', 'Tapa dura', 16.90, 'Al crecer en las calles de Los Fortis, Alessandro,Alpha Villanova se abrió camino hasta la cima, luchando por su supervivencia, perdiendo todo en el proceso. Una ciudad que entonces lo rechazó es ahora la que él gobierna, aunque solo, como el rey de un imperio oscuro que pocos conocen.Lejos del mundo de Alpha, Zephyr de la Vega tiene una vida normal, una familia normal, un drama normal. Su mayor problema es que la gente intenta hacerla perder algunos kilos. Cuando un encuentro casual la pone en su camino, ella le hace una propuesta que cambiará el curso de sus vidas.', 'Darkverse', 4, 25);
INSERT INTO libro VALUES (70, 'The annihilator', 'Romance', 'B', 324, 'Español', '2024-06-25', 'Tapa dura', 16.90, 'Ella vive en las sombras. Él los gobierna. Ella es la luna y él la noche oscura que la envuelve.Ella está rodeada de demonios y él es el demonio más grande de todos.Y ella es suya. Pasión, obsesión, posesión. La suya es una historia de peligro, desviación, temor, deseos y los sabores más oscuros del amor.', 'Darkverse', 5, 25);

INSERT INTO compra VALUES (1);
INSERT INTO compra VALUES (2);

INSERT INTO detalle_compra VALUES (1, 43, 3);
INSERT INTO detalle_compra VALUES (1, 3, 1);
INSERT INTO detalle_compra VALUES (1, 21, 2);
INSERT INTO detalle_compra VALUES (2, 10, 1);
INSERT INTO detalle_compra VALUES (2, 24, 2);
INSERT INTO detalle_compra VALUES (2, 21, 1);
