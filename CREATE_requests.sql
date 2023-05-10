-- Musical Genre
CREATE TABLE IF NOT EXISTS MusicalGenre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

-- Musicant
CREATE TABLE IF NOT EXISTS Musicant (
	id SERIAL PRIMARY KEY,
	name VARCHAR(90) NOT NULL
);

-- Genre Musicant Link (many to many)
CREATE TABLE IF NOT EXISTS GenreMusicantLink (
	id SERIAL PRIMARY KEY,
	genreID INTEGER REFERENCES MusicalGenre(id),
	musicantID INTEGER REFERENCES Musicant(id)
);

-- Album
CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	issue_year INTEGER CHECK(issue_year>1000)
);

-- Musicant Album Link (many to many)
CREATE TABLE IF NOT EXISTS MusicantAlbumLink (
	id SERIAL PRIMARY KEY,
	albumID INTEGER REFERENCES Album(id),
	musicantID INTEGER REFERENCES Musicant(id)
);

-- Tracks
CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	duration INTEGER CHECK(duration > 0),	
	albumID INTEGER REFERENCES Album(id)
);

-- Song-Book
CREATE TABLE IF NOT EXISTS SongBook (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	issue_year INTEGER CHECK(issue_year>1000)
);

-- Song-Book Track Link (many to many)
CREATE TABLE IF NOT EXISTS SongBookTrackLink (
	id SERIAL PRIMARY KEY,
	trackID INTEGER REFERENCES Tracks(id),
	songbookID INTEGER REFERENCES SongBook(id)
);
