WITH stg_orders AS (
  SELECT
    *
  FROM {{ ref('core_platform2', 'stg_orders') }}
), stg_customers AS (
  SELECT
    *
  FROM {{ ref('core_platform2', 'stg_customers') }}
), stg_locations AS (
  SELECT
    *
  FROM {{ ref('core_platform2', 'stg_locations') }}
), join_1 AS (
  SELECT
    *
  FROM stg_orders
  JOIN stg_customers
    ON stg_orders.CUSTOMER_ID = stg_customers.CUSTOMER_ID
), join_2 AS (
  SELECT
    *
  FROM join_1
  JOIN stg_locations
    ON join_1.LOCATION_ID = stg_locations.LOCATION_ID
), sales_sql AS (
  SELECT
    *
  FROM join_2
)
SELECT
  *
FROM sales_sql