/* A collection of Leetcode Solutions
   Difficulty: MEDIUM
*/

/* 176. Second Highest Salary

   Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null.

   Table: Employee
  +-------------+------+
  | Column Name | Type |
  +-------------+------+
  | id          | int  |
  | salary      | int  |
  +-------------+------+
  id is the primary key (column with unique values) for this table.
  Each row of this table contains information about the salary of an employee.
*/
SELECT MAX(Salary)
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee)

/* 626. Exchange Seats

   Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
  Return the result table ordered by id in ascending order.
  
  Table: Seat
  +-------------+---------+
  | Column Name | Type    |
  +-------------+---------+
  | id          | int     |
  | student     | varchar |
  +-------------+---------+
  id is the primary key (unique value) column for this table.
  Each row of this table indicates the name and the ID of a student.
  id is a continuous increment.
*/
SELECT CASE
WHEN id != (SELECT MAX(id) FROM Seat) AND id % 2 = 1
THEN id + 1 
WHEN id != (SELECT MAX(id) FROM Seat) AND id % 2 = 0
THEN id - 1
WHEN (SELECT MAX(id) FROM Seat) % 2 = 0
THEN id - 1
ELSE id
END AS id, student
FROM Seat
GROUP BY id
ORDER BY id ASC

/* 1158. Market Analysis I

  Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
  Return the result table ordered by id in ascending order.
  
  Table: Users
  +----------------+---------+
  | Column Name    | Type    |
  +----------------+---------+
  | user_id        | int     |
  | join_date      | date    |
  | favorite_brand | varchar |
  +----------------+---------+
  user_id is the primary key (column with unique values) of this table.
  This table has the info of the users of an online shopping website where users can sell and buy items.
 
  Table: Orders
  +---------------+---------+
  | Column Name   | Type    |
  +---------------+---------+
  | order_id      | int     |
  | order_date    | date    |
  | item_id       | int     |
  | buyer_id      | int     |
  | seller_id     | int     |
  +---------------+---------+
  order_id is the primary key (column with unique values) of this table.
  item_id is a foreign key (reference column) to the Items table.
  buyer_id and seller_id are foreign keys to the Users table. 

  Table: Items
  +---------------+---------+
  | Column Name   | Type    |
  +---------------+---------+
  | item_id       | int     |
  | item_brand    | varchar |
  +---------------+---------+
  item_id is the primary key (column with unique values) of this table.
*/
SELECT u.user_id AS buyer_id, u.join_date, COUNT(order_id) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o
ON u.user_id = o.buyer_id AND YEAR(o.order_date) = '2019'
GROUP BY u.user_id

/* 1393. Capital Gain/Loss

  Write a solution to report the Capital gain/loss for each stock.
  The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.
  Return the result table in any order.
  
  Table: Stocks
  +---------------+---------+
  | Column Name   | Type    |
  +---------------+---------+
  | stock_name    | varchar |
  | operation     | enum    |
  | operation_day | int     |
  | price         | int     |
  +---------------+---------+
  (stock_name, operation_day) is the primary key (combination of columns with unique values) for this table.
  The operation column is an ENUM (category) of type ('Sell', 'Buy')
  Each row of this table indicates that the stock which has stock_name had an operation on the day operation_day with the price.
  It is guaranteed that each 'Sell' operation for a stock has a corresponding 'Buy' operation in a previous day. It is also guaranteed that each 'Buy' operation for a stock has a corresponding 'Sell' operation in an upcoming day.
*/
SELECT stock_name, SUM(IF(operation="Buy", -price, price)) AS capital_gain_loss
FROM stocks
GROUP BY stock_name
ORDER BY stock_name



