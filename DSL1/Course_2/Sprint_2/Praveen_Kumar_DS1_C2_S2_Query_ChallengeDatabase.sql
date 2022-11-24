/* Task 1: To find count of employees in organisation */
SELECT COUNT(*) "Total employees" FROM employees;

/* Task 2: To find department wise count of employees */
SELECT department_name,count(employees.department_id)"Count"  FROM departments,employees WHERE departments.department_id=employees.department_id GROUP BY department_name;

/* Task 3: To find first_name and salaries of employees having salaries greater than 6000$ */
SELECT first_name,salary FROM employees WHERE salary>6000;

/* Task 4: To find the count of employees who earn more than 20000 in the organisation */
SELECT count(*) "Count of employees $20K and above" FROM employees WHERE salary>=20000;

/* Task 5: To find commission of all employees */
SELECT *  FROM employees WHERE commission_pct 	IS NOT NULL ORDER BY commission_pct DESC;

/* Task 6: To find full names of employees who have not recieved commissions */
SELECT CONCAT(first_name," ",last_name) AS "Name" FROM employees WHERE commission_pct IS  NULL;

/*Task 7: To find certain information to provide to verification agency*/
SELECT employee_id,CONCAT(first_name," ",last_name)"Name",email"Email",phone_number"Contact" FROM employees;

/*Task 8: To identify the departments that have the top 3 CTC's */
SELECT department_name,MAX(salary)"Top salaries" FROM departments,employees WHERE departments.department_id=employees.department_id 
GROUP BY department_name HAVING MAX(employees.salary) ORDER BY salary DESC LIMIT 3;

/*Task 9: To find the details of clerical grade employees */
SELECT * FROM jobs HAVING  job_id LIKE "%CLERK%";

/* Task 10: To find details about employees of clerical grade */
SELECT * FROM employees HAVING job_id LIKE "%CLERK%";

/*Task 11: To find the count of employees having salaries in the range $7000 to $10000 department wise */
SELECT department_name,COUNT(employee_id) FROM employees,departments  WHERE employees.department_id=departments.department_id AND (salary>7000 and salary<10000)
GROUP BY department_name ;




