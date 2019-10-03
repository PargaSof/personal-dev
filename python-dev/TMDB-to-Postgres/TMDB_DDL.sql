CREATE TABLE prd.review(
	review_id VARCHAR (50) PRIMARY KEY,
	author VARCHAR (100),
	content VARCHAR (20000),
	created_on TIMESTAMP NOT NULL DEFAULT NOW()
);


CREATE TABLE prd.movie(
	movie_id INTEGER PRIMARY KEY,
	title VARCHAR (150) NOT NULL,
	popularity NUMERIC (5,2),
	release_date DATE,
	created_on TIMESTAMP NOT NULL DEFAULT NOW()
);


CREATE TABLE prd.movie_review(
	movie_id INTEGER,
	review_id VARCHAR (50),
	created_on TIMESTAMP NOT NULL,
	PRIMARY KEY (movie_id, review_id),
	FOREIGN KEY (movie_id) REFERENCES prd.movie (movie_id),
	FOREIGN KEY (review_id) REFERENCES prd.review (review_id)
);


CREATE TABLE prd.genre(
	genre_id INTEGER PRIMARY KEY,
	name VARCHAR (80) NOT NULL,
	created_on TIMESTAMP NOT NULL DEFAULT NOW()
);


CREATE TABLE prd.movie_genre(
	movie_id INTEGER NOT NULL,
	genre_id INTEGER NOT NULL,
	created_on TIMESTAMP NOT NULL DEFAULT NOW(),
	PRIMARY KEY (movie_id, genre_id),
	FOREIGN KEY (movie_id) REFERENCES prd.movie (movie_id),
	FOREIGN KEY (genre_id) REFERENCES prd.genre (genre_id)
);


CREATE TABLE prd.movie_prod_country(
	movie_id INTEGER,
	country_iso VARCHAR(20),
	created_on TIMESTAMP NOT NULL DEFAULT NOW(),
	PRIMARY KEY (movie_id, country_iso),
	FOREIGN KEY (movie_id) REFERENCES test.movie (movie_id),
	FOREIGN KEY (country_iso) REFERENCES test.country (country_iso)
);


CREATE TABLE prd.movie_director(
	director_id INTEGER,
	movie_id INTEGER,
	name VARCHAR (80),
	created_on TIMESTAMP NOT NULL DEFAULT NOW(),
	PRIMARY KEY (director_id,movie_id),
	FOREIGN KEY (movie_id) REFERENCES test.movie (movie_id)
);


CREATE TABLE prd.country(
	country_iso VARCHAR (5) PRIMARY KEY,
	name VARCHAR (80) UNIQUE NOT NULL
);

CREATE TABLE prd.movie_play_country(
	movie_id INTEGER,
	country_iso VARCHAR (20),
	release_date TIMESTAMP,
	PRIMARY KEY (movie_id, country_iso),
	FOREIGN KEY (movie_id) REFERENCES test.movie (movie_id),
	FOREIGN KEY (country_iso) REFERENCES test.country (country_iso)
);