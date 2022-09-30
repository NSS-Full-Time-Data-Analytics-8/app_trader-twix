SELECT count (*)
FROM data_analyst_job;

Question 2
Select *
From data_analyst_job
limit 10;

Question 3
Select count (company)
From data_analyst_job
WHERE location ='TN';
Question 3B
SELECT COUNT(company)
FROM data_analyst_job
WHERE location ='TN' or location ='KY'

Question 4
SELECT COUNT(company)
FROM data_analyst_job
WHERE location ='TN'
and star_rating>4

Question 5 
SELECT COUNT (company)
FROM data_analyst_job
WHERE review_count BETWEEN 500 and 1000;

Question 6

SELECT AVG(star_rating) AS avg_rating, location AS state
FROM data_analyst_job
WHERE star_rating is not null
Group by location
Order by avg_rating DESC;

Question 7
SELECT DISTINCT title
FROM data_analyst_job;

Question 7B
SELECT COUNT(DISTINCT title)
FROM data_analyst_job;

Question 8
SELECT COUNT(DISTINCT title)
FROM data_analyst_job
WHERE location ='CA'

Question 9
SELECT DISTINCT company,AVG(star_rating)
FROM data_analyst_job
WHERE review_count>5000 and company is not null
GROUP BY company;
9b
SELECT count( Distinct company)
FROM data_analyst_job
WHERE review_count>5000 and company is not null;

Question 10
SELECT DISTINCT company,(AVG(star_rating)) as avg_star_rating
FROM data_analyst_job
WHERE review_count>5000 and company is not null
GROUP BY company
ORDER BY avg_star_rating DESC;

Question 11
SELECT count (distinct title)
FROM data_analyst_job
Where title Ilike '%analyst%'

Question 12
SELECT count (title)
FROM data_analyst_job
WHERE title not ilike '%analyst%' and title not ilike '%analytics%';

Bonus
