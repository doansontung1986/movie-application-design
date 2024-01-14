SELECT * FROM movie;
SELECT * FROM director;
SELECT * FROM actor;
SELECT * FROM review;
SELECT * FROM user;
SELECT * FROM blog;
SELECT * FROM comment;
SELECT * FROM genre;
SELECT * FROM director;
SELECT * FROM episode;

SELECT *
FROM movie
INNER JOIN movie_director
ON movie.id = movie_director.movie_id
INNER JOIN director
ON director.id = movie_director.director_id
INNER JOIN movie_actor
ON movie.id = movie_actor.movie_id
INNER JOIN actor
ON actor.id = movie_actor.actor_id;