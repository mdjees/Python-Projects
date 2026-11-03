# E-commerce Revenue, Customer & Product Analytics

## Project overview
A MySQL 8+ analytics exercise covering orders, order items, customers, products, payments and deliveries. The project contains 14 SQL analyses and an accompanying Excel workbook with result tables, KPI summaries and a dashboard sheet.

## Tools
- MySQL 8+
- SQL: CTEs, joins, window functions and conditional aggregation
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

These are workbook outputs from the supplied sample, not independently re-computed from the underlying source tables. Treat them as illustrative until the source dataset and calculations are reconciled.

## Query coverage
1. Revenue by year-month
2. Product gross contribution using realised selling price less unit cost
3. Total revenue
4. Monthly revenue trend
5. Total distinct orders
6. Average order value
7. Product revenue contribution
8. Total customers
9. Repeat-customer rate
10. Historical customer revenue (CLV proxy)
11. Top five products by revenue
12. Orders with returns
13. Average delivery time
14. Order cancellation rate

## Review notes
- **Repeat customer rate:** customers with at least two orders divided by all customers who placed an order. This differs from the share of total orders contributed by repeat customers.
- **CLV:** the query calculates historical customer revenue. It is not a predictive lifetime-value model.
- **Returns:** the example metric counts orders with a return flag. Confirm whether the business needs returned units / sold units, returned orders / delivered orders, or returned line items / all line items.
- **Profit:** gross contribution uses realised selling price less unit cost. It excludes operating expenses, fulfilment, payment fees and marketing spend, so it is not net profit.
- **Seasonality:** group by year-month, not month number alone, if the source spans more than one year.
- **Validation:** reconcile totals across order items, orders, payments and deliveries; inspect duplicate payment/delivery records before joins to avoid multiplying revenue.

## Files
- `ecommerce_analytics.sql`: reviewed 14-query MySQL script.
- `Ecommerce_Analytics_Results.xlsx`: source workbook was supplied for review but is not yet included in this repository.

## Next improvements
Add a data dictionary, schema diagram, reproducible sample data (subject to data rights), validation queries and a concise management-insights section.
