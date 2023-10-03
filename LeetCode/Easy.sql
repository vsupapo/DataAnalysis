/* A collection of Leetcode Solutions
   Difficulty: EASY
*/

/* 175. Combine Two Tables

   Write a solution to report the first name, last name, city, and state of each person in the Person table.
   If the address of a personId is not present in the Address table, report null instead.
   Return the result table in any order.

   Table: Person
   +-------------+---------+
   | Column Name | Type    |
   +-------------+---------+
   | personId    | int     |
   | lastName    | varchar |
   | firstName   | varchar |
   +-------------+---------+
   personId is the primary key (column with unique values) for this table.
   This table contains information about the ID of some persons and their first and last names.

   Table: Address
   +-------------+---------+
   | Column Name | Type    |
   +-------------+---------+
   | addressId   | int     |
   | personId    | int     |
   | city        | varchar |
   | state       | varchar |
   +-------------+---------+
   addressId is the primary key (column with unique values) for this table.
   Each row of this table contains information about the city and state of one person with ID = PersonId.
*/
SELECT person.firstName, person.lastName, address.city, address.state
FROM Person person
LEFT JOIN Address address
ON person.personId = address.personId

/* 181. Employees Earning More Than Their Managers

   Write a solution to find the employees who earn more than their managers.
   Return the result table in any order.
   
   Table: Employee
   +-------------+---------+
   | Column Name | Type    |
   +-------------+---------+
   | id          | int     |
   | name        | varchar |
   | salary      | int     |
   | managerId   | int     |
   +-------------+---------+
   id is the primary key (column with unique values) for this table.
   Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
*/
SELECT e.name AS "Employee"
FROM Employee e
JOIN Employee m
ON (e.managerId = m.id)
WHERE e.salary > m.salary

/* 182. Duplicate Emails

   Write a solution to report all the duplicate emails. 
   Note that it's guaranteed that the email field is not NULL.
   Return the result table in any order.

   Table: Person
   +-------------+---------+
   | Column Name | Type    |
   +-------------+---------+
   | id          | int     |
   | email       | varchar |
   +-------------+---------+
   id is the primary key (column with unique values) for this table.
   Each row of this table contains an email. The emails will not contain uppercase letters.
*/
SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(*) > 1

/* 183. Customers Who Never Order

   Write a solution to find all customers who never order anything.
   Return the result table in any order.

   Table: Customers
   +-------------+---------+
   | Column Name | Type    |
   +-------------+---------+
   | id          | int     |
   | name        | varchar |
   +-------------+---------+
   id is the primary key (column with unique values) for this table.
   Each row of this table indicates the ID and name of a customer.

   Table: Orders
   +-------------+------+
   | Column Name | Type |
   +-------------+------+
   | id          | int  |
   | customerId  | int  |
   +-------------+------+
   id is the primary key (column with unique values) for this table.
   customerId is a foreign key (reference columns) of the ID from the Customers table.
   Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
*/
SELECT name AS "Customers"
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE customerId IS NULL

/* 196. Delete Duplicate Emails

   Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
   For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
   
   Table: Person
   +-------------+---------+
   | Column Name | Type    |
   +-------------+---------+
   | id          | int     |
   | email       | varchar |
   +-------------+---------+
   id is the primary key (column with unique values) for this table.
   Each row of this table contains an email. The emails will not contain uppercase letters.
*/
DELETE p1
FROM Person p1, Person p2
WHERE p1.email = p2.email
AND p1.id > p2.id

/* 197. Rising Temperature

   Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
   Return the result table in any order.
   
   Table: Weather
   +---------------+---------+
   | Column Name   | Type    |
   +---------------+---------+
   | id            | int     |
   | recordDate    | date    |
   | temperature   | int     |
   +---------------+---------+
   id is the column with unique values for this table.
   This table contains information about the temperature on a certain day.
*/
SELECT w1.id 
FROM Weather w1, Weather w2
WHERE w1.temperature > w2.temperature AND DATEDIFF(w1.recordDate , w2.recordDate) = 1

/* 511. Game Play Analysis I

   Write a solution to find the first login date for each player.
   Return the result table in any order.
   
   Table: Activity
   +--------------+---------+
   | Column Name  | Type    |
   +--------------+---------+
   | player_id    | int     |
   | device_id    | int     |
   | event_date   | date    |
   | games_played | int     |
   +--------------+---------+
   (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
   This table shows the activity of players of some games.
   Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
*/
SELECT player_id, MIN(event_date) AS "first_login"
FROM Activity
GROUP BY player_id

/* 584. Find Customer Referee

   Find the names of the customer that are not referred by the customer with id = 2.
   Return the result table in any order.
   
   Table: Customer
   +-------------+---------+
   | Column Name | Type    |
   +-------------+---------+
   | id          | int     |
   | name        | varchar |
   | referee_id  | int     |
   +-------------+---------+
   In SQL, id is the primary key column for this table.
   Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
*/
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL

/* 586. Customer Placing the Largest Number of Orders

   Write a solution to find the customer_number for the customer who has placed the largest number of orders.
   The test cases are generated so that exactly one customer will have placed more orders than any other customer.
   
   Table: Orders
   +-----------------+----------+
   | Column Name     | Type     |
   +-----------------+----------+
   | order_number    | int      |
   | customer_number | int      |
   +-----------------+----------+
   order_number is the primary key (column with unique values) for this table.
   This table contains information about the order ID and the customer ID.
*/
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC
LIMIT 1

/* 595. Big Countries

   A country is big if:
   - it has an area of at least three million (i.e., 3000000 km2), or
   - it has a population of at least twenty-five million (i.e., 25000000).
   Write a solution to find the name, population, and area of the big countries.
   Return the result table in any order.
   
   Table: World
   +-------------+---------+
   | Column Name | Type    |
   +-------------+---------+
   | name        | varchar |
   | continent   | varchar |
   | area        | int     |
   | population  | int     |
   | gdp         | bigint  |
   +-------------+---------+
   name is the primary key (column with unique values) for this table.
   Each row of this table gives information about the name of a country, the continent to which it belongs, its area, the population, and its GDP value.
*/
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000








