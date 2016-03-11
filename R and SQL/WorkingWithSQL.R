library(DBI)
library(RSQLite)

# Create a connection to the database
con <- dbConnect (RSQLite::SQLite(), dbname = "~/Desktop/R Project/SQL Lite/funWithMYSQL/Chinook_Sqlite.sqlite")

# Fetch the names of the tables
alltables <- dbListTables(con)

# Store the top 5 results of the query into A and name it
A <- list()
for (i in 1:length(alltables)) {
  A[[i]] <- dbGetQuery(con, paste0("SELECT * FROM ",  alltables[i], " LIMIT 5"))
}
names(A) <- alltables

# List all of the employees with their manager
Manager_Query <- dbGetQuery(con, "SELECT a.LastName AS Boss, b.LastName AS Employee
                            From Employee a, Employee b
                            WHERE b.reportsTo = a.EmployeeId")


# Which employee has been with the company the longest (in years)
Longest_Streak <- dbGetQuery(con, "SELECT FirstName, LastName, (julianday() - julianday(DATE(HireDate)))/365 AS History
                            FROM Employee
                            GROUP BY EmployeeId
                            ORDER BY History DESC
                            LIMIT 1")

# What is the groupwise maximum invoice by Country
Max_Invoice <- dbGetQuery(con, "SELECT DISTINCT a.BillingCountry, a.Total 
                          FROM Invoice a
                          LEFT JOIN Invoice b
                          ON a.BillingCountry = b.BillingCountry
                          AND b.Total > a.Total
                          WHERE b.BillingCountry IS NULL")

# Write a query to show the employees that have both an 'a' and a 'c' in their first names
LikeAC <- dbGetQuery(con, "SELECT FirstName,LastName
                          FROM Employee
                          WHERE FirstName LIKE '%a%' AND 
                          FirstName LIKE '%c%' ")

# Write a query to display that First names of employees whose names have exactly 6 characters
Name_6 <- dbGetQuery(con, "SELECT FirstName
                          FROM Employee
                          WHERE FirstName LIKE '______' ")


# What jobs/designations are in the employee table and how many employees are in those jobs?
TitleCount <- dbGetQuery(con, "SELECT Title, COUNT(EmployeeId)
                          FROM employee
                          GROUP BY Title") 






                            
                            




