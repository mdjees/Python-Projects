# D2C Skincare — Commercial & Customer Analytics Dashboard

## Overview
A four-page Power BI report analysing a D2C skincare business across commercial performance, customer acquisition, product performance and returns quality.

## Report pages
1. **Executive Overview** — revenue, average order value, total orders and return-rate KPI cards; revenue trend; sales-channel mix; order-status distribution.
2. **Customer Analytics** — average customer lifetime value, customer count by state, acquisition channel and geographic distribution.
3. **Product Performance** — revenue and gross-margin relationship by product, revenue by category and skin type.
4. **Returns Quality** — return rate by category, return reasons, and product-level relationship between average rating and return rate.

## What the screenshots demonstrate
- The report has a clear page-level analytical narrative rather than a single crowded canvas.
- Executive metrics and channel mix are easy to scan.
- Customer acquisition and geographic segmentation provide useful commercial context.
- Product and returns pages move beyond revenue into margin and quality indicators.

## Review observations and improvements
- **Chronological trend:** the Executive Overview revenue chart's YearMonth labels appear in a non-chronological order in the supplied screenshot. Use a true date/month-start column and sort the display label by that date.
- **Return-rate formatting:** the headline card displays `0.04`; format as a percentage (4%) if the measure is stored as a decimal ratio, and show the denominator/definition in a tooltip.
- **Return rate by category:** values above 100% appear in the supplied Returns Quality chart. Validate the DAX denominator and filter context; a conventional rate should have a clearly defined returned-unit/order numerator and eligible-unit/order denominator.
- **CLV definition:** document whether average CLV is historical revenue per customer, cumulative revenue, or a predictive lifetime value. The screenshot alone does not establish the calculation.
- **Gross margin:** verify the DAX measure uses (revenue minus cost) divided by revenue, not cost divided by revenue.
- **Geography:** confirm state names are categorised as Indian states and that the map uses appropriate geographic fields.
- **Accessibility:** add descriptive alt text, consistent number formats, and meaningful chart titles; avoid relying on colour alone.

## Files and reproducibility
The four screenshots were supplied for portfolio review. The PBIX file, source tables and DAX measures were not included in this upload, so the calculations and interactions have not been independently audited. Add the PBIX and a data dictionary when available.

## Portfolio positioning
This project demonstrates business-facing Power BI storytelling across revenue, customer acquisition, product economics and returns. The screenshots are evidence of report layout; the underlying measures should be validated before presenting the metrics as audited results.
