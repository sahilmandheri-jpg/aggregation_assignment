use world;

-- Question 1 : Count how many cities are there in each country?
SELECT 
    co.Code AS country_code,
    co.Name AS country_name,
    COUNT(ci.ID) AS city_count
FROM country AS co
LEFT JOIN city AS ci
    ON co.Code = ci.CountryCode
GROUP BY co.Code, co.Name
ORDER BY city_count DESC;

-- Question 2 : Display all continents having more than 30 countries.
SELECT 
    Continent,
    COUNT(*) AS country_count
FROM country
GROUP BY Continent
HAVING COUNT(*) > 30
ORDER BY country_count DESC;

-- Question 3 : List regions whose total population exceeds 200 million.
SELECT 
    Region,
    SUM(Population) AS total_population
FROM country
GROUP BY Region
HAVING SUM(Population) > 200000000
ORDER BY total_population DESC;

-- Question 4 : Find the top 5 continents by average GNP per country.
SELECT 
    Continent,
    AVG(GNP) AS avg_gnp_per_country
FROM country
GROUP BY Continent
ORDER BY avg_gnp_per_country DESC
LIMIT 5;

-- Question 5 : Find the total number of official languages spoken in each continent.
SELECT 
    co.Continent,
    COUNT(DISTINCT cl.Language) AS official_language_count
FROM country AS co
JOIN countrylanguage AS cl
    ON co.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY co.Continent
ORDER BY official_language_count DESC;

-- Question 6 : Find the maximum and minimum GNP for each continent.
SELECT 
    Continent,
    MAX(GNP) AS max_gnp,
    MIN(GNP) AS min_gnp
FROM country
GROUP BY Continent
ORDER BY Continent;

-- Question 7 : Find the country with the highest average city population.
SELECT 
    co.Code AS country_code,
    co.Name AS country_name,
    AVG(ci.Population) AS avg_city_population
FROM country AS co
JOIN city AS ci
    ON co.Code = ci.CountryCode
GROUP BY co.Code, co.Name
ORDER BY avg_city_population DESC
LIMIT 1;

-- Question 8 : List continents where the average city population is greater than 200,000.
SELECT 
    co.Continent,
    AVG(ci.Population) AS avg_city_population
FROM country AS co
JOIN city AS ci
    ON co.Code = ci.CountryCode
GROUP BY co.Continent
HAVING AVG(ci.Population) > 200000
ORDER BY avg_city_population DESC;

-- Question 9 : Find the total population and average life expectancy for each continent, ordered by average life
-- expectancy descending.
SELECT 
    Continent,
    SUM(Population) AS total_population,
    AVG(LifeExpectancy) AS avg_life_expectancy
FROM country
GROUP BY Continent
ORDER BY avg_life_expectancy DESC;

-- Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where
-- the total population is over 200 million.
SELECT 
    Continent,
    SUM(Population) AS total_population,
    AVG(LifeExpectancy) AS avg_life_expectancy
FROM country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY avg_life_expectancy DESC
LIMIT 3;


