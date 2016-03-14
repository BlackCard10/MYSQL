# SQL Sources

## Synopsis
The purpose of this code is to demonstrate how various freely available sources can be used as reference materials for learning SQL.  The code is organized into folders based on the source of the example problems that are contained there.  


## Code Example 
The complexity of the souces range from simple select statments, to thinking about how database tables relate to one another and how to create that relation.  An example:  


/* Create a referenced superkey */

CREATE TABLE IF NOT EXISTS employees (

employee_id DECIMAL(6,0) PRIMARY KEY, 

first_name VARCHAR(20) DEFAULT NULL, 

last_name VARCHAR(20) NOT NULL, 

email VARCHAR(50) NOT NULL,

phone_number VARCHAR(30) NOT NULL...

## Motivation

The motivation for this project is to encourage using free and publicly available sources to learn SQL.  The internet has some great resources for these.  

## Folders/Files Contained Here
R and SQL: Uses a freely available database called Chinook that has multiple tables and observations.  I like to use this table to test certain types of queries that might take a few iterations to do correctly.  For completely open source querying pair with R-Studio. I included an example of how I did just this in the file contained here.  

SQLZOO: A great place to begin.  A variety of resouces are here and there are live editors to use.  

W3: At a certain point with SQL, I realized that I just wanted hundreds of problems to attempt and solve.  W3 resources has more complex problems that require creating, updating, & referencing tables.  
