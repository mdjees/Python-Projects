# E-commerce Revenue, Customer & Product Analytics

## Project overview
A MySQL-oriented analytics exercise built around orders, order items, customers, products, payments and deliveries. The SQL file contains 14 analytical queries; the accompanying Excel workbook contains result tables, KPI summaries and a dashboard sheet.

## Tools
- MySQL
- SQL (CTEs, joins, window functions, conditional aggregation)
- Microsoft Excel

## Workbook snapshot
The supplied workbook reports:
- Total revenue: **253,800**
- Total orders: **12**
- Average order value: **23,072.73**
- Total customers: **8**
- Average delivery time: **5 days**
- Product return percentage: **16.67%**
- Order cancellation percentage: **8.33%**

These are workbook outputs from the supplied sample, not independently re-computed results from the source tables. Treat them as illustrative until the source dataset and calculations are reconciled.

## Review notes before relying on the metrics
1. **Monthly revenue:** the query groups by month number only. If the dataset spans multiple years, group by year and month (or a year-month date key) to avoid combining January across different years.
2. **Repeat customer rate:** the current query divides each customer's order count by total orders and filters to customers with more than one order. That is not the repeat-customer rate. A clearer KPI is customers with at least two orders divided by all distinct customers.
3. **CLV:** the window query adds order-item sales by customer and order date. If multiple orders share a date, add a stable order-level tie-breaker and aggregate each order before applying the running total.
4. **Product profit:** the query uses `products.price - products.cost` multiplied by units. If actual transaction selling prices differ from list price, use the realised selling price and clearly define whether the result is gross product contribution or net profit.
5. **Return rate:** the query counts returned product rows against all product rows. State whether the intended measure is returned units / sold units, returned orders / delivered orders, or returned line items / all line items.
6. **Division:** MySQL may perform integer division depending on operand types. Cast to a decimal or multiply by 100.0 for percentage calculations.
7. **Revenue contribution:** use a consistent denominator and guard against zero revenue. Check whether products with no sales should remain in the output.
8. **Business growth/seasonality:** the first query returns sales per order alongside payment date; it is not yet an aggregated seasonality analysis.

## Suggested next improvements
- Add a data dictionary and schema diagram.
- Include the original sample tables or a reproducible schema + seed data, subject to data rights.
- Add validation queries reconciling revenue, orders, returns and cancellations.
- Add a year-month trend and a correctly defined repeat-customer KPI.
- Add a short insight narrative explaining what management should do with the findings.

## Files
- `ecommerce_analytics.sql`: the 14-query analysis script.
- `Ecommerce_Analytics_Results.xlsx`: workbook output and dashboard (not yet committed).
