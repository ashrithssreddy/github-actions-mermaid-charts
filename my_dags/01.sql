-- Inputs:
--   ecommerce.orders
--   ecommerce.order_sources
-- Outputs:
--   ecommerce.recent_orders
-- Extract orders placed in the last 24 hours (dummy)
-- Output feeds into 02.sql via the ecommerce.recent_orders table.
DELETE FROM ecommerce.recent_orders;
INSERT INTO ecommerce.recent_orders
SELECT
  o.order_id,
  o.customer_id,
  o.order_total,
  o.created_at,
  s.source_channel
FROM ecommerce.orders AS o
LEFT JOIN ecommerce.order_sources AS s
  ON o.order_id = s.order_id
WHERE o.created_at >= CURRENT_DATE - INTERVAL '1 day';

