-- How many entries in the countries table are from Africa ?

SELECT COUNT(*)
FROM countries
WHERE continent = 'Africa';

-- What was the total population of the continent of Oceania in 2005?

WITH inner_join AS (SELECT *
FROM population_years
JOIN countries
ON population_years.country_id = countries.id)
SELECT SUM(population)
FROM inner_join
WHERE continent = 'Oceania' AND year = 2005;

-- What is the average population of countries in South America in 2003?

WITH inner_join AS (SELECT *
FROM population_years
JOIN countries
ON population_years.country_id = countries.id)
SELECT AVG(population)
FROM inner_join
WHERE year = 2003 AND continent = 'South America';

-- What country had the smallest population in 2007?

WITH inner_join AS (SELECT *
FROM population_years
JOIN countries
ON population_years.country_id = countries.id)
SELECT name, MIN(population)
FROM inner_join
WHERE year = 2007;

-- What is the average population of Poland during the time period covered by this dataset?

WITH inner_join AS (SELECT *
FROM population_years
JOIN countries
ON population_years.country_id = countries.id)
SELECT name, AVG(population)
FROM inner_join
WHERE name = 'Poland';

-- How many countries have the word “The” in their name?

SELECT COUNT(*)
FROM countries
WHERE name LIKE '%The%';

-- What was the total population of each continent in 2010?

WITH inner_join AS (SELECT *
FROM population_years
JOIN countries
ON population_years.country_id = countries.id)
SELECT continent, SUM(population) 
FROM inner_join
WHERE year = 2010
GROUP BY 1; 



