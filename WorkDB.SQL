/* 

The following is a database that I'll be using as an 
example for various queries related to a common sales & warehouse
data storage setup. 

*/

CREATE TABLE salesperson(
  id INT PRIMARY KEY, 
  name VARCHAR(10),
  age INT, 
  salary INT
);
  
  
INSERT INTO salesperson
  (id, name, age, salary)
VALUES
  ('1', 'Abe', '61', '140000'),
  ('2', 'Bob', '34', '4400'),
  ('5', 'Chris', '34', '40000'),
  ('7', 'Dan', '41', '52000'),
  ('8', 'Ken', '57', '115000'), 
  ('11', 'Joe', '38', '38000'); 
   
CREATE TABLE customer(
  id INT PRIMARY KEY, 
  name VARCHAR(10), 
  city VARCHAR(10), 
  industry_type VARCHAR(1)
);
 
 
INSERT INTO customer
  (id, name, city, industry_type)
VALUES
  ('4', 'samsonic', 'pleasant', 'J'),
  ('6', 'panasung', 'oaktown', 'J'),
  ('7', 'samony', 'jackson', 'B'),
  ('9', 'orange', 'jackson', 'B');

CREATE TABLE orders(
  number INT, 
  order_date date, 
  cust_id INT, 
  salesperson_id INT, 
  FOREIGN KEY(cust_id) REFERENCES customer(id), 
  FOREIGN KEY(salesperson_id) REFERENCES salesperson(id),
  amount INT
 );
 
  
INSERT INTO orders
  (number, order_date, cust_id, salesperson_id, amount)
VALUES 
  ('10', '1996-08-02', '4', '2', '540'),
  ('20', '1999-01-30', '4', '8', '1800'),
  ('30', '1995-07-14', '9', '1', '460'),
  ('40', '1998-01-29', '7', '2', '2400'), 
  ('50', '1998-02-03', '6', '7', '600'), 
  ('60', '1998-03-02', '6', '7', '720'), 
  ('70', '1998-05-06', '9', '7', '15