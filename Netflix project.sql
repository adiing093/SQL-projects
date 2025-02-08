-- Netflix project
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
show_id VARCHAR(20),
type VARCHAR(10),
title VARCHAR(150),
director VARCHAR(208),
casts VARCHAR(1000),
country VARCHAR(150),
date_added VARCHAR(50),
release_year INT,
rating VARCHAR(10),
duration VARCHAR(50),
listed_in VARCHAR(105),
description VARCHAR(250)
);

SELECT*FROM netflix;

SELECT
COUNT(*) as total_content
FROM netflix;

SELECT DISTINCT type
FROM netflix;

SELECT*FROM netflix;


-- problem 1
-- Count the number of movies and number of tv shows ?

SELECT
type,
COUNT(*) as total_content
FROM netflix
GROUP BY type

--2)find the most common rating for movies and tv shows
SELECT
type,
rating
FROM
(
SELECT
type,
rating,
COUNT(*),
RANK () OVER(PARTITION BY type ORDER BY COUNT(*)) as ranking
FROM netflix
GROUP BY 1,2
) as t1
WHERE
ranking = 1

--3)List all movies release in specific year 2021
SELECT*FROM netflix
WHERE type = 'Movie'
AND
release_year=2021

--4)Find top 5 countries with most content on netflix
SELECT
UNNEST(STRING_TO_ARRAY(country, ',')) as new_country,
COUNT(show_id) as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

--5)Identify the longest movie
SELECT*FROM netflix
WHERE
type='Movie'
AND
duration=(SELECT MAX(duration)FROM netflix)

--6)find the content added in last 5 years
SELECT
*
FROM netflix
WHERE
TO_DATE(date_added,'Month DD, YYYY')>= CURRENT_DATE-INTERVAL'5years'

SELECT CURRENT_DATE-INTERVAL'5years'

--7) find all the movies by Rajiv Chilaka
SELECT*FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%'

--8)list all tv shows with more than 5 seasons
SELECT
*
FROM netflix
WHERE 
type='TV Show'
AND
SPLIT_PART(duration,' ',1)::numeric > 5 

--9) find the top 10 actors who appeared in the highesht number of films in India
SELECT
UNNEST(STRING_TO_ARRAY(casts,',')) as actors,
COUNT(*) as total_content
FROM netflix
WHERE country ILIKE '%India%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

--10) Categorize the content on the basis as keyword like kill and violence, label the description field. Label content containing these keywords as bad and all other content as good. Count how many itmes fall into each category
WITH new_table
AS
(
SELECT 
*,
CASE
WHEN description ILIKE '%kill%' OR description ILIKE '%violence%'
THEN 'Bad_content'
ELSE 'Good_content'
END category
FROM netflix
)
SELECT
category,
COUNT(*) as total_content
FROM new_table
GROUP BY 1
