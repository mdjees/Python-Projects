# Netflix Content Analysis (PostgreSQL)

## Project overview
A SQL portfolio project using the Netflix titles catalogue to explore content mix, release trends, countries, genres, directors and cast. The supplied CSV contains **8,807 rows and 12 columns**.

## Tools
- PostgreSQL
- SQL (CTEs, window functions, string splitting, date parsing, aggregation)

## Workflow represented in the SQL script
1. Create the `netflix` staging table and profile the catalogue.
2. Inspect missing values and duplicate titles.
3. Standardise selected missing text fields and parse `date_added`.
4. Split multi-value country, genre and cast fields into bridge tables.
5. Query content mix, countries, release trends, genres, directors and actors.
6. Demonstrate a keyword-based description classification.

## Important interpretation and data-quality notes
- The script uses PostgreSQL-specific syntax such as `ILIKE`, regular-expression operators, `TO_DATE`, `LATERAL`, `unnest` and `string_to_array`. It is not directly portable to MySQL.
- The source `date_added` field is text; `date_added_clean` is the parsed date. Keep the raw field for traceability.
- Backfilling a missing country from a director's most frequent country is a heuristic, not verified ground truth. For a defensible analysis, preserve the original value and mark imputed records separately; do not present inferred countries as confirmed facts.
- A title can legitimately appear more than once (for example, different catalogue entries). Investigate duplicates by `show_id` and title before removing anything.
- The query labelled “Year with most content added” groups by `release_year`, not the year the title was added to Netflix. The label should be changed to “Release year with the most titles” or the query should group by `EXTRACT(YEAR FROM date_added_clean)`.
- The “violent vs non-violent” output is only a keyword flag based on descriptions. It is not a validated content-rating or safety classification.
- The script currently checks whitespace but does not apply a final trim update to all relevant columns.
- The raw dataset is not copied into this repository. Add it only if its source licence and redistribution terms permit it.

## Run
1. Create a PostgreSQL database.
2. Import the supplied catalogue CSV into a table named `netflix` with the columns in the script's CREATE TABLE statement.
3. Run `netflix_project.sql` in order. The script includes updates and creates helper tables, so use a disposable database or take a backup first.

## Portfolio note
This is a learning project demonstrating SQL-based data preparation and exploratory analysis. The results describe the supplied catalogue snapshot, not Netflix's current catalogue.
