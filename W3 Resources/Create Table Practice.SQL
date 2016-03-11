/* An offshoot of W3 has some great exercises on 
how to create a table with varying levels of complexity.  
*/ 



/* Basic construction */
CREATE TABLE countries (
country_id INT,
country_name VARCHAR(50),
region_id INT
);


/* Check if table already exists */ 
CREATE TABLE IF NOT EXISTS countries(
country_id INT,
country_name VARCHAR(50),
region_id INT
);


/* create a similar structure to countries tables */ 
CREATE TABLE IF NOT EXISTS dup_countries
LIKE countries; 


/* Create a copy of a table into a new data structure */
CREATE TABLE IF NOT EXISTS dup_countries 
AS SELECT * FROM countries


/* Create a table with a NOT NULL contraint */
CREATE TABLE IF NOT EXISTS countries (
country_id  INT NOT NULL,
country_name VARCHAR(50),
region_id INT
);


/* Create a new jobs table with a check function on salary where  < 250000 */
CREATE TABLE IF NOT EXISTS jobs(
job_id VARCHAR(10) PRIMARY KEY, 
job_title VARCHAR(70), 
min_salary DECIMAL(5,2),
max_salary DECIMAL (5,2), 
CHECK(max_salary <= 25000)
);


/* Create a table named countries that checks specific country names */
CREATE TABLE IF NOT EXISTS countries(
country_id INT NOT NULL, 
country_name VARCHAR(50), 
region_id INT, 
CHECK(country_name IN ('Italy', 'India', 'China')) 
);


/* Create a table that checks the format of insertion of an object */ 
CREATE TABLE IF NOT EXISTS job_history (
employee_id INT PRIMARY KEY,
start_date DATE, 
end_date DATE, 
job_id VARCHAR(10) NOT NULL, 
department_id VARCHAR(10),
CHECK(end_date LIKE '__/__/____')
);

/* Create a column with a unique country_id */ 
CREATE TABLE IF NOT EXISTS countries (
country_id INT NOT NULL, 
country_name VARCHAR(50), 
region_id INT,
UNIQUE(country_id)
);

/* Create a table with various checks */
CREATE TABLE IF NOT EXISTS jobs (
job_id VARCHAR(10),
job_title VARCHAR(70) DEFAULT '',
min_salary DECIMAL (5,2) DEFAULT 8000,
max_salary DECIMAL (5,2) DEFAULT NULL
);


/* Create a table with a primary key on country_id */
CREATE TABLE IF NOT EXISTS countries (
country_id INT PRIMARY KEY,
country_name VARCHAR(50) NOT NULL, 
region_id INT NOT NULL
);


/* Create a table with an auto incremented primary key */
CREATE TABLE IF NOT EXISTS countries (
country_id INT AUTO_INCREMENT PRIMARY KEY, 
country_name VARCAR(50) NOT NULL, 
region_id INT NOT NULL
); 


/* Create a table where country_id and region_id form a superkey */ 
CREATE TABLE IF NOT EXISTS countries (
country_id INT AUTO_INCREMENT PRIMARY KEY, 
country_name VARCAR(50) NOT NULL, 
region_id INT NOT NULL,
PRIMARY KEY (country_id, region_id)
);


/* Create a referenced table */
CREATE TABLE IF NOT EXISTS job_history (
employee_id DECIMAL(6,0) PRIMARY KEY, 
start_date DATE NOT NULL, 
end_date DATE NOT NULL, 
job_id VARCHAR(10) NOT NULL, 
department_id VARCHAR(10),
UNIQUE(employee_id),
FOREIGN KEY job_id REFERENCES jobs(job_id)
);


/* Create a referenced superkey */
CREATE TABLE IF NOT EXISTS employees (
employee_id DECIMAL(6,0) PRIMARY KEY, 
first_name VARCHAR(20) DEFAULT NULL, 
last_name VARCHAR(20) NOT NULL, 
email VARCHAR(50) NOT NULL,
phone_number VARCHAR(30) NOT NULL, 
hire_date DATE, 
job_id VARCHAR(10) NOT NULL, 
salary DECIMAL (5,2) NOT NULL,
commission DECIMAL(3,2) NOT NULL, 
manager_id DECIMAL (6,0) NOT NULL, 
department_id DECIMAL (4,0) NOT NULL,
FOREIGN KEY (manager_id, department_id) REFERENCES departments(manager_id, department_id)
);


/*

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+

*/


CREATE TABLE IF NOT EXISTS employees (
employee_id DECIMAL (6,0) PRIMARY KEY, 
first_name VARCHAR(20) DEFAULT NULL, 
last_name VARCHAR(20) NOT NULL, 
email VARCHAR(50) NOT NULL, 
phone_number VARCHAR(30) NOT NULL, 
hire_date DATE, 
job_id VARCHAR(10) NOT NULL, 
salary DECIMAL (5,2) NOT NULL, 
commission DECIMAL (3,2) NOT NULL, 
manager_id DECIMAL (6,0) DEFAULT NULL, 
department_id DECIMAL (4,0) NOT NULL, 
FOREIGN KEY (department_id) REFERENCES departments(department_id),
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
); 

/*
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | YES  |     | NULL    |       |
| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+


+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+

*/

/* When the parent table job_id is deleted, delete the child object as well in job_id. 
When the rows in the parent table are updated, the child table values are set to null.  */
CREATE TABLE IF NOT EXISTS employees (
employee_id DECIMAL (6,0) PRIMARY KEY, 
first_name VARCHAR(20) DEFAULT NULL,
last_name VARCHAR(20) NOT NULL, 
job_id INT, 
salary decimal(8,2) DEFAULT NULL, 
FOREIGN KEY(job_id) REFERENCES jobs(job_id)
ON DELETE SET NULL
ON UPDATE SET NULL


/* Assume that on an update in the parent there is no action being taken in the child. */
CREATE TABLE IF NOT EXISTS employees (
employee_id DECIMAL (6,0) NOT NULL PRIMARY KEY, 
first_name VARCHAR (20) DEFAULT NULL, 
last_name varchar(25) NOT NULL, 
job_id INT NOT NULL, 
salary decimal(8,2) DEFAULT NULL, 
foreign key(job_id) REFERENCES jobs(job_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
); 

















 






 








