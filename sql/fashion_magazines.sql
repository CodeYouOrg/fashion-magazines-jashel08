--SELECT orders.order_status
--FROM orders
--WHERE order_status = 'unpaid';


--SELECT customers.customer_name
--FROM orders
--JOIN customers ON orders.customer_id = customers.customer_id;


--SELECT subscriptions.subscription_length, subscriptions.price_per_month
--FROM orders
--JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
--WHERE subscriptions.description = 'Fashion Magazine';


SELECT customers.customer_name AS Customer,
    printf('$%.2f', SUM(subscriptions.price_per_month * subscriptions.subscription_length)) AS 'Amount Due'
FROM orders
JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
JOIN customers ON orders.customer_id = customers.customer_id
WHERE order_status = 'unpaid' and subscriptions.description = 'Fashion Magazine'
GROUP BY customer_name;

