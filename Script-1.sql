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
	id integer not null references Album(id),
	title varchar (50) not null,
	time varchar not null
);
create table if not exists Collection (
	id serial primary key,
	title varchar (50) not null,
	year integer not null
);
create table if not exists GenresExecutor (
	Genres_id integer  references Genres(id),
	Executor_id integer REFERENCES Executor(id)
);
create table if not exists ExecutorAlbum (
	Executor_id integer  references Executor(id),
	Album_id integer REFERENCES Album(id)
);
create table if not exists TrackCollection (
	Track_id integer  references Track(id),
	Collection_id integer REFERENCES Collection(id)
);
	
