create table if not exists Genres (
	id serial primary key,
	title varchar (50) not null
);

create table if not exists Executor(
	id serial primary key,
	nickname varchar (50) not null
);

create table if not exists Album (
	id serial primary key,
	title varchar (50) not null,
	year integer not null
);

create table if not exists Track (
	id integer primary key,
	title varchar (50) not null,
	time time not null,
	Album_id integer not null REFERENCES Album(id)
);


create table if not exists Collection (
	id serial primary key,
	title varchar (50) not null,
	year integer not null
);

create table if not exists GenresExecutor (
	Genres_id integer  references Genres(id),
	Executor_id integer REFERENCES Executor(id),
	constraint ge primary key (Genres_id, Executor_id)
);

create table if not exists ExecutorAlbum (
	Executor_id integer  references Executor(id),
	Album_id integer REFERENCES Album(id),
	constraint ea primary key (Executor_id, Album_id)
);

create table if not exists TrackCollection (
	Track_id integer  references Track(id),
	Collection_id integer REFERENCES Collection(id),
	constraint tc primary key (Track_id, Collection_id)
);

/*insert into Genres (id, title)  
values
	(1, 'electronic'),
	(2, 'rock'),
	(3, 'disco'),
	(4, 'hip-hop'),
	(5, 'pop-music');

insert into Executor (id, nickname)
values
	(1, 'Bjork'),
	(2, 'Linkin Park'),
	(3, 'Boney M.'),
	(4, 'RM'),
	(5, 'Lady Gaga'),
	(6, 'Rihanna'),
	(7, 'Doja Cat'),
	(8, 'Thomas Anders');

insert into Album (id, title, year)
values
	(1, 'Post', 1995),
	(2, 'Results May Vary' 2003),
	(3, 'Daddy Cool', 1976),
	(4, 'Indigo', 2022),
	(5, 'The Fame', 2008),
	(6, 'Good Girl Gone Bad' 2007),
	(7, 'Planet Her'2021),
	(8, 'Strong', 2010);

insert into Track (id, title, time)
values
	(1, 'I Miss You', '00:04:02'),
	(2, 'Army of Me', '00:04:33'),
	(3, 'Gimme The Mic', '00:03:03'),
	(4, 'Daddy Cool', '00:03:29'),
	(5, 'No Women no cry', '00:05:00'),
	(6, 'Still life', '00:04:14'),
	(7, 'lonely', '00:03:50'),
	(8, 'Poker Face', '00:03:58'),
	(9, 'Just Dance', '00:04:06'),
	(10, 'Umbrella', '00:04:35'),
	(11, 'Push Up on Me', '00:03:15'),
	(12, 'Get Into It', '00:02:18'),
	(13, 'Up and Down', '00:02:31'),
	(14, 'Suddenly', '00:03:21'),
	(15, 'Why Do You Cry', '00:03:28');

DROP table Track cascade */


	