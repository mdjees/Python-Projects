-- Netflix catalogue analysis | PostgreSQL
-- Source: Netflix titles catalogue (8,807 rows, 12 columns in supplied CSV)
-- Load CSV into public.netflix with the source column names before running.
-- This script is read-only except for CREATE TABLE statements below.

-- 1. Catalogue profile
SELECT COUNT(*) AS title_count,
       COUNT(*) FILTER (WHERE type = 'Movie') AS movies,
       COUNT(*) FILTER (WHERE type = 'TV Show') AS tv_shows,
       MIN(release_year) AS earliest_release_year,
       MAX(release_year) AS latest_release_year
FROM netflix;

-- 2. Missing values by important field
SELECT
  COUNT(*) FILTER (WHERE director IS NULL) AS missing_director,
  COUNT(*) FILTER (WHERE country IS NULL) AS missing_country,
  COUNT(*) FILTER (WHERE date_added IS NULL) AS missing_date_added,
  COUNT(*) FILTER (WHERE rating IS NULL) AS missing_rating,
  COUNT(*) FILTER (WHERE duration IS NULL) AS missing_duration
FROM netflix;

-- 3. Movie vs TV Show mix
SELECT type, COUNT(*) AS title_count,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS share_pct
FROM netflix
GROUP BY type
ORDER BY title_count DESC;

-- 4. Most common release years
SELECT release_year, COUNT(*) AS titles
FROM netflix
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY titles DESC
LIMIT 10;

-- 5. Additions to Netflix by calendar year (not release year)
SELECT EXTRACT(YEAR FROM TO_DATE(TRIM(date_added), 'Month DD, YYYY'))::int AS year_added,
       COUNT(*) AS titles_added
FROM netflix
WHERE date_added IS NOT NULL
  AND TRIM(date_added) ~ '^[A-Za-z]+ [0-9]{1,2}, [0-9]{4}$'
GROUP BY year_added
ORDER BY year_added;

-- 6. Genre bridge table: one row per title-genre
DROP TABLE IF EXISTS netflix_genre;
CREATE TABLE netflix_genre AS
SELECT n.show_id, TRIM(g.genre) AS genre
FROM netflix n
CROSS JOIN LATERAL unnest(string_to_array(n.listed_in, ',')) AS g(genre)
WHERE n.listed_in IS NOT NULL;

-- 7. Top genres
SELECT genre, COUNT(DISTINCT show_id) AS title_count
FROM netflix_genre
GROUP BY genre
ORDER BY title_count DESC
LIMIT 10;

-- 8. Country bridge table: one row per title-country
DROP TABLE IF EXISTS netflix_country;
CREATE TABLE netflix_country AS
SELECT n.show_id, TRIM(c.country) AS country
FROM netflix n
CROSS JOIN LATERAL unnest(string_to_array(n.country, ',')) AS c(country)
WHERE n.country IS NOT NULL;

-- 9. Top production countries
SELECT country, COUNT(DISTINCT show_id) AS title_count
FROM netflix_country
GROUP BY country
ORDER BY title_count DESC
LIMIT 10;

-- 10. Average movie duration in minutes
SELECT ROUND(AVG(SPLIT_PART(duration, ' ', 1)::numeric), 1) AS average_movie_minutes
FROM netflix
WHERE type = 'Movie'
  AND duration ~ '^[0-9]+ min$';

-- 11. Content rating distribution
SELECT rating, COUNT(*) AS title_count
FROM netflix
GROUP BY rating
ORDER BY title_count DESC;

-- 12. Inspect repeated titles; do not automatically delete them
SELECT title, COUNT(*) AS records,
       STRING_AGG(show_id, ', ' ORDER BY show_id) AS show_ids
FROM netflix
GROUP BY title
HAVING COUNT(*) > 1
ORDER BY records DESC, title;
