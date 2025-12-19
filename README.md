# Mini Store Analytics (SQL)

A small SQL project that models a basic store (customers, products, orders, order_items) and answers business questions with JOINs + GROUP BY.

## Skills used
- Database design (keys, constraints)
- JOINs (INNER, LEFT)
- Aggregations (SUM, COUNT, AVG)
- GROUP BY + HAVING
- CTEs (WITH)

## How to run (PostgreSQL)
1. Create a database (example: `mini_store`)
2. Run:
   - `schema.sql`
   - `seed.sql`
   - `queries.sql`

## Example questions answered
- Total revenue (paid only)
- Revenue by month
- Top customers by spend
- Best-selling products
- Customers with no orders
- Average order value (AOV)
