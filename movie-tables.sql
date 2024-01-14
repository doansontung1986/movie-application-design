drop database if exists movie_db;

create database movie_db;

USE movie_db;

DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS blog;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS episode;

create table movie (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    length_min INT NOT NULL,
    create_at DATETIME NOT NULL
);

create table director (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    last_update TIMESTAMP NOT NULL,
	create_at DATETIME NOT NULL
);

create table movie_director (
	movie_id INT,
    director_id INT,
	create_at DATETIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(id),
    FOREIGN KEY (director_id) REFERENCES director(id)
);

create table actor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    last_update TIMESTAMP NOT NULL,
	create_at DATETIME NOT NULL
);

create table movie_actor (
	movie_id INT,
    actor_id INT,
	create_at DATETIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(id),
    FOREIGN KEY (actor_id) REFERENCES actor(id)
);

create table user (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE,
    create_at DATETIME NOT NULL	
);

create table review (
	id INT PRIMARY KEY AUTO_INCREMENT,
	rating INT NOT NULL,
	create_at DATETIME NOT NULL,
    movie_id INT,
    user_id INT,
	FOREIGN KEY (movie_id) REFERENCES movie(id),
	FOREIGN KEY (user_id) REFERENCES user(id)
);

create table blog (
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(45) NOT NULL,
    description VARCHAR(255),
	create_at DATETIME NOT NULL,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES user(id)	
);

create table comment (
	id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(45) NOT NULL,
	create_at DATETIME NOT NULL,
    user_id INT,
    blog_id INT,
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (blog_id) REFERENCES blog(id)	
);

create table genre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL UNIQUE,
    last_update TIMESTAMP NOT NULL,
    create_at DATETIME NOT NULL
);

create table movie_genre (
	movie_id INT,
    genre_id INT,
	create_at DATETIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
);

create table episode (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL UNIQUE,
    duration_minutes INT,
    create_at DATETIME NOT NULL,
    movie_id INT,
	FOREIGN KEY (movie_id) REFERENCES movie(id)
);

INSERT INTO movie (name, length_min, create_at)
VALUES ('Blade Runner 2049',153, '2022-01-03'),
('Dunkirk',106, '2022-05-03'),
('Geostorm',121, '2022-08-03'),
('Thor: Ragnarok',107, '2022-11-03'),
('Jigsaw',116, '2022-01-03'),
('The Death of Stalin',98, '2022-01-03'),
('The Lego Ninjago Movie',101, '2022-01-03'),
('Murder on the Orient Express',135, '2022-01-03'),
('Paddington 2',88, '2022-01-03'),
('Breathe',117, '2022-01-03'),
('Blade Runner',127, '2022-01-03'),
('Victoria and Abdul',112, '2022-01-03');

INSERT INTO director (first_name, last_name, last_update, create_at)
VALUES ('Stoddard','Ondracek','2006-02-15 04:34:33','2022-01-01'),
('Tyrus','Nardoni','2006-02-15 04:34:33','2022-01-01'),
('Tracey','Bartaletti','2006-02-15 04:34:33','2022-01-01'),
('Justin','Castenda','2006-02-15 04:34:33','2022-01-01'),
('Isidoro','Summerson','2006-02-15 04:34:33','2022-01-01'),
('Ingaberg','Chatters','2006-02-15 04:34:33','2022-01-01'),
('Ailey','Cranham','2006-02-15 04:34:33','2022-01-01'),
('Augustin','Pittman','2006-02-15 04:34:33','2022-01-01'),
('Jean','Dowtry','2006-02-15 04:34:33','2022-01-01'),
('Anetta','Canto','2006-02-15 04:34:33','2022-01-01');

INSERT INTO movie_director(movie_id, director_id, create_at)
VALUES (1, 5,'2022-01-01'),
(2, 3,'2022-01-01'),
(4, 2,'2022-01-01'),
(1, 2,'2022-01-01'),
(2, 4,'2022-01-01');

INSERT INTO actor (first_name, last_name, last_update, create_at)
VALUES ('PENELOPE','GUINESS','2006-02-15 04:34:33','2022-01-01'),
('NICK','WAHLBERG','2006-02-15 04:34:33','2022-01-01'),
('ED','CHASE','2006-02-15 04:34:33','2022-01-01'),
('JENNIFER','DAVIS','2006-02-15 04:34:33','2022-01-01'),
('JOHNNY','LOLLOBRIGIDA','2006-02-15 04:34:33','2022-01-01'),
('BETTE','NICHOLSON','2006-02-15 04:34:33','2022-01-01'),
('GRACE','MOSTEL','2006-02-15 04:34:33','2022-01-01'),
('MATTHEW','JOHANSSON','2006-02-15 04:34:33','2022-01-01'),
('JOE','SWANK','2006-02-15 04:34:33','2022-01-01'),
('CHRISTIAN','GABLE','2006-02-15 04:34:33','2022-01-01'),
('ZERO','CAGE','2006-02-15 04:34:33','2022-01-01'),
('KARL','BERRY','2006-02-15 04:34:33','2022-01-01'),
('UMA','WOOD','2006-02-15 04:34:33','2022-01-01'),
('VIVIEN','BERGEN','2006-02-15 04:34:33','2022-01-01'),
('CUBA','OLIVIER','2006-02-15 04:34:33','2022-01-01'),
('FRED','COSTNER','2006-02-15 04:34:33','2022-01-01'),
('HELEN','VOIGHT','2006-02-15 04:34:33','2022-01-01'),
('DAN','TORN','2006-02-15 04:34:33','2022-01-01');

INSERT INTO movie_actor (movie_id, actor_id, create_at)
VALUES (2, 3,'2022-01-01'),
(1, 2,'2022-01-01'),
(1, 3,'2022-01-01'),
(1, 6,'2022-01-01'),
(3, 1,'2022-01-01'),
(3, 3,'2022-01-01');

INSERT INTO user (first_name, last_name, email, create_at)
VALUES ('David','May','dmay@gmail.com', '2022-01-03'),
('Theresa','Davis','tdavis@gmail.com', '2022-01-03'),
('Jerry','Martin','jermar@gmail.com', '2022-01-03'),
('John','Smith','smithy@gmail.com', '2022-01-03'),
('Martin','Watkins','mwatto@gmail.com', '2022-01-03'),
('Emma','Watson','itswingardiumleviosa@gmail.com', '2022-01-03'),
('Javier','Pastore','jp@gmail.com', '2022-01-03'),
('Charlotte','Hare','chare@gmail.com', '2022-01-03');

INSERT INTO review (rating, movie_id, user_id, create_at)
VALUES ('4.7', 1, 3, '2022-01-01'),
('2.8', 1, 4, '2022-02-01'),
('3.8', 2, 2, '2022-04-10'),
('1.7', 2, 3, '2022-02-01'),
('1.9', 2, 5, '2022-03-01'),
('4.1', 3, 2, '2022-05-01'),
('2.2', 3, 4, '2022-07-01'),
('4.1', 4, 1, '2022-11-01'),
('3.3', 5, 2, '2022-10-01');

INSERT INTO blog (title, description, user_id, create_at)
VALUES ('Introduction to Blogging','This is the first post on the blog.', 2, '2022-01-03'),
('Advanced Blogging Techniques','Learn some advanced tips for successful blogging.', 3, '2022-01-03');

INSERT INTO comment (description, user_id, blog_id, create_at)
VALUES ('Great first post!', 1, 2, '2022-01-03'),
('I found the advanced techniques very useful.', 2, 1, '2022-01-03');

INSERT INTO genre (name, last_update, create_at)
VALUES ('Action','2006-02-15 04:34:33','2022-01-01'),
('Comedy','2006-02-15 04:34:33','2022-01-01'),
('Drama','2006-02-15 04:34:33','2022-01-01'),
('Sci-Fi','2006-02-15 04:34:33','2022-01-01');

INSERT INTO movie_genre (movie_id, genre_id, create_at)
VALUES (1, 3,'2022-01-01'),
(2, 2,'2022-01-01'),
(3, 2,'2022-01-01');

INSERT INTO episode (name, movie_id, duration_minutes, create_at)
VALUES ('Explosive Beginnings', 1, 45,'2022-01-01'),
('The Joke Marathon', 2, 30,'2022-01-01'),
('Tears in the Rain', 3, 60,'2022-01-01'),
('Interstellar Journey', 4, 50,'2022-01-01');