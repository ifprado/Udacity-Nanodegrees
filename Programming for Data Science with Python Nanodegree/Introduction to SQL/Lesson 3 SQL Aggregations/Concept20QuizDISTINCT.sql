--1. Use DISTINCT to test if there are any accounts associated with more than one region.
SELECT DISTINCT a.name AS account_name, r.name AS region_name
FROM accounts AS a
JOIN sales_reps
ON a.sales_rep_id = sales_reps.id
JOIN region AS r
ON sales_reps.region_id = r.id;


--2. Have any sales reps worked on more than one account?
SELECT DISTINCT a.name AS account_name, sr.name AS sales_rep_name
FROM accounts AS a
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id;

--SELECT DISTINCT id, name
--FROM sales_reps;
