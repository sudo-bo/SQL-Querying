-- Comments in SQL Start with dash-dash --

-- Find the app with an ID of 1880:
SELECT * FROM analytics WHERE id = 1880;
-- Find the ID and app name for all apps last updated on August 01, 2018:
SELECT id, app FROM analytics WHERE last_updated = '2018-08-01';
-- Count the number of apps in each category:
SELECT category, COUNT(*) FROM analytics GROUP BY category;
-- Find the top 5 most-reviewed apps and the number of reviews for each:
SELECT app, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;
-- Find the app with the most reviews with a rating greater than or equal to 4.8:
SELECT app FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;
-- Find the average rating for each category, ordered from highest to lowest:
SELECT category, AVG(rating) AS average_rating FROM analytics GROUP BY category ORDER BY average_rating DESC;
-- Find the name, price, and rating of the most expensive app with a rating less than 3:
SELECT app, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;
-- Find all apps with a min install not exceeding 50, ordered by highest rating:
SELECT app FROM analytics WHERE min_installs <= 50 ORDER BY rating DESC;
-- Find names of all apps rated less than 3 with at least 10000 reviews:
SELECT app FROM analytics WHERE rating < 3 AND reviews >= 10000;
-- Find the top 10 most-reviewed apps that cost between 10 cents and a dollar:
SELECT app, reviews FROM analytics WHERE price BETWEEN 0.10 AND 1.00 ORDER BY reviews DESC LIMIT 10;
-- Find the most out-of-date app:
SELECT app FROM analytics ORDER BY last_updated ASC LIMIT 1;
-- Find the most expensive app:
SELECT app FROM analytics ORDER BY price DESC LIMIT 1;
-- Count all the reviews in the Google Play Store:
SELECT SUM(reviews) FROM analytics;
-- Find all categories with more than 300 apps:
SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;
-- Find the app with the highest proportion of min_installs to reviews (min_installs >= 100,000):
SELECT app, reviews, min_installs, (min_installs::FLOAT / reviews) AS proportion FROM analytics WHERE min_installs >= 100000 ORDER BY proportion DESC LIMIT 1;
