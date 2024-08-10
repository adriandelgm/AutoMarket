create database purisCar

use purisCar

create table users (
Id int not null auto_increment,
Name VARCHAR (50) not null,
Lastname VARCHAR (50),
Email  VARCHAR (50) not null,
User  VARCHAR (50) not null,
Password VARCHAR (50) not null,
Phone VARCHAR (50) not null,
Address VARCHAR (50) not null,
primary key (Id)
);

select * from users
select * from autos

create table autos (
id int not null auto_increment,
correoUsuario VARCHAR (65),
nombreUsuario VARCHAR (50),
apellidoUsuario VARCHAR (50),
Usuario VARCHAR (50),
telefono int,
marca VARCHAR (50),
modelo VARCHAR (50),
fabricacion int,
estilo VARCHAR (50),
img VARCHAR (50), 
estatus VARCHAR (50), 
primary key (id)
);
