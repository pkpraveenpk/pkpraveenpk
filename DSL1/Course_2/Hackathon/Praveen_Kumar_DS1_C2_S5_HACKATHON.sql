/* Task 1: To find the name and last_update from database */
SELECT concat(first_name," ",last_name)"Name",last_update FROM actor;


/* Task 2.1: To retrieve latest first and last names of actor to find changes */
SELECT first_name,last_name FROM actor WHERE last_update IN (SELECT max(last_update) FROM actor GROUP BY actor_id);

#Task 2.2: To find how many actors having same first and last names
SELECT Count(*) FROM actor WHERE first_name=last_name;

#Task 2.3 : How many actors have unique names and count of these actors 
SELECT DISTINCT(CONCAT(first_name," ",LAST_NAME))"Name" FROM actor ORDER BY Name;

/*Task 3: To know the list of actors whose names are repeated and not repeated */
SELECT DISTINCT(CONCAT(first_name," ",LAST_NAME))"Unique_name" FROM actor ORDER BY Unique_name; 

SELECT (CONCAT(first_name," ",LAST_NAME))"Repeated_Name",count(*)"COUNT" FROM actor GROUP BY Repeated_Name HAVING COUNT>1;

/* Task 4: To find films based on actors preferences and group films by category */
SELECT concat(first_name,' ',last_name) as 'Actor', actor_id, film_id,title,name,release_year,special_features 
FROM actor  join film_actor  join film  join film_category  join category 
on actor.actor_id=film_actor.actor_id and film.film_id=film_actor.film_id and ilm.film_id=film_category.film_id and category.category_id=film_category.category_id where name in (select name from category) group by name;
 
/* Task 5: To analyse which movie category has majority count and analyse trend based on description and category rating */

SELECT name,count(name)"Times" from film INNER JOIN film_category INNER JOIN category on
film.film_id=film_category.film_id AND film_category.category_id=category.category_id GROUP BY name ORDER BY Times DESC;
 
 #Task 5.1: To group film names by thier category rating */
 SELECT title"KIDS'S FILMS",rating from film WHERE rating="G" ORDER BY title ;
 
 SELECT title"Restricted for 16 and younger",rating from film WHERE rating="NC-17" ORDER BY title ;
 
SELECT title"Adults only",rating from film WHERE rating="R" ORDER BY title ;

/*Task 6: To show movie titles which have replacement cost upto $9 */
SELECT title FROM film WHERE replacement_cost < 9;

#Task 6.1: To return movies with replacment_cost between 15 and 20*/
SELECT title FROM film WHERE replacement_cost BETWEEN 15 AND 20;

#Task 6.2 : To return movies with highest replacment cost and order by rental rates */
SELECT B.title FROM(SELECT title FROM film ORDER BY replacement_cost DESC LIMIT 10)B LEFT OUTER JOIN film ON B.title=film.title ORDER BY rental_rate;

/*Task 7: To return all movies and the number of actors who acted in each of them */
SELECT Title,Count(*)"Actors" FROM film_actor INNER JOIN film on film_actor.film_id=film.film_id GROUP BY title;

/*Task 8: To display movie names starting with k and q */
SELECT Title FROM film WHERE Title LIKE "k%" OR "%q"; 
 
/*Task 9: To display all actors who acted in AGENT TRUMAN */
SELECT CONCAT(first_name," ",last_name)"Cast" FROM actor WHERE actor_id IN
(SELECT actor_id from film_actor WHERE film_id IN
(SELECT film_id FROM film WHERE title like "AGENT TRUMAN"));

/* Task 10: To display all films of family category */
SELECT title FROM film WHERE film_id 
IN(SELECT film_id FROM film_category WHERE category_id IN
(SELECT category_id FROM category WHERE name LIKE "family"));

/*Task 11: To display most frequently rented movies in descending order */
SELECT title,Count FROM film INNER JOIN
(SELECT film_id,count(film_id)"Count" FROM inventory GROUP BY film_id ORDER BY Count DESC )
Purchase ON purchase.film_id=film.film_id ;

/*Task 12: To find in how many film categories the average difference between replacement and rental greater than $15 */
SELECT category_id,AVG(replacement_cost - rental_rate)"Average_of_difference" FROM film INNER JOIN film_category ON film.film_id=film_category.film_id 
GROUP BY category_id HAVING average_of_difference > 15;

/*Task 13: To identify genre having 60-70 films and sort them by order */
SELECT name,count(film.film_id)"Nos_of_films" FROM film INNER JOIN film_category INNER JOIN category
ON film.film_id=film_category.film_id AND film_category.category_id=category.category_id
GROUP BY name HAVING Nos_of_films BETWEEN 60 AND 70 ORDER BY Nos_of_films DESC;
