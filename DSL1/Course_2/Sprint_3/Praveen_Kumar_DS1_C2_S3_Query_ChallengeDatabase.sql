/* Task 1:* To find the popular cities where most employees want work */
SELECT city"Most Popular cities amongst employees" FROM employees INNER JOIN departments INNER JOIN locations ON employees.department_id=departments.department_id
AND departments.location_id=locations.location_id GROUP BY city ORDER BY COUNT(employee_id) DESC ;

/* Task 2 : To find first name last name and country city department and salary of TOP 5 cities */
SELECT concat(first_name," ",last_name)"Name",salary,department_name,city,country_name FROM employees INNER JOIN departments INNER JOIN locations INNER JOIN countries
ON employees.department_id=departments.department_id AND departments.location_id=locations.location_id AND locations.country_id=countries.country_id GROUP BY CITY
ORDER  BY COUNT(employee_id) DESC LIMIT 5 ;

/* Task 3: To find Top 5 cities based on employee population */
SELECT city"Most Popular cities amongst employees",COUNT(employee_id) FROM employees INNER JOIN departments INNER JOIN locations ON employees.department_id=departments.department_id
AND departments.location_id=locations.location_id GROUP BY city ORDER BY COUNT(employee_id) DESC LIMIT 5;

/* Task 4: To help identify the employees who are working more than 10 years */
SELECT employee_id,concat(first_name," ",last_name)"Name" FROM employees WHERE YEAR(CURDATE())-YEAR(hire_date) > 10;

/*Task 5: To find manager id of those employees in the organisation who have worked more than 10 years */
SELECT manager_id FROM employees WHERE manager_id is not null AND YEAR(CURDATE())-YEAR(hire_date) > 10 ;

/*Task 6: To find the Top 3 countries having the most loyal employees */
SELECT country_name"Country",COUNT(employee_id)"Count of employees" FROM employees INNER JOIN departments INNER JOIN locations INNER JOIN countries
ON employees.department_id=departments.department_id AND departments.location_id=locations.location_id AND locations.country_id=countries.country_id
WHERE (YEAR(CURDATE())-YEAR(hire_date)) > 20 GROUP BY country_name ORDER BY COUNT(employee_id) DESC;


