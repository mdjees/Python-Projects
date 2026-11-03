# D2C Skincare — Commercial & Customer Analytics Dashboard

## Overview
A four-page Power BI report analysing a D2C skincare business across commercial performance, customer acquisition, product performance and returns quality.

## Report pages
1. **Executive Overview** — revenue, average order value, total orders and return-rate KPI cards; revenue trend; sales-channel mix; order-status distribution.
2. **Customer Analytics** — average customer lifetime value, customer count by state, acquisition channel and geographic distribution.
3. **Product Performance** — revenue and gross-margin relationship by product, revenue by category and skin type.
4. **Returns Quality** — return rate by category, return reasons, and product-level relationship between average rating and return rate.

## Supplied visual evidence
Four screenshots of the report were supplied:
- Executive Overview
- Customer Analytics
- Product Performance
- Returns Quality

The Power BI project file `d2c_final.pbix` was also supplied for portfolio preparation. Neither the PBIX nor the screenshots have yet been committed to this repository.

## Screenshot-based review observations
- The report has a clear page-level analytical narrative rather than a single crowded canvas.
- Executive metrics and channel mix are easy to scan.
- Customer acquisition and geographic segmentation provide useful commercial context.
- Product and returns pages move beyond revenue into margin and quality indicators.
- The Executive Overview revenue chart's YearMonth labels appear in a non-chronological order. Use a true date/month-start column and sort the display label by that date.
- The headline Return Rate card displays `0.04`; format as 4% if the measure is stored as a decimal ratio, and show the numerator/denominator definition in a tooltip.
- Return-rate-by-category values above 100% require validation of the DAX denominator and filter context.
- Document whether Average CLV is historical revenue per customer, cumulative revenue, or predictive lifetime value.
- Verify gross margin uses (revenue minus cost) divided by revenue.
- Confirm state fields are categorised as Indian states and that the map uses appropriate geographic fields.

## Reproducibility and limitations
The screenshots establish report layout, not the correctness of the underlying calculations. The PBIX, source tables and DAX measures need to be reviewed together before the metrics can be treated as independently validated.

## Portfolio positioning
This project demonstrates business-facing Power BI storytelling across revenue, customer acquisition, product economics and returns. The next repository release should include the PBIX (if data rights permit), compressed preview images and a data dictionary.
