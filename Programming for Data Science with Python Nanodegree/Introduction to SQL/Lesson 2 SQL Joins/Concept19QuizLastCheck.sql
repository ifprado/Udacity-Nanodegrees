-- 1. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name AS region_name, sr.name AS sales_rep_name, a.name AS acct_name
FROM sales_reps AS sr
JOIN region AS r
ON r.id = sr.region_id
AND r.name = 'Midwest'
JOIN accounts AS a
ON a.sales_rep_id = sr.id
ORDER BY a.name;


-- 2. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM orders AS o
LEFT JOIN accounts AS a
ON a.id = o.account_id
AND (o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01')

-- 3. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name AS r_name, sr.name AS sr_name, a.name AS a_name
FROM accounts AS a
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
JOIN region AS r
ON sr.region_id = r.id
WHERE sr.name LIKE ('% K%') AND r.name = 'Midwest'
ORDER BY a.name;


-- 4. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: region name, account name, and unit price. In order to avoid a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).
SELECT r.name AS r_name, a.name AS a_name, (o.total_amt_usd/(o.total+0.01)) AS unit_prc
FROM accounts AS a
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
JOIN region AS r
ON sr.region_id = r.id
JOIN orders AS o
ON o.account_id = a.id
WHERE standard_qty > 100;


-- 5. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
SELECT r.name AS r_name, a.name AS a_name, (o.total_amt_usd/(o.total+0.01)) AS unit_prc
FROM accounts AS a
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
JOIN region AS r
ON sr.region_id = r.id
JOIN orders AS o
ON o.account_id = a.id
WHERE standard_qty > 100
AND poster_qty > 50
ORDER BY unit_prc;


-- 6. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
SELECT r.name AS r_name, a.name AS a_name, (o.total_amt_usd/(o.total+0.01)) AS unit_prc
FROM accounts AS a
JOIN sales_reps AS sr
ON a.sales_rep_id = sr.id
JOIN region AS r
ON sr.region_id = r.id
JOIN orders AS o
ON o.account_id = a.id
WHERE standard_qty > 100
AND poster_qty > 50
ORDER BY unit_prc DESC;


-- 7. What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.
SELECT DISTINCT a.name, we.channel
FROM accounts AS a
JOIN web_events AS we
ON a.id = we.account_id
WHERE a.id = 1001;


-- 8. Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.
SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01';
