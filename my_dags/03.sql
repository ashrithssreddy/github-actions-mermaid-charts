-- Inputs:
--   ecommerce.orders_with_customers
--   ecommerce.loyalty_tier_targets
-- Outputs:
--   ecommerce.daily_revenue_by_tier
-- Load: aggregate daily revenue by loyalty tier (dummy)
INSERT INTO ecommerce.daily_revenue_by_tier
SELECT
  DATE(o.created_at) AS order_date,
  o.loyalty_tier,
  COUNT(*) AS order_count,
  SUM(o.order_total) AS revenue,
  MAX(t.target_daily_revenue) AS target_daily_revenue
FROM ecommerce.orders_with_customers AS o
LEFT JOIN ecommerce.loyalty_tier_targets AS t
  ON o.loyalty_tier = t.loyalty_tier
GROUP BY DATE(o.created_at), o.loyalty_tier;

