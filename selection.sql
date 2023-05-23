create table if not exists Genres (
	id serial primary key,
	title varchar (50) not null
);

drop table Genres CASCADE

create table if not exists Executor(
	id serial primary key,
	nickname varchar (50) not null
);

drop table Executor CASCADE

create table if not exists Album (
	id serial primary key,
	title varchar (50) not null,
	year integer not null
);

drop table Album CASCADE

create table if not exists Track (
	id integer primary key,
	title varchar (50) not null,
	time time not null,
	Album_id integer not null REFERENCES Album(id)
);

drop table Track CASCADE

create table if not exists Collection (
	id serial primary key,
	title varchar (50) not null,
	year integer not null
);

drop table Collection CASCADE

create table if not exists GenresExecutor (
	Genres_id integer  references Genres(id),
	Executor_id integer REFERENCES Executor(id),
	constraint ge primary key (Genres_id, Executor_id)
);

drop table GenresExecutor CASCADE

create table if not exists ExecutorAlbum (
	Executor_id integer  references Executor(id),
	Album_id integer REFERENCES Album(id),
	constraint ea primary key (Executor_id, Album_id)
);

drop table ExecutorAlbum CASCADE

create table if not exists TrackCollection (
	Track_id integer  references Track(id),
	Collection_id integer REFERENCES Collection(id),
	constraint tc primary key (Track_id, Collection_id)
);

drop table TrackCollection CASCADE

insert into Genres (id, title)  
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
	(2, 'Results May Vary', 2003),
	(3, 'Daddy Cool', 1976),
	(4, 'Indigo', 2022),
	(5, 'The Fame', 2008),
	(6, 'Good Girl Gone Bad', 2007),
	(7, 'Planet Her', 2018),
	(8, 'Strong', 2010);

insert into Track (id, title, time, Album_id)
values
	(1, 'I Miss You', '00:04:02', 1),
	(2, 'Army of My', '00:04:33', 1),
	(3, 'Gimme The Mic', '00:03:03', 2),
	(4, 'Daddy Cool', '00:03:29', 3),
	(5, 'No Women no cry', '00:05:00', 3),
	(6, 'Still life', '00:04:14', 4),
	(7, 'lonely', '00:03:50', 4),
	(8, 'Poker Face', '00:03:58', 5),
	(9, 'Just Dance', '00:04:06', 5),
	(10, 'Umbrella', '00:04:35', 6),
	(11, 'Push Up on My', '00:03:15', 6),
	(12, 'Get Into It', '00:02:18', 7),
	(13, 'Up and Down', '00:02:31', 7),
	(14, 'Suddenly', '00:03:21', 8),
	(15, 'Why Do You Cry', '00:03:25', 8);

insert into Collection (id, title, year) 
values
	(1, 'the best', 1995),
	(2, 'Retro', 2003),
	(3, 'dance floor', 1976),
	(4, 'rock', 2020),
	(5, 'electronic', 2008),
	(6, 'Girl', 2007),
	(7, 'hip-hop', 2019),
	(8, 'pop', 2010);

drop table Collection CASCADE

UPDATE Collection
SET year = 2019
WHERE id = 7;

UPDATE Collection
SET year = 2020
WHERE id = 4;

insert into GenresExecutor (Genres_id, Executor_id)
values
	(1, 1),
	(1, 5),
	(1, 7),
	(2, 2),
	(3, 3),
	(3, 8),
	(4, 4),
	(4, 6),
	(4, 7),
	(5, 3),
	(5, 4),
	(5, 5),
	(5, 6),
	(5, 7);

insert into ExecutorAlbum (Executor_id, Album_id)
values
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);
	
insert into TrackCollection (Collection_id, Track_id)
values	
	(1, 1),
	(1, 4),
	(1, 5),
	(2, 7),
	(2, 8),
	(3, 4),
	(3, 5),
	(3, 6),
	(4, 2),
	(5, 1),
	(6, 1),
	(6, 5),
	(6, 6),
	(6, 7),
	(7, 4),
	(7, 6),
	(8, 3),
	(8, 8);
	

select title, count(nickname) from Genres g
left join GenresExecutor ge on g.id = ge.Genres_id
left join Executor e on ge.Executor_id = e.id
group by g.title
order by count(e.id) desc;


select title, year from Album a
left join Track t on t.Album_id = a.id
group by a.title
where (a.year >= 2019) and (a.year <= 2020);








