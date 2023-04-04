create table if not exists `country` (
  `id` bigint primary key unique not null auto_increment,
  `name` varchar(100) unique not null
);

create table if not exists `region` (
  `id` bigint primary key unique not null auto_increment,
  `name` varchar(200) not null,
  `country` bigint not null,
  foreign key (`country`) references `country` (`id`)
);

create table if not exists `district` (
  `id` bigint primary key unique not null auto_increment,
  `name` varchar(200) unique not null,
  `region` bigint not null,
  foreign key (`region`) references `region` (`id`)
);

create table if not exists `city` (
  `id` bigint primary key unique not null auto_increment,
  `name` varchar(200) not null,
  `region` bigint not null,
  `district` bigint not null,
  foreign key (`district`) references `district` (`id`),
  foreign key (`region`) references `region` (`id`)
);
