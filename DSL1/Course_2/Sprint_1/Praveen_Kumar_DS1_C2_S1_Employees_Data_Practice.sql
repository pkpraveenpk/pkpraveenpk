/*Task 1: To create a database named as techmac_db */
CREATE DATABASE Techmac_db;

/*Task 2: To create 3 tables in database with corresponding names */
CREATE TABLE Techmac_db.techhyve_employee(employee_id VARCHAR(50),first_name VARCHAR(50),last_name VARCHAR(50),
gender VARCHAR(50),age INT);
CREATE TABLE Techmac_db.techcloud_employee(employee_id VARCHAR(50),first_name VARCHAR(50),last_name VARCHAR(50),
gender VARCHAR(50),age INT);
CREATE TABLE Techmac_db.techsoft_employee(employee_id VARCHAR(50),first_name VARCHAR(50),last_name VARCHAR(50),
gender VARCHAR(50),age INT);

/*Task 3: To add proficiency level column in the existing tables */
ALTER TABLE Techmac_db.techhyve_employee add Proficiency_level INT;
ALTER TABLE Techmac_db.techsoft_employee add Proficiency_level INT;
ALTER TABLE Techmac_db.techcloud_employee add Proficiency_level INT;

/*Task 4: To add constraints to the columns of all 3 tables */
# 1. Change employee_id as primary key.
ALTER TABLE Techmac_db.techhyve_employee MODIFY employee_id VARCHAR(50) PRIMARY KEY;
ALTER TABLE Techmac_db.techcloud_employee MODIFY employee_id VARCHAR(50) PRIMARY KEY;
ALTER TABLE Techmac_db.techsoft_employee MODIFY employee_id VARCHAR(50) PRIMARY KEY;
# 2. Proficiency level should be between 1 and 5 also default value as 1.
ALTER TABLE Techmac_db.techhyve_employee MODIFY Proficiency_level INT CHECK(Proficiency_level>=1 and Proficiency_level<=5) DEFAULT "1";
ALTER TABLE Techmac_db.techcloud_employee MODIFY Proficiency_level INT CHECK(Proficiency_level>=1 and Proficiency_level<=5) DEFAULT "1";
ALTER TABLE Techmac_db.techsoft_employee MODIFY Proficiency_level INT CHECK(Proficiency_level>=1 and Proficiency_level<=5) DEFAULT "1";
# 3. Age should be ranged from 21 to 55.
ALTER TABLE Techmac_db.techhyve_employee MODIFY age INT CHECK(age>=21 and age<=55);
ALTER TABLE Techmac_db.techcloud_employee MODIFY age INT CHECK(age>=21 and age<=55);
ALTER TABLE Techmac_db.techsoft_employee MODIFY age INT CHECK(age>=21 and age<=55);

/*Task 5: To insert values in 3 corresponding tables */
INSERT INTO Techmac_db.techhyve_employee(employee_id,first_name,last_name,gender,age,Proficiency_level)
VALUES("TH0001","Eli","Evans","Male",26,1),("TH0002","Carlos","Simmons","Male",32,2),
("TH0003","Kathie","Bryant","Female",25,1),("TH0004","Joey","Hughes","Male",41,4),("TH0005","Alice","Matthews","Female",52,4);

INSERT INTO Techmac_db.techsoft_employee(employee_id,first_name,last_name,gender,age,Proficiency_level)
VALUES("TS0001","Peter","Burtler","Male",44,4),("TS0002","Harold","Simmons","Male",54,4),
("TS0003","Juliana","Sanders","Female",36,2),("TS0004","Paul","Ward","Male",29,2),("TS0005","Nicole","Bryant","Female",30,2);

INSERT INTO Techmac_db.techcloud_employee(employee_id,first_name,last_name,gender,age,Proficiency_level)
VALUES("TC0001","Teresa","Bryant","Female",39,2),("TC0002","Alexis","Patterson","Male",48,5),
("TC0003","Rose","Bell","Female",42,3),("TC0004","Gemma","Watkins","Female",44,3),("TC0005","Kingston","Martinez","Male",29,2);

/* Task 6 : To clone all the 3 tables */
CREATE TABLE Techmac_db.techcloud_employee_bkup LIKE Techmac_db.techcloud_employee;
INSERT INTO Techmac_db.techcloud_employee_bkup SELECT * FROM Techmac_db.techcloud_employee;

CREATE TABLE Techmac_db.techhyve_employee_bkup LIKE Techmac_db.techhyve_employee;
INSERT INTO Techmac_db.techhyve_employee_bkup SELECT * FROM Techmac_db.techhyve_employee;

CREATE TABLE Techmac_db.techsoft_employee_bkup LIKE Techmac_db.techsoft_employee;
INSERT INTO Techmac_db.techsoft_employee_bkup SELECT * FROM Techmac_db.techsoft_employee;

/* Task 7: To delete certain employee's record due to their resignation */
DELETE FROM Techmac_db.techhyve_employee_bkup WHERE employee_id="TH0003" or employee_id="TH0005";
DELETE FROM Techmac_db.techcloud_employee_bkup WHERE employee_id="TC0001" or employee_id="TC0004";

/* Task 8 : To merge Techhyve and Techcloud and rename as Techhyve_cloud_employee and truncate parent tables*/
CREATE TABLE Techmac_db.Techhyve_cloud_employee
(SELECT * FROM Techmac_db.techhyve_employee_bkup) UNION (SELECT * FROM Techmac_db.techcloud_employee_bkup);
#Truncate 2 tables
TRUNCATE Techmac_db.techhyve_employee;
TRUNCATE Techmac_db.techcloud_employee;

/* FINAL OUTPUT TABLES */
SELECT * FROM Techmac_db.techsoft_employee;
SELECT * FROM Techmac_db.Techhyve_cloud_employee;


