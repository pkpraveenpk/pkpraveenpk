/* Task 1: To find employees who are working in IT department */
SELECT employee_id,concat(first_name," ",last_name)"IT Employees" FROM employees LEFT OUTER JOIN departments
ON employees.department_id=departments.department_id WHERE department_name LIKE "IT";

/* Task 2: To find first name ,job ID,job title,min salary and max salary of all employees */
SELECT first_name,job_id,job_title,min_salary,max_salary FROM employees NATURAL JOIN jobs;
SELECT city from locations group by city;

/* Task 3: To identify the TOP 10 cities having largest number of employees */
SELECT city"City",COUNT(employee_id) FROM employees INNER JOIN departments INNER JOIN locations ON employees.department_id=departments.department_id
AND departments.location_id=locations.location_id GROUP BY city ORDER BY COUNT(employee_id) DESC;

/* Task 4: To find employee id and name of employees who left company on 1999-12-31*/
SELECT employees.employee_id,first_name FROM employees INNER JOIN job_history ON job_history.employee_id=employees.employee_id
WHERE end_date LIKE "1999-12-31";

/* Task 5: To fetch employee id, first_name department name and have total exp more than 25 years */
SELECT employee_id,first_name,YEAR(CURDATE())-YEAR(hire_date)"Experience" FROM employees HAVING Experience > 25 ORDER BY Experience DESC;
 
