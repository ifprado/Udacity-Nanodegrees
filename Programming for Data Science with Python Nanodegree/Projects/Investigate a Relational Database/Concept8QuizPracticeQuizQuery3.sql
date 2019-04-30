--3. Write a query that captures the 
--   actor id, full name of the actor, and counts the number of movies each actor has made. 
--   (HINT: Think about whether you should group by actor id or the full name of the actor.) 

--   Identify the actor who has made the maximum number movies.
SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS full_name, COUNT(f.title)
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
JOIN film f
ON fa.film_id = f.film_id
GROUP BY a.actor_id
ORDER BY COUNT(f.title) DESC;
