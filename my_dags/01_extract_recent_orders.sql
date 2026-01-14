-- Inputs:
--   ecommerce.orders
-- Outputs:
--   ecommerce.recent_orders
-- Extract orders placed in the last 24 hours (dummy)
-- Output feeds into 02_join_orders_customers.sql via the ecommerce.recent_orders table.
DELETE FROM ecommerce.recent_orders;
INSERT INTO ecommerce.recent_orders
SELECT
  o.order_id,
  o.customer_id,
  o.order_total,
  o.created_at
FROM ecommerce.orders AS o
WHERE o.created_at >= CURRENT_DATE - INTERVAL '1 day';

