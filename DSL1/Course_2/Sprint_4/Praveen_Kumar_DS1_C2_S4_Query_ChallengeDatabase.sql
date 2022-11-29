/* Task 1: Name of countries whose code USA GBR ARE*/
Select Name FROM country WHERE Code IN ("USA","GBR","ARE");

/* Task 2: Average of sum of population of continents */
SELECT AVG(Total)"Average Population" FROM (SELECT SUM(Population)"Total" FROM country GROUP BY continent)Total;

/* Task 3: To retrieve countries from europe where french is spoken */
SELECT Name from country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language LIKE "french") and Continent LIKE "europe";

/* Task 4: To retrieve one country from each continent with highest population */
SELECT Name , continent,Population from country where Population in(Select MAX(Population) from country Group by Continent)
GROUP BY CONTINENT order by Population DESC;
 