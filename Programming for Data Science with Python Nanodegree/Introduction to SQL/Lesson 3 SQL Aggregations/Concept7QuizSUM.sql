--1. Find the total amount of poster_qty paper ordered in the orders table.
SELECT SUM(poster_qty) as poster_qty_sum
FROM orders


--2. Find the total amount of standard_qty paper ordered in the orders table.
SELECT SUM(standard_qty) as standard_qty_sum
FROM orders


--3. Find the total dollar amount of sales using the total_amt_usd in the orders table.
SELECT SUM(total_amt_usd) AS total_amt_usd_sum
FROM orders


--4. Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. This should give a dollar amount for each order in the table.
SELECT SUM(standard_amt_usd) + SUM(gloss_amt_usd) AS  standard_and_gloss_amt_usd_sum
FROM orders


--5. Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an aggregation and a mathematical operator.
SELECT SUM(standard_amt_usd) / COUNT(standard_qty) AS avg_standard_amt_usd_per_standard_qty
FROM orders



--SOLUITONS FOR 4 AND 5
/*

SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;



SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;


*/
