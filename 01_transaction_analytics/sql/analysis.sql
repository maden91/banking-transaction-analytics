-- Run against data/banking_analytics.db using SQLite
-- KPI 1: Completed transaction volume and value
SELECT COUNT(*) AS completed_count, ROUND(SUM(amount_usd),2) AS completed_value
FROM transactions WHERE status = 'Completed';

-- KPI 2: Completed spend by category
SELECT category, COUNT(*) AS transactions, ROUND(SUM(amount_usd),2) AS spend
FROM transactions WHERE status='Completed'
GROUP BY category ORDER BY spend DESC;

-- KPI 3: Monthly completed spend
SELECT SUBSTR(transaction_date,1,7) AS month, ROUND(SUM(amount_usd),2) AS spend
FROM transactions WHERE status='Completed'
GROUP BY month ORDER BY month;

-- KPI 4: Status distribution
SELECT status, COUNT(*) AS transactions, ROUND(100.0*COUNT(*)/(SELECT COUNT(*) FROM transactions),2) AS pct
FROM transactions GROUP BY status ORDER BY transactions DESC;

-- KPI 5: Review flag rate by channel (synthetic heuristic, not proven fraud)
SELECT channel, COUNT(*) AS transactions, SUM(review_flag) AS flagged,
ROUND(100.0*SUM(review_flag)/COUNT(*),2) AS flagged_pct
FROM transactions GROUP BY channel ORDER BY flagged_pct DESC;

-- KPI 6: Top customers by completed spend
SELECT customer_id, ROUND(SUM(amount_usd),2) AS completed_spend
FROM transactions WHERE status='Completed'
GROUP BY customer_id ORDER BY completed_spend DESC LIMIT 10;
