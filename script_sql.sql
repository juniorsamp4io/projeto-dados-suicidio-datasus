
create database banco_suicidios;
use banco_suicidios;

create table estado (
    id int auto_increment primary key,
    uf varchar(2) not null
);

create table civil (
    id int auto_increment primary key,
    descricao varchar(50) not null
);

create table estudo (
    id int auto_increment primary key,
    descricao varchar(100) not null
);

create table causa_obito (
    id int auto_increment primary key,
    codigo varchar(10) not null,
    descricao varchar(150)
);

create table registros (
    id int auto_increment primary key,
    ano int not null,
    idade int,
    sexo varchar(20),
    id_estado int,
    id_civil int,
    id_estudo int,
    id_causa int,
    foreign key (id_estado) references estado(id),
    foreign key (id_civil) references civil(id),
    foreign key (id_estudo) references estudo(id),
    foreign key (id_causa) references causa_obito(id)
);

insert into estado (uf) values
('MS'),('SP'),('RJ'),('MG'),('PR'),('SC'),('RS'),('GO'),('MT'),('BA');

insert into civil (descricao) values
('solteiro'),('casado'),('viuvo'),('divorciado'),('uniao estavel'),('ignorado');

insert into estudo (descricao) values
('analfabeto'),
('fundamental i'),
('fundamental ii'),
('ensino medio'),
('superior incompleto'),
('superior completo'),
('ignorado');

insert into causa_obito (codigo, descricao) values
('x70','enforcamento'),
('x72','arma de fogo'),
('x74','outra arma de fogo'),
('x61','intoxicacao por medicamentos'),
('x68','intoxicacao por pesticidas');

insert into registros (ano, idade, sexo, id_estado, id_civil, id_estudo, id_causa) values
(2010,28,'masculino',1,1,4,1),
(2012,34,'feminino',2,2,6,4),
(2015,19,'masculino',1,1,3,1),
(2015,45,'masculino',4,4,4,2),
(2017,62,'feminino',3,3,2,4),
(2018,23,'feminino',1,1,5,1),
(2018,50,'masculino',9,2,1,5),
(2019,31,'masculino',2,5,4,1),
(2019,57,'feminino',5,2,6,1),
(2019,41,'masculino',1,4,4,3),
(2010,52,'masculino',2,2,2,2),
(2010,21,'feminino',6,1,4,4),
(2011,40,'masculino',3,4,4,1),
(2011,33,'feminino',1,2,6,1),
(2011,67,'masculino',7,3,1,3),
(2012,18,'masculino',4,1,3,1),
(2012,29,'feminino',1,5,5,4),
(2013,47,'masculino',8,2,4,5),
(2013,25,'masculino',2,1,6,1),
(2013,58,'feminino',10,3,2,4),
(2014,36,'masculino',1,2,4,2),
(2014,22,'feminino',5,1,4,1),
(2014,70,'masculino',6,3,1,1),
(2015,31,'feminino',3,5,6,4),
(2015,55,'masculino',9,4,2,5),
(2016,26,'masculino',2,1,5,1),
(2016,42,'feminino',1,2,4,4),
(2016,60,'masculino',4,2,6,2),
(2016,17,'feminino',7,1,3,1),
(2017,38,'masculino',5,4,4,1),
(2017,49,'feminino',2,2,4,4),
(2017,24,'masculino',1,1,6,1),
(2017,65,'masculino',8,3,2,3),
(2018,30,'masculino',3,5,4,1),
(2018,44,'feminino',6,4,6,4),
(2018,19,'feminino',2,1,4,1),
(2018,53,'masculino',1,2,3,5),
(2018,35,'masculino',10,2,4,1),
(2019,27,'feminino',4,1,6,4),
(2019,48,'masculino',7,4,4,2),
(2019,20,'masculino',1,1,4,1),
(2019,63,'feminino',9,3,1,1),
(2019,39,'masculino',5,2,5,1),
(2019,32,'feminino',2,1,4,4),
(2019,43,'masculino',1,5,4,2),
(2019,51,'masculino',3,2,2,1),
(2019,25,'feminino',8,1,6,4),
(2019,56,'masculino',6,2,4,5),
(2019,34,'masculino',1,4,4,1),
(2019,46,'feminino',2,2,6,1);

create view vw_lista_casos as
select r.idade, r.sexo, e.uf
from registros r
join estado e on r.id_estado = e.id;

create view vw_qtd_estado as
select e.uf, count(r.id) as quantidade
from registros r
join estado e on r.id_estado = e.id
group by e.uf;

create view vw_media_idade as
select e.uf, round(avg(r.idade),1) as media
from registros r
join estado e on r.id_estado = e.id
group by e.uf;

create view vw_por_escolaridade as
select es.descricao, count(r.id) as total
from registros r
join estudo es on r.id_estudo = es.id
group by es.descricao;

create view vw_por_estado_civil as
select c.descricao, count(r.id) as total
from registros r
join civil c on r.id_civil = c.id
group by c.descricao;

select * from vw_qtd_estado;
select * from vw_media_idade;
select * from vw_por_escolaridade;
select * from vw_por_estado_civil;