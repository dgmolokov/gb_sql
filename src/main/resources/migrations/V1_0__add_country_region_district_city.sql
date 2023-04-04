create table if not exists `country` (
    `id` int primary key unique not null auto_increment,
    `name` varchar(20) unique not null
);

create table if not exists `region` (
    `id` int primary key unique not null auto_increment,
    `name` varchar(20) not null,
    `country` int not null,
    foreign key (`country`) references `country` (`id`)
);

create table if not exists `district` (
    `id` int primary key unique not null auto_increment,
    `name` varchar(20) unique not null,
    `region` int not null,
    foreign key (`region`) references `region` (`id`)
);

create table if not exists `city` (
	`id` int primary key unique not null auto_increment,
	`name` varchar(20) not null,
	`region` int not null,
	`district` int not null,
	foreign key (`district`) references `district` (`id`),
	foreign key (`region`) references `region` (`id`)
);
