-- 1. How many rows are in the data_analyst_jobs table?
-- SELECT COUNT(*)
-- FROM data_analyst_jobs;
-- Answer: 1,793 rows

-- 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-- SELECT company
-- FROM data_analyst_jobs
-- LIMIT 10;
-- Answer: ExxonMobil

-- 3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
-- SELECT COUNT(location)
-- FROM data_analyst_jobs
-- WHERE location = 'TN';

-- SELECT COUNT(location)
-- FROM data_analyst_jobs
-- WHERE location IN ('KY', 'TN');
-- Answer: 21 postings are in Tennessee but there are a combined 27 in Kentucky and Tennessee together.

-- 4. How many postings in Tennessee have a star rating above 4?
-- SELECT COUNT (star_rating)
-- FROM data_analyst_jobs
-- WHERE location = 'TN'
-- AND star_rating >4;
-- Answer: 3

-- 5. How many postings in the dataset have a review count between 500 and 1000?
-- SELECT COUNT(review_count)
-- FROM data_analyst_jobs
-- WHERE review_count BETWEEN 500 AND 1000;
-- Answer: 151

-- 6. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
-- SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating
-- FROM data_analyst_jobs
-- GROUP BY state
-- ORDER by avg_rating DESC;
-- Answer: NE with an average star rating of 4.2

-- 7. Select unique job titles from the data_analyst_jobs table. How many are there?
-- SELECT COUNT(DISTINCT(title))
-- FROM data_analyst_jobs
-- WHERE title IS NOT NULL;
-- Answer: 881 unique job titles

-- 8. How many unique job titles are there for California companies?
-- SELECT COUNT(DISTINCT(title))
-- FROM data_analyst_jobs
-- WHERE location = 'CA';
-- Answer: 230 jobs for California companies have unique titles

-- 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
--  SELECT company, COUNT(company), AVG(star_rating) AS avg_rating
--  FROM data_analyst_jobs
--  WHERE review_count > 5000
--  	AND company IS NOT NULL
--  GROUP BY company
--  ORDER BY avg_rating;
-- Answer: 40 companies have more than 5000 reviews across all locations
 
-- 10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
-- SELECT company, COUNT(company), ROUND(AVG(star_rating),2) AS avg_rating
-- FROM data_analyst_jobs
-- WHERE review_count > 5000
-- 	AND company IS NOT NULL
-- GROUP by company
-- ORDER by avg_rating DESC;
-- Answer: 6 companies are tied for the highest rating. They are Unilever, General Motors, Nike, American Express, Microsoft, and Kaiser Permanente. The average rating for these companies is 4.20

-- 11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
-- SELECT COUNT(DISTINCT title)
-- FROM data_analyst_jobs
-- WHERE title iLIKE '%Analyst%';
-- Answer: There are 774 job titles that contain the word 'Analyst'. This comprises spellings that include variations on the use of capital letters.

-- 12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
-- SELECT COUNT(DISTINCT title)
-- FROM data_analyst_jobs
-- WHERE title NOT iLIKE '%Analy%';
-- SELECT title
-- FROM data_analyst_jobs
-- WHERE title NOT iLIKE '%Analy%';
-- Answer: There are 4 job titles that do not contain either the word 'Analyst' or the word 'Analytics'. All four of the job titles that do not contain 'Analyst' or 'Analytics' contain the word 'Tableau'.

-- BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
-- Disregard any postings where the domain is NULL.
-- SELECT COUNT(title)
-- FROM data_analyst_jobs
-- WHERE skill iLIKE '%SQL%'
-- AND days_since_posting > 21
-- AND domain IS NOT NULL;
-- Answer A: 403 jobs have been posted that require SQL as a skill and have been posted for longer than 3 weeks.

-- SELECT COUNT(title), domain
-- FROM data_analyst_jobs
-- WHERE days_since_posting > 21
-- AND skill iLIKE '%SQL%'
-- AND domain IS NOT NULL
-- GROUP BY domain
-- ORDER BY COUNT(title) DESC;
-- Answer B: The top 4 industries with hard to fill jobs are Internet and Software, Banks and Financial Services, Consulting and Business Services, and Health Care. They have the following counts of hard to fill postings that require SQL:
--- Internet and Software - 62
--- Banks and Financial Services - 61
--- Consulting and Business Services - 57
--- Health Care - 52