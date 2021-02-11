-- Comments in SQL Start with dash-dash --
-- #1 --
SELECT * FROM analytics WHERE ID = 1880;
-- #2 --
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';
-- #3 --
SELECT category, COUNT(*) FROM analytics GROUP BY category;
-- #4 --
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;
-- #5 --
SELECT app_name FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;
-- #6 --
SELECT category, AVG(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating;
-- #7 --
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;
-- #8 --
SELECT app_name, rating FROM analytics WHERE min_installs < 50 AND rating IS NOT NULL ORDER BY rating DESC;
-- #9 --
SELECT app_name, reviews, rating FROM analytics WHERE rating < 3 AND reviews > 10000;
-- #10 --
SELECT app_name, price, reviews FROM analytics WHERE price BETWEEN .1 and 1 ORDER BY reviews DESC LIMIT 10;
-- #11 --
SELECT app_name, last_updated FROM analytics ORDER BY last_updated LIMIT 1;
-- #12 --
SELECT app_name, price FROM analytics ORDER BY price DESC LIMIT 1;
-- #13 --
SELECT SUM(reviews) FROM analytics;
-- #14 --
SELECT category, COUNT(*) FROM analytics GROUP BY category HAVING COUNT(*) > 300;
-- #15 --
SELECT app_name, reviews, min_installs, min_installs/reviews AS proportion FROM analytics ORDER BY proportion DESC limit 1;

-- FS1 This is nuts... --
SELECT a.category, a.app_name, a.rating 
FROM analytics a 
INNER JOIN (
    SELECT category, MAX(rating) rating 
    FROM ANALYTICS 
    WHERE min_installs > 50000 
    GROUP BY category
) b ON a.category = b.category AND a.rating = b.rating
WHERE min_installs > 50000 
ORDER BY category;

-- FS2 --
SELECT app_name FROM analytics WHERE app_name ILIKE '%face%book%';
-- FS3 --
SELECT * FROM analytics WHERE array_length(genres, 1) > 1;
-- FS4 --
SELECT * FROM analytics WHERE 'Education' = ANY (genres);