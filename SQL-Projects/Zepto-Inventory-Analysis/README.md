# Zepto Inventory & Pricing Analysis (PostgreSQL)

## Objective
Explore a product-level grocery dataset, assess data quality, compare listed discounts, and estimate the value and weight of available inventory by category.

## Tools
- PostgreSQL
- SQL (aggregations, filtering, grouping, CASE expressions, data-quality checks, UPDATE)

## Analysis workflow
1. Create a typed product/SKU table.
2. Inspect row counts, sample records, nulls, categories, stock status, and repeated product names.
3. Check for zero-price records.
4. Convert monetary fields from paise to rupees **only if that is the source unit**.
5. Answer business questions on discounts, stock-outs, price/discount combinations, and inventory composition.

## Key metric definition
The query multiplying `discountedSellingPrice` by `availableQuantity` estimates the **discounted value of currently available inventory**. It is not realised revenue: the dataset fields shown do not establish that those units were sold.

## Important data caveats
- Confirm the source dataset's currency unit before running the paise-to-rupee update. The update is intentionally separated and should only be run once.
- Repeated product names can represent multiple SKUs; they are not automatically duplicate records.
- `availableQuantity` and `quantity` should be checked against the dataset's data dictionary before treating them as interchangeable.
- This repository does not claim sales, customer, or transaction-level insights from product inventory snapshots.

## Run
1. Create a PostgreSQL database.
2. Load the source data into the `zepto` table using the column order and types in `zepto_analysis.sql`.
3. Review the source units.
4. Run the exploration and business-question sections in order.

## Files
- `zepto_analysis.sql` — table definition, data checks, cleaning step, and business queries.

## Data attribution
Add the original dataset publisher, source URL, access date, and applicable licence/usage terms here before redistributing the dataset or publishing derived data.
