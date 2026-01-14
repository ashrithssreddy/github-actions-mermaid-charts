-- Inputs:
--   ecommerce.recent_orders
--   ecommerce.customers
-- Outputs:
--   ecommerce.orders_with_customers
-- Transform: join orders with customers (dummy)
-- Output feeds into 03.sql via the ecommerce.orders_with_customers table.
DELETE FROM ecommerce.orders_with_customers;
INSERT INTO ecommerce.orders_with_customers
SELECT
  o.order_id,
  o.customer_id,
  c.email,
  c.loyalty_tier,
  o.order_total,
  o.created_at
FROM ecommerce.recent_orders AS o
JOIN ecommerce.customers AS c
  ON o.customer_id = c.customer_id;

