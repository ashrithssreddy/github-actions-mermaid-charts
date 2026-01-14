-- Load: aggregate daily revenue by loyalty tier (dummy)
INSERT INTO ecommerce.daily_revenue_by_tier
SELECT
  DATE(o.created_at) AS order_date,
  o.loyalty_tier,
  COUNT(*) AS order_count,
  SUM(o.order_total) AS revenue
FROM ecommerce.orders_with_customers AS o
GROUP BY DATE(o.created_at), o.loyalty_tier;

