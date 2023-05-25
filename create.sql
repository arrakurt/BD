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