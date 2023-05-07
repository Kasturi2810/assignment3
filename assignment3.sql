
-- QUESTION - 1
---------------------------
-------------------------
create database hospital;

create table doctor(did int primary key not null ,dname varchar(20) ,specialization varchar(20));
insert into doctor values(546732,"ravi","andrologist"),
						 (735168,"ramya","ayurvedic"),
                         (342180,"jyothi","cardiologist"),
                         (264782,"kasturi","chiropracter");

create table appointments(tocken_id int primary key,appointment_date date,duration int);
insert into appointments values(501,'2023-8-1',2),
                                (502,'2023-8-2',12),
                                (503,'2023-8-5',6),
                                (504,'2023-8-3',20),
                                (505,'2023-8-7',18);
					
create table patient(tocken_id int not null ,foreign key(tocken_id) references appointments(tocken_id),pname varchar(20) not null,dob date,gender varchar(10));
insert into patient values(501,"pallavi",'2002-6-1','F'),
						   (502,"sai",'2010-10-28','M'),
							(503,"uma",'1994-4-5','F'),
							(504,'manju','1991-12-26','M'),
							(505,'lakshmi','2008-8-15','F');
                            
create table reviews(patient_name varchar(20),rating int,rdate date);
insert into reviews values("preethi",5,"2023-8-13"),
						  ("anu",5,"2023-9-13"),
                          ("prathap",5,"2023-8-18");
                          
-- QUESTION - 2
--------------------
--------------------
CREATE TABLE CONTACT_TABLE(ID INT PRIMARY KEY,EMAIL VARCHAR(30),FNAME VARCHAR(20),LNAME VARCHAR(20),COMPANY VARCHAR(20),ACTIVE_FLAG INT,OPT_OUT INT);
INSERT INTO CONTACT_TABLE VALUES(123,"a@a.com","kiran","seth","ABC",1,1),
								(133,"b@a.com","neha","seth","ABC",1,0),
                                (234,"c@c.com","puru","malik","CDF",0,0),
                                (342,"d@d.com","sid","maan","TEG",1,0);
SELECT *FROM CONTACT_TABLE;

-- 1.select all columns from the contact table where the active flag is 1
SELECT *FROM CONTACT_TABLE WHERE ACTIVE_FLAG = 1;

-- 2.deactivate  contacts who are opted out
DELETE FROM CONTACT_TABLE WHERE OPT_OUT = 0;

-- 3. delete all the contacts who have the company name as 'ABC'
DELETE FROM CONTACT_TABLE WHERE COMPANY = "ABC";

--  4.insert a new row with id as id as 658,name as 'mili',email as 'mili@gmail.com', the company as 'DGH' active flag as 1 , opt-out flag as 1
INSERT INTO CONTACT_TABLE VALUES(658,'mili@gmail.com','MILI','SHAIK','DGH',1,1);

-- 5. PULL OUT THE UNIQUE VALUES OF THE COMPANY COLUMN 
SELECT DISTINCT COMPANY FROM CONTACT_TABLE;

-- 6. UPDATE THE NAME 'MILI' TO 'NITI'
UPDATE CONTACT_TABLE SET FNAME = "NITI" WHERE FNAME = "MILI";

-- QUESTION - 3 
-----------------
-----------------
-- Write a SQL query to find those customers with a grade less than 100. It should return cust_name, customer city, grade, salesman, and salesman city. 
-- The result should be ordered by ascending customer_id.

CREATE TABLE CUSTOMER2(CUSTOMER_ID INT PRIMARY KEY NOT NULL ,CUST_NAME VARCHAR(20),CITY VARCHAR(30),GRADE INT,SALESMAN_ID INT);
INSERT INTO CUSTOMER2 VALUES(3002,"Nick Rimando","New York",100 ,5001),
							(3007,"Brad Davis","New York",200,5001),
                            (3005,"Graham Zusi","California" ,200,5002),
                            (3008,"Julian Green","London",300,5002),
                            (3004,"Fabian Johnson","PariS",300,5006),
                            (3009,"Geoff Cameron","Berlin",100,5003),
                            (3003,"Jozy Altidor","Moscow",200 ,5007),
                            (3001,"Brad Guzan","London",NULL, 5005);
INSERT INTO CUSTOMER2 VALUES(3010,"kasturi","chennai",80,5005);

                            
SELECT *FROM CUSTOMER2;

CREATE TABLE SALESMAN2(SALESMAN_ID INT,NAME VARCHAR(20),CITY VARCHAR(20),COMMISSION FLOAT);
INSERT INTO SALESMAN2 VALUES(5001,"James Hoog","New York",0.15),
							(5002,"Nail Knite","Paris",0.13),
                            (5005,"Pit AleX","London",0.11),
                            (5006,"Mc Lyon","Paris",0.14),
                            (5007,"Paul Adam","Rome",0.13),
                            (5003,"Lauson Hen","San Jose",0.12);


SELECT *FROM SALESMAN2;

SELECT CUSTOMER2.CUST_NAME,CUSTOMER2.CITY AS C_CITY,CUSTOMER2.GRADE,SALESMAN2.SALESMAN_ID,SALESMAN2.CITY AS S_CITY FROM CUSTOMER2 
INNER JOIN SALESMAN2 ON CUSTOMER2.SALESMAN_ID = SALESMAN2.SALESMAN_ID WHERE CUSTOMER2.GRADE < 100 
ORDER BY CUSTOMER2.CUSTOMER_ID;



        





                          