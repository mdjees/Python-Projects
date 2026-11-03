# Python, SQL, Power BI & Research Projects

A collection of practical projects across SQL analytics, Python, business intelligence and applied research. The emphasis is on business questions, transparent metric definitions and honest documentation of data limitations.

## SQL projects

### [Zepto Inventory & Pricing Analysis](SQL-Projects/Zepto-Inventory-Analysis/README.md)
PostgreSQL exploration of product data quality, stock availability, discounts, pricing and inventory composition. The inventory-value calculation is an estimate of available inventory value, not realised sales revenue.

### [E-commerce Revenue, Customer & Product Analytics](SQL-Projects/Ecommerce-Analytics/README.md)
Fourteen MySQL analyses covering revenue, product contribution, customer repeat rate, historical customer revenue, returns, delivery and cancellations. Includes a review of KPI definitions and join risks.

### [Netflix Content Analysis](SQL-Projects/Netflix-Content-Analysis/README.md)
PostgreSQL catalogue profiling and analysis of content mix, release trends, genres, production countries, movie duration and content ratings.

## Power BI

### [D2C Skincare Analytics Dashboard](PowerBI-Projects/D2C-Skincare-Analytics/README.md)
Four-page report covering executive performance, customer analytics, product performance and returns quality. The README records screenshot-based observations and items that still require PBIX/DAX validation.

## Research

### [Interest Rates & European House Prices](Research-Projects/Interest-Rates-and-European-House-Prices/README.md)
MBA research project on 26 European countries (2009–2024), using panel-data methods and exploring country heterogeneity and monetary-policy regimes.

## Python notebooks

### Super Bowl Analysis
**File:** [superbowl.ipynb](superbowl.ipynb)

A notebook exploring Super Bowl-related data. Review the notebook for its exact dataset, methods and findings.

### Simple Calculator
**File:** [Simple_Calculator.ipynb](Simple_Calculator.ipynb)

A beginner project demonstrating basic calculator operations and Python programming fundamentals.

## How to use

Clone the repository and open notebooks in Jupyter Notebook, JupyterLab or Google Colab. Run SQL scripts in the database engine specified in each project's README after loading the relevant source data.

```bash
git clone https://github.com/mdjees/Python-Projects.git
cd Python-Projects
```

## Tools
Python, Jupyter, PostgreSQL, MySQL, Power BI, Excel, SQL and applied econometrics.

## Data and reproducibility
Each project should identify its dataset source, data dictionary, licence and transformations required to reproduce the analysis. Where source data, PBIX files or statistical scripts are not included, the README states that limitation; treat findings as exploratory rather than independently verified.
