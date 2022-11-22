Create database employee_db;#creating db
create table employee_db.Employee_details(empNO INT auto_increment primary key,dob date, firstname varchar(50),
lastname varchar(50),gender varchar(10), hiredate date);#creating tables
alter table employee_db.Employee_details auto_increment=100;
create table employee_db.department(deptNo int,Name varchar(50));
/*Task 1 : Insert data into the table. */
Insert into employee_db.Employee_details(dob,firstname,lastname,gender,hiredate)
values("2001-06-13","Praveen","Kumar","Male","2022-11-14"),
	  ("2002-07-14","Dhoni","Mahendra","Male","2022-12-12"),
      ("2003-08-15","Virat","Kholi","Male","2022-08-18"),
      ("2008-05-24","Darshan","Priya","Male","2022-09-20");
Insert into employee_db.department(deptNo,Name)
values(1,"Sales"),(2,"HR"),(3,"IT");
Select * from employee_db.Employee_details;
Select * from employee_db.department;
/*Task 2: To rename sales as sales&finance*/
SET SQL_SAFE_UPDATES = 0;
update employee_db.department set Name="Sales and Finance" where Name="sales";
Select * from employee_db.department;
/*Task 3: To change employee number 103 to 104 */
update employee_db.Employee_details set empNo=104 where empNo=103;
Select * from employee_db.Employee_details;
/*Task 4: To delete employee 101 since he resigned */
delete from employee_db.Employee_details where empNo=101;
Select * from employee_db.Employee_details;
