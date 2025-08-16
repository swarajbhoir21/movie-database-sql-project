-- ============================================
-- SCHEMA 2 : Analytical Queries on Movies Data
-- ============================================

-- 1. View all movies
SELECT * FROM movies;

-- 2. Top 5 movies by IMDb rating
SELECT title, rating, industry
FROM movies
ORDER BY rating DESC
FETCH FIRST 5 ROWS ONLY;

-- 3. Top 5 highest grossing movies
SELECT title, revenue, budget, (revenue - budget) AS profit, industry
FROM movies
ORDER BY revenue DESC
FETCH FIRST 5 ROWS ONLY;

-- 4. Average IMDb rating by Industry
SELECT industry, ROUND(AVG(rating),2) AS avg_rating
FROM movies
GROUP BY industry;

-- 5. Average Metascore by Industry
SELECT industry, ROUND(AVG(metascore),2) AS avg_metascore
FROM movies
GROUP BY industry;

-- 6. Most profitable movie (highest revenue - budget)
SELECT title, industry, (revenue - budget) AS profit
FROM movies
ORDER BY profit DESC
FETCH FIRST 1 ROW ONLY;

-- 7. Audience vs Critic Gap (IMDb vs Metascore/10)
SELECT title, industry,
       rating AS imdb_rating,
       (metascore/10) AS critic_rating,
       (rating - (metascore/10)) AS gap
FROM movies
ORDER BY ABS(rating - (metascore/10)) DESC;

-- 8. Popularity by Votes (Top 5 movies with most IMDb votes)
SELECT title, votes, industry
FROM movies
ORDER BY votes DESC
FETCH FIRST 5 ROWS ONLY;

-- 9. Industry-wise total revenue
SELECT industry, SUM(revenue) AS total_revenue
FROM movies
GROUP BY industry
ORDER BY total_revenue DESC;

-- 10. Movies released after 2015 with rating > 8
SELECT title, release_year, rating, industry
FROM movies
WHERE release_year > 2015
  AND rating > 8
ORDER BY rating DESC;

-- 11. Director with most movies in the database
SELECT director, COUNT(*) AS movie_count
FROM movies
GROUP BY director
ORDER BY movie_count DESC
FETCH FIRST 1 ROW ONLY;

-- 12. Longest movies (Top 3 by duration)
SELECT title, duration, industry
FROM movies
ORDER BY duration DESC
FETCH FIRST 3 ROWS ONLY;

-- 13. Compare Hollywood vs Bollywood Avg Profitability
SELECT industry,
       ROUND(AVG(revenue - budget),2) AS avg_profit
FROM movies
GROUP BY industry;

-- 14. Top Bollywood movies by rating
SELECT title, rating, revenue
FROM movies
WHERE industry = 'Bollywood'
ORDER BY rating DESC
FETCH FIRST 5 ROWS ONLY;

-- 15. Top Hollywood movies by rating
SELECT title, rating, revenue
FROM movies
WHERE industry = 'Hollywood'
ORDER BY rating DESC
FETCH FIRST 5 ROWS ONLY;
