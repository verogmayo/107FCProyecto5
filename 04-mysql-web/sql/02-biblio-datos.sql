
create table if not exists libros(
isbn int primary key,
titulo varchar (80),
autor varchar(100),
editorial varchar(80),
genero enum('Novela','Teatro','Ficción','Novela
Autobiográfica','Aventuras'),
pvp float)engine=innodb;

create table if not exists usuarios(
nmat int primary key,
nombre varchar(50),
direccion varchar(80),
localidad varchar(100),
provincia varchar(50),
fecha_nac date)engine=innodb;

create table if not exists ejemplares(
isbn int,
num_ejem int,
primary key(isbn, num_ejem),
foreign key(isbn) references libros(isbn)
on delete cascade on update cascade)engine=innodb;

create table if not exists prestamos(
isbn int,
num_ejem int,
nmat int,
fecha_prest date,
fecha_dev date,
primary key (isbn, num_ejem, nmat, fecha_prest),
foreign key(isbn, num_ejem) references ejemplares(isbn, num_ejem)
on delete cascade on update cascade,
foreign key(nmat) references usuarios(nmat)
on delete cascade on update cascade)engine=innodb;

-- Introducir datos
insert into libros values
(004,'D.Quijote de la Mancha','Miguel de Cervantes','Francisco
Robles','Novela',150),
(005,'La Vida es Sueño','Calderón de la Barca','Ediciones
Catedra','Teatro',55.23),
(006,'El alcalde de Zalamea','Calderón de la Barca','Ediciones
Catedra','Teatro',32.45),
(007,'El médico de su honra','Calderón de la Barca','Ediciones
Catedra','Teatro',32.45),
(008,'Zalacaín el Aventurero','Pio Baroja','Editorial
Alhambra','Ficcion',14.26),
(009,'El árbol de la Ciencia','Pio Baroja','Editorial Alhambra','Novela
Autobiográfica',23.45),
(010,'Memorias de un hombre de acción','Pio Baroja','Editorial
Alhambra','Ficcion',36.78),
(011,'Rinconete y Cortadillo','Miguel de Cervantes','Editorial
Alhambra','Aventuras',13.56);
insert into usuarios values
(01,'Amor','C/ Pelambres nº2 1º','Benavente','Zamora','2000-05-09'),
(02,'Ambrosio','C/ Pelambres nº2 1º','Benavente','Zamora','2000-05-09'),
(03,'Maria','C/ Pelambres nº2 1º','Benavente','Zamora','2000-05-09'),
(04,'Heraclio','C/ Pelambres nº2 1º','Benavente','Zamora','2000-05-09'),
(05,'Meli','C/ Pelambres nº2 1º','Benavente','Zamora','2000-05-09');
insert into ejemplares values
(004,01),
(004,02),
(004,03),
(005,01),
(005,02),
(005,03),
(006,01),
(006,02),
(007,01),
(007,02),
(008,01),
(008,02),
(009,01),
(009,02),
(010,01),
(010,02),
(010,03),
(011,01);
insert into prestamos values
(004,02,02,'2020-02-09','2020-02-19'),
(008,01,02,'2020-02-01','2020-02-10'),
(010,03,02,'2020-01-28','2020-02-07'),
(008,02,04,'2020-01-20','2020-01-30'),
(010,01,04,'2020-02-10','2020-02-15'),
(007,01,04,'2020-01-12','2020-01-16'),
(008,01,01,'2020-02-19',null),
(010,02,01,'2020-03-01','2020-03-07'),
(009,01,05,'2020-02-29','2020-03-01'),
(006,01,05,'2020-01-20','2020-02-01'),
(005,01,05,'2020-01-20','2020-02-01'),
(005,03,03,'2020-01-20','2020-02-01'),
(008,01,03,'2020-01-20','2020-02-01'),
(009,02,03,'2020-01-20','2020-02-01');