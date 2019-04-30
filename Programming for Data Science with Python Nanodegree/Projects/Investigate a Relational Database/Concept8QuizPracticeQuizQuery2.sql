--2. Write a query that creates a list of actors and movies
--   where the movie length was more than 60 minutes. 

--   How many rows are there in this query result?
SELECT CONCAT(a.first_name, ' ', a.last_name) AS full_name, f.title, f.description, f.length
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
JOIN film f
ON fa.film_id = f.film_id
WHERE f.length > 60;
