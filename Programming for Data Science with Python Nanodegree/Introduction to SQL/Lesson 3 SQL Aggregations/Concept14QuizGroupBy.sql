--1. Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
SELECT a.name, MIN(o.occurred_at) AS earliest_date
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY MIN(o.occurred_at)
LIMIT 1;


--2. Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.
SELECT a.name, SUM(o.total_amt_usd)
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.name;


--3. Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.
SELECT we.occurred_at, we.channel, a.name,
FROM web_events AS we
JOIN accounts AS a
ON we.account_id = a.id
ORDER BY we.occurred_at DESC
LIMIT 1;


--4. Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.
SELECT channel, COUNT(channel)
FROM web_events
GROUP BY channel;


--5. Who was the primary contact associated with the earliest web_event?
SELECT a.primary_poc, we.occurred_at
FROM accounts AS a
JOIN web_events AS we
ON a.id = we.account_id
ORDER BY we.occurred_at DESC
LIMIT 1;


--6. What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.
SELECT a.name, MIN(o.total_amt_usd)
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.name;



--7. Find the number of sales reps in each region. Your final table should have two columns - the region and the number of sales_reps. Order from fewest reps to most reps.
SELECT r.name, COUNT(sr.id)
FROM region AS r
JOIN sales_reps AS sr
ON r.id = sr.region_id
GROUP BY r.name
ORDER BY COUNT(sr.id) DESC;
