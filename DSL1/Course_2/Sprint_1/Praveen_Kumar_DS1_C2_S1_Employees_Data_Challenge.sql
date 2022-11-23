/*Task 1: To create database */
CREATE DATABASE Stylexcars_db;
USE Stylexcars_db;

/*Task 2: To create tables inside this database and set constraints*/
CREATE TABLE salesperson (salesperson_id INT PRIMARY KEY ,salesperson_name VARCHAR(50) NOT NULL,
salesperson_city VARCHAR(50) NOT NULL, commission_rate INT NOT NULL);

CREATE TABLE customers (customerid INT  PRIMARY KEY,c_firstname VARCHAR(50) NOT NULL,c_lastname VARCHAR(50) NOT NULL,
c_city VARCHAR(50) NOT NULL,c_rating INT NOT NULL );

CREATE TABLE orders (orderid INT PRIMARY KEY,amount INT NOT NULL,order_date DATE NOT NULL ,
salesperson_id INT ,FOREIGN KEY(salesperson_id)REFERENCES salesperson(salesperson_id),
customerid INT, FOREIGN KEY (customerid) REFERENCES customers(customerid));

/*Task 3: To insert data into all three tables*/
INSERT INTO salesperson(salesperson_id,salesperson_name,salesperson_city,commission_rate)
VALUES(1001,"William","London",12),(1002,"Liam","San Jose",13),(1003,"Axelrod","New York",10),
(1004,"James","London",11),(1005,"Fran","London",26),(1007,"Oliver","Barcelona",15),(1008,"John","London",0),(1009,"Charles","Florida",0);

INSERT INTO customers(customerid,c_firstname,c_lastname,c_city,c_rating)
VALUES(2001,"Hoffman","Anny","London",100),(2002,"Giovanni","Jenny","Rome",200),(2003,"Liu","Williams","San Jose",100),(2004,"Grass","Harry","Berlin",300),
(2005,"Clemens","John","London",200),(2006,"Cisneros","Fanny","San Jose",200),(2007,"Pereira","Jonathan","Rome",300);

INSERT INTO orders(orderid,amount,order_date,salesperson_id,customerid)
VALUES(3001,123,'2021-02-01',1009,2007),
(3002,100,'2021-02-01',1001,2007),
(3003,187,'2021-10-02',1001,2001),
(3005,201,'2021-10-09',1003,2003),
(3007,167,'2021-04-02',1004,2002),
(3008,189,'2021-03-06',1002,2002),
(3009,145,'2021-10-10',1009,2005),
(3010,200,'2021-02-23',1007,2007),
(3011,100,'2021-09-18',1001,2004);

/*Task 4: To update commission rate of employees who have between 0 to 15 */
SET SQL_SAFE_UPDATES=0;
UPDATE  salesperson SET commission_rate=15 WHERE commission_rate>=0 and commission_rate<=13;

/*Task 5: To clone orders table and name as ordersbkup */
CREATE TABLE ordersbkup SELECT * FROM orders;

/*Task 6: To clone orders table to orders_history and delete expired orders */
CREATE TABLE orders_history SELECT * FROM orders;

DELETE FROM orders WHERE orderid=3005 or orderid=3008;

DELETE FROM orders_history WHERE orderid=3005 or orderid=3008;

/*Task 7: To increase customer rating by 50 with customers more than2 orders. */
SELECT customerid from orders;

UPDATE customers SET c_rating=c_rating+50 WHERE customerid=2007;

