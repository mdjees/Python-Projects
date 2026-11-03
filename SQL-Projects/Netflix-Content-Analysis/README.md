# Netflix Content Analysis (PostgreSQL)

## Project overview
A SQL portfolio project using the Netflix titles catalogue to explore content mix, release trends, countries, genres and ratings. The supplied CSV contains **8,807 rows and 12 columns**.

## Tools
- PostgreSQL
- SQL: aggregations, date parsing, regular expressions, lateral joins and string splitting

## Files
- [Analysis SQL](netflix_project.sql)
- Source dataset: `netflix_titles.csv` was supplied for this project but has not yet been committed to this repository. Confirm redistribution rights for the dataset source before publishing it publicly.

## Workflow
1. Profile catalogue size, content types, release years and missing values.
2. Analyse the movie/TV Show mix and most common release years.
3. Parse `date_added` and analyse additions by calendar year.
4. Create title-genre and title-country bridge tables.
5. Explore leading genres, production countries, movie duration and content ratings.
6. Inspect repeated titles without automatically deleting records.

## Data-quality notes
- The SQL uses PostgreSQL-specific syntax (`FILTER`, `TO_DATE`, `LATERAL`, `unnest`, regular expressions). It is not directly portable to MySQL.
- `date_added` is text; the query parses valid values after trimming whitespace. Inspect malformed values separately.
- Repeated titles may be legitimate. Investigate by `show_id` before deleting records.
- Bridge tables create one row per title-country or title-genre; use `COUNT(DISTINCT show_id)` to count titles.
- Results describe the supplied catalogue snapshot, not Netflix's current catalogue.

## Run
1. Create a PostgreSQL database.
2. Import the source CSV into a table named `netflix` with the 12 source columns.
3. Run `netflix_project.sql`. Review the script before execution; it creates derived tables and may overwrite existing objects with matching names.

## Portfolio note
This project demonstrates SQL data profiling and exploratory analysis. The source dataset was provided during portfolio preparation; the public repository currently contains the SQL analysis and documentation, not the CSV itself.
