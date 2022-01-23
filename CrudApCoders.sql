drop table unidades;

CREATE TABLE inquilinos(
idinquilinos serial NOT NULL,
nome varchar(80) NOT NULL,
cpf varchar(14) NOT NULL,
idade int NOT NULL,
sexo varchar(14) NOT NULL,
telefone varchar(15) NOT NULL,
email varchar(80) NOT NULL,
PRIMARY KEY(idinquilinos));

create table unidades(
idunidades serial not null,
proprietario varchar(80) not null, 
condominio varchar(40) not null,
cep varchar(14) not null,
rua varchar(80) not null,
nr int not null,
complemento varchar(40),
bairro varchar(100) not null,
cidade varchar(75) not null,
uf varchar(14) not null,
primary key(idunidades));

create table despesas(
iddespesa serial not null,
descricao varchar(30),
tipodespesa varchar(30) not null,
valor varchar(30) not null,
vencimentofatura date not null,
statuspagamento varchar(30) not null,
primary key(iddespesa));