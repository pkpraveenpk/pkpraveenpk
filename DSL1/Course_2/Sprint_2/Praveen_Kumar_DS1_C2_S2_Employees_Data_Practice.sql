/* Task 1: To select salesperson who live in London */ 
SELECT * FROM salesperson WHERE salesperson_city="London";

/* Task 2: To extract salesperson who have commission rate as 0% */
SELECT * FROM salesperson WHERE commission_rate=0;

/* Task 3: To extract salesperson with top 3 commission rates */
SELECT * FROM salesperson ORDER BY commission_rate DESC LIMIT 3;

/* Task 4: To extract details of sales person who have below average commission rate */
SELECT AVG(commission_rate) FROM salesperson;
SELECT * FROM salesperson HAVING 16.37>commission_rate;

/* Task 5: To extract details of salesperson who work in london and have less than average commission rate */
SELECT * FROM salesperson HAVING salesperson_city="London" AND commission_rate<16;

/* Task 6 : To extract details of salesperson who work in florida , barcelona and san jose. */
SELECT * FROM salesperson WHERE salesperson_city = "San Jose" OR salesperson_city = "Barcelona" OR salesperson_city = "Florida";

/* Task 7: To extract details of customers who have low ratings. lets consider average as criteria */
SELECT * FROM customers;
SELECT AVG(c_rating) FROM customers;
SELECT * FROM customers HAVING c_rating<207;

/* Task 8 : To extract details of customers having highest ratings. lets consider average as criteria */
SELECT AVG(c_rating) FROM customers;
SELECT * FROM customers HAVING c_rating>207;

/* Task 9 : To extract cities of customers having high ratings */
SELECT c_city FROM customers WHERE c_rating>207;

/* Task 10: To extract details of customers with details of rating highest to lowest*/
SELECT * FROM customers ORDER BY c_rating DESC;

/* Task 11: To find customers who have first letter as J and 3rd letter as N in thier names */
SELECT * FROM customers WHERE c_firstname LIKE "J%_n%"  or c_lastname LIKE "J%_n%";

/* Task 12: To find average and maximum sales amount */
SELECT AVG(amount),MAX(amount) FROM orders;

/* Task 13: To find total number of orders placed */
SELECT COUNT(*) "Total orders" FROM ordersbkup;

/* Task 14: To find total and average of each month */
SELECT * FROM ordersbkup;
SELECT MONTHNAME(order_date) "Month",AVG(amount) "Average",SUM(amount) "Total" FROM ordersbkup GROUP BY MONTH ;

