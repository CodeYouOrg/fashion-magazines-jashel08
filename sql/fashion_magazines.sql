-- Add your sql here
SELECT c.customer_name as Customer, PRINTF('$%.2f',SUM((s.price_per_month * subscription_length))) as 'Amount Due'
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN subscriptions s ON o.subscription_id = s.subscription_id
WHERE o.order_status = 'unpaid'
AND s.subscription_id IN (4,5,6)
GROUP BY c.customer_name