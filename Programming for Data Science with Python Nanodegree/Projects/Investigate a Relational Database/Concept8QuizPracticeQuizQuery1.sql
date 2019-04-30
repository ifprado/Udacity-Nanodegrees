--1. Let's start with creating a table that provides the following details: 
--actor's first and last name combined as full_name, film title, film description and length of the movie.

--How many rows are there in the table?
SELECT CONCAT(a.first_name, ' ', a.last_name) AS full_name, f.title, f.description, f.length
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
JOIN film f
ON fa.film_id = f.film_id;
