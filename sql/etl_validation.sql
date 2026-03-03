-- 1. Riconciliazione totale revenue (source vs transformed)
SELECT 
    ROUND(SUM(amount), 2) AS source_total_revenue,
    (SELECT ROUND(SUM("Somma di amount"), 2) FROM transformed_orders) AS transformed_total_revenue
FROM source_orders;

-- 2. Clienti senza ordini dopo ETL
SELECT c.customer_id, c.name
FROM source_customers c
LEFT JOIN transformed_orders t ON c.customer_id = t.customer_id
WHERE t.order_id IS NULL;

-- 3. Ordini duplicati in transformed_orders
SELECT order_id, COUNT(*) AS occurrences
FROM transformed_orders
GROUP BY order_id 
HAVING COUNT(*) > 1;

-- 4. Ordini High Value (> 1000) in transformed_orders
SELECT 
    order_id, 
    customer_id, 
    "Somma di amount" AS amount, 
    Anno || '-' || Mese || '-' || Giorno AS reconstructed_date, 
    product, 
    "Order_category"
FROM transformed_orders 
WHERE "Somma di amount" > 1000;

-- 5. Revenue per categoria ordine (anomalie < 100)
SELECT 
    "Order_category",
    ROUND(SUM("Somma di amount"), 2) AS category_revenue
FROM transformed_orders
GROUP BY "Order_category"
HAVING category_revenue < 100;