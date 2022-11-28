/*Task 1: To find details of employees adn thier department names */
Select employee_id,first_name,last_name,(select department_name from departments where departments.department_id=employees.department_id)Departments
FROM employees ORDER BY first_name;

/*Task 2: To find names and salaries of employees who have more than average salary */
SELECT CONCAT(first_name," ",last_name)"Name",salary from employees where salary > (select avg(salary) from employees);

/*Task 3: To find names and salaries of employees who have less than average salary and work in sales department*/
SELECT CONCAT(first_name," ",last_name)"Name",salary from employees where salary <(select avg(salary) from employees)
and department_id in (select department_id from departments where department_name like "%sales");

/*Task 4: To find names and salaries of employees who have higher salary than all the IT employees */
SELECT CONCAT(first_name," ",last_name)"Name",salary from employees where salary > (select max(salary) from employees where job_id like "IT%");

/*Task 5: To find details about employees who have lower salaries and oroder them  based on salary */
SELECT * from employees where salary < (select avg(salary) from employees) ORDER BY salary;

/*Task 6: To find details of employees who have higher salary than 60% of thier entire departments salary*/
SELECT * FROM employees,(select department_id,sum(salary)*60/100"Criteria" from employees group by department_id)Crit 
WHERE salary > Criteria and employees.department_id=Crit.department_id;

/*Task 7: To find employees who have managers whom are UK based */
SELECT * FROM employees where manager_id in
(SELECT manager_id FROM departments WHERE location_id in
(SELECT location_id FROM locations WHERE country_id ="UK"));

/*Task 8: To create a table and CSV file of top salaried employees */
CREATE TABLE TOP_SALARIED_EMPLOYEES (select CONCAT(first_name," ",last_name)"Name",salary from employees order by salary DESC LIMIT 7);
(SELECT * FROM TOP_SALARIED_EMPLOYEES)
INTO OUTFILE '"K:\\Desktop\\NIIT\\tables\\Top_salary.csv"'
FIELDS TERMINATED BY ','
LINES TERMINATED BY "\n";

