--1. For each account, determine the average amount of each type of paper they purchased across their orders. Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.
SELECT a.name, AVG(o.standard_qty) AS stnd, AVG(o.gloss_qty) AS gls, AVG(o.poster_qty) AS pst
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.name;


-- 2.For each account, determine the average amount spent per order on each paper type. Your result should have four columns - one for the account name and one for the average amount spent on each paper type.
SELECT a.name, AVG(o.standard_amt_usd) AS stnd_usd, AVG(o.gloss_amt_usd) AS gls_usd, AVG(o.poster_amt_usd) AS pst_usd
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.name;


--3. Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
SELECT sr.name, we.channel, COUNT(occurred_at) AS num_occurrences
FROM accounts AS a
JOIN web_events AS we
ON a.id = we.account_id
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
GROUP BY sr.name, we.channel
ORDER BY num_occurrences DESC;

--4. Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns - the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
SELECT r.name, we.channel, COUNT(we.occurred_at) AS num_of_occurences
FROM web_events AS we
JOIN accounts
ON we.account_id = accounts.id
JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id
JOIN region AS r
ON sales_reps.region_id = r.id
GROUP BY r.name, we.channel
ORDER BY num_of_occurences DESC;
