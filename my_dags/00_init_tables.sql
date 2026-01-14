-- Tables updated by 01_extract_recent_orders.sql, 02_join_orders_customers.sql, 03_aggregate_revenue_by_tier.sql
CREATE TABLE IF NOT EXISTS ecommerce.recent_orders (
  order_id BIGINT,
  customer_id BIGINT,
  order_total NUMERIC(12, 2),
  created_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ecommerce.orders_with_customers (
  order_id BIGINT,
  customer_id BIGINT,
  email VARCHAR(255),
  loyalty_tier VARCHAR(50),
  order_total NUMERIC(12, 2),
  created_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ecommerce.daily_revenue_by_tier (
  order_date DATE,
  loyalty_tier VARCHAR(50),
  order_count BIGINT,
  revenue NUMERIC(12, 2)
);

