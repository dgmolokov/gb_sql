create table if not exists `country` (
    `ID` int primary key unique not null auto_increment,
    `name` varchar(45) unique not null
);

create table if not exists `region` (
    `ID` int primary key unique not null auto_increment,
    `name` varchar(45) not null,
    `country` int not null,
    foreign key (`country`) references `country` (`ID`)
);

create table if not exists `district` (
    `ID` int primary key unique not null auto_increment,
    `name` varchar(45) unique not null,
    `region` int not null,
    foreign key (`region`) references `region` (`ID`)
);

create table if not exists `city` (
	`ID` int primary key unique not null auto_increment,
	`name` varchar(45) not null,
	`region` int not null,
	`district` int default null,
	foreign key (`district`) references `district` (`ID`),
	foreign key (`region`) references `region` (`ID`)
);
