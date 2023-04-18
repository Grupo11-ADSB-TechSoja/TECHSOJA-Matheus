-- create database techsoja;
use techsoja;
drop database techsoja;
create table Representante (
idRepresentante int primary key auto_increment,
Nome varchar (45) not null,
Sobrenome varchar (45) not null,
Login varchar (45)not null,
Senha varchar (45)not null,
Email varchar (80)not null,
TelefoneCel char(14),
fkEstabelecimento int, 
foreign key (fkEstabelecimento) references Estabelecimento(idEstabelecimento)
);
 
create table Estabelecimento (
idEstabelecimento int primary key auto_increment,
CNPJ char(14)not null,
NomeFantasia varchar (45) not null,
Email varchar (80)not null,
Telefone char(8)
);

create table silo (
idSilo int primary key auto_increment,
localidade varchar(45),
fkEstabelecimento int,
constraint fkEstabelescimentoSilo 
			foreign key (fkEstabelecimento) 
			references estabelecimento(idEstabelecimento)
)auto_increment = 100;


create table Sensor(
idSensor int primary key auto_increment,
StatusSensor varchar(10) not null,
 constraint Statuscheck check (StatusSensor 
 in('Ativo','Inativo','Manutenção')),
fk_silo int, 
constraint fkSiloSensor
	foreign key (fk_silo) 
references silo (idSilo)
) auto_increment = 10;

create table Logradouro (
idLogradouro int primary key auto_increment,
CEP char(8) not null,
Rua varchar(60) not null,
Numero varchar(45) not null,
Complemento varchar (45),
Bairro varchar(45) not null,
Cidade varchar(45) not null,
fkEstabelecimento int, foreign key (fkEstabelecimento) references Estabelecimento (idEstabelecimento)
);

desc Representante;
desc Logradouro;
desc Estabelecimento;

insert into Estabelecimento values
(null,'56895289000109','Fazenda do carmo','FazendaCarmo@gmail.com',null),
(null,'54837088000120','TorresSoja','roberto13torres@gmail.com',null),
(null,'83155573000111','camposoja','LUCASMARTINS@gmail.com','23252928'),
(null,'12365987458978','Ranch Magalhães','magalhaes1958@gmail.com','26699898'),
(null,'18381725000132','mundosoja','mundosoja@gmail.com','32365698'),
(null,'43324579000150','Rei da soja','reidasoja23@gmail.com',null);


insert into Representante  values
(null,'Gabriel','Silva','GabrielSilva','Gabriel1513','gabrielsilva@gmail.com','(15)99898-3698',1),
(null,'Vanderlei','Matos','vandinho','Vander2689','vanderleimatos@gmail.com','(16)95686-3788',5),
(null,'Roberto','Torres','Torres4588','6968torres','roberto13torres@gmail.com','(65)98986-4588',2),
(null,'Marcia','Magalhães','Marcia1958','marcia7878','magalhaes1958@gmail.com','(66)98785-4589',4),
(null,'Matheus','Martins','matheuzinho','matheus2004','matheuzinho@gmail.com','(66)98123-8987',6),
(null,'Lucas','Martins','LMartins','lucasmartins0665','LUCASMARTINS@gmail.com','(19)97878-8987',3);

select * from Estabelecimento;
select * from Representante;

desc Sensor;

-- tabela para armazenar o histórico de medições dos sensores 

CREATE TABLE historico_medicoes(
dataHora DATETIME,
fkSensor int,
temperatura int,
umidade int,
constraint fkMedicaoSensor foreign key (fkSensor) references sensor(idSensor),
primary key (fkSensor,dataHora)
);

desc historico_medicoes;

select * from estabelecimento;

insert into silo values
(default,'Ns.sra do Carmo',1);
insert into silo values 
(default,'Ns.sra do Carmo',1),
(default,'Santa fé',2),
(default,'Santa fé',2),
(default,'Santa fé',2);

select * from silo join estabelecimento 
	on idEstabelecimento = fkEstabelecimento;
    
insert into sensor values 
(default,'Ativo',10),
(default,'Ativo',11),
(default,'Ativo',12),
(default,'Ativo',13),
(default,'Ativo',14),
(default,'Manutenção',15),
(default,'Inativo',16);

insert into historico_medicoes values
('2023-04-10 00:00:00','10','12.3','63'),
('2023-04-10 01:00:00','10','12.5','63'),
('2023-04-10 02:00:00','10','12.9','64'),
('2023-04-10 03:00:00','10','13','65'),
('2023-04-10 04:00:00','10','13.4','65'),
('2023-04-10 05:00:00','10','13.5','65'),
('2023-04-10 06:00:00','10','13.5','65'),
('2023-04-10 07:00:00','10','13.6','65'),
('2023-04-10 08:00:00','10','13.9','66'),
('2023-04-10 09:00:00','10','14','66'),
('2023-04-10 10:00:00','10','14','66'),
('2023-04-10 11:00:00','10','14.2','67'),
('2023-04-10 12:00:00','10','14.1','67'),
('2023-04-10 13:00:00','10','15','67'),
('2023-04-10 14:00:00','10','15.6','67'),
('2023-04-10 15:00:00','10','17','67'),
('2023-04-10 16:00:00','10','18','68'),
('2023-04-10 17:00:00','10','17.7','68'),
('2023-04-10 18:00:00','10','17.4','68'),
('2023-04-10 19:00:00','10','16.8','68'),
('2023-04-10 20:00:00','10','13','67'),
('2023-04-10 21:00:00','10','12.9','67'),
('2023-04-10 22:00:00','10','12.5','66'),
('2023-04-10 23:00:00','10','12.3','65'),
('2023-04-10 00:00:00','11','12.3','64'),
('2023-04-10 01:00:00','11','12.5','64'),
('2023-04-10 02:00:00','11','12.9','64'),
('2023-04-10 03:00:00','11','13','65'),
('2023-04-10 04:00:00','11','13.4','65'),
('2023-04-10 05:00:00','11','13.5','65'),
('2023-04-10 06:00:00','11','13.5','66'),
('2023-04-10 07:00:00','11','13.6','66'),
('2023-04-10 08:00:00','11','13.9','66'),
('2023-04-10 09:00:00','11','14','67'),
('2023-04-10 10:00:00','11','14.5','67'),
('2023-04-10 11:00:00','11','14.8','67'),
('2023-04-10 12:00:00','11','15','68'),
('2023-04-10 13:00:00','11','16.7','68'),
('2023-04-10 14:00:00','11','17.5','68'),
('2023-04-10 15:00:00','11','18.7','69'),
('2023-04-10 16:00:00','11','18.6','68'),
('2023-04-10 17:00:00','11','18.6','67'),
('2023-04-10 18:00:00','11','18','65'),
('2023-04-10 19:00:00','11','17.8','65'),
('2023-04-10 20:00:00','11','17.7','63'),
('2023-04-10 21:00:00','11','17.6','62'),
('2023-04-10 22:00:00','11','17.4','61'),
('2023-04-10 23:00:00','11','16.8','61'),
('2023-04-10 00:00:00','10','12.3','63'),
('2023-04-10 01:00:00','12','12.5','63'),
('2023-04-10 02:00:00','12','12.9','64'),
('2023-04-10 03:00:00','12','13','64'),
('2023-04-10 04:00:00','12','13.4','65'),
('2023-04-10 05:00:00','12','13.5','65'),
('2023-04-10 06:00:00','12','13.5','66'),
('2023-04-10 07:00:00','12','13.6','66'),
('2023-04-10 08:00:00','12','13.9','66'),
('2023-04-10 09:00:00','12','14.8','67'),
('2023-04-10 10:00:00','12','15','68'),
('2023-04-10 11:00:00','12','15.8','68'),
('2023-04-10 12:00:00','12','15.9','68'),
('2023-04-10 13:00:00','12','16.5','69'),
('2023-04-10 14:00:00','12','16.9','69'),
('2023-04-10 15:00:00','12','17.9','70'),
('2023-04-10 16:00:00','12','18.7','70'),
('2023-04-10 17:00:00','12','18.2','68'),
('2023-04-10 18:00:00','12','17.7','68'),
('2023-04-10 19:00:00','12','17','67'),
('2023-04-10 20:00:00','12','16.4','66'),
('2023-04-10 21:00:00','12','16','65'),
('2023-04-10 22:00:00','12','15.3','63'),
('2023-04-10 23:00:00','12','13.3','62'),
('2023-04-10 00:00:00','13','12.3','62'),
('2023-04-10 01:00:00','13','12.5','63'),
('2023-04-10 02:00:00','13','12.9','63'),
('2023-04-10 03:00:00','13','13','64'),
('2023-04-10 04:00:00','13','13.4','64'),
('2023-04-10 05:00:00','13','13.5','65'),
('2023-04-10 06:00:00','13','13.5','65'),
('2023-04-10 07:00:00','13','13.6','66'),
('2023-04-10 08:00:00','13','13.9','66'),
('2023-04-10 09:00:00','13','16','66'),
('2023-04-10 10:00:00','13','17.8','67'),
('2023-04-10 11:00:00','13','19','67'),
('2023-04-10 12:00:00','13','20.9.3','67.9'),
('2023-04-10 13:00:00','13','23.7','67'),
('2023-04-10 14:00:00','13','24.4','60'),
('2023-04-10 15:00:00','13','25','61'),
('2023-04-10 16:00:00','13','24.1','62'),
('2023-04-10 17:00:00','13','23.9','62'),
('2023-04-10 18:00:00','13','23','63'),
('2023-04-10 19:00:00','13','22.5','64'),
('2023-04-10 20:00:00','13','21.8','65'),
('2023-04-10 21:00:00','13','20','65'),
('2023-04-10 22:00:00','13','19.1','65'),
('2023-04-10 23:00:00','13','18.7','66'),
('2023-04-10 00:00:00','14','12.3','66'),
('2023-04-10 01:00:00','14','12.5','59'),
('2023-04-10 02:00:00','14','12.9','60'),
('2023-04-10 03:00:00','14','13','60'),
('2023-04-10 04:00:00','14','13.4','61'),
('2023-04-10 05:00:00','14','13.5','62'),
('2023-04-10 06:00:00','14','13.5','62'),
('2023-04-10 07:00:00','14','13.6','62'),
('2023-04-10 08:00:00','14','13.9','63'),
('2023-04-10 09:00:00','14','14.7','64'),
('2023-04-10 10:00:00','14','15','64.9'),
('2023-04-10 11:00:00','14','15','65.6'),
('2023-04-10 12:00:00','14','15.6','66'),
('2023-04-10 13:00:00','14','16','67'),
('2023-04-10 14:00:00','14','16.9','67.1'),
('2023-04-10 15:00:00','14','17.4','66'),
('2023-04-10 16:00:00','14','17','66'),
('2023-04-10 17:00:00','14','16.7','65.8'),
('2023-04-10 18:00:00','14','16.4','64.9'),
('2023-04-10 19:00:00','14','16','64'),
('2023-04-10 20:00:00','14','15.2','63.7'),
('2023-04-10 21:00:00','14','14.7','63.1'),
('2023-04-10 22:00:00','14','14','63'),
('2023-04-10 23:00:00','14','13.1.3','61');