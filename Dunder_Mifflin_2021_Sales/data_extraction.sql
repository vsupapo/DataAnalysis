/* Selecting data for the following tables:
   - Clients
   - Employees
   - Orders
   - Products
*/

/* Selecting data for the Clients table */
SELECT 
account_name AS "Client Name",
account_id AS "Account ID",
CASE 
   WHEN business_size <= 1500 THEN 'Small Business'
   WHEN business_size <= 2000 THEN 'Mid-Market Enterprise'
   ELSE 'Large Enterprise' END AS "Business Size",
shipping_region AS "Region",
shipping_address AS "Address",
shipping_city AS "City",
shipping_state AS "State",
shipping_zip AS "Zipcode"
FROM mode.dunder_mifflin_paper_sales

/* Selecting data for the Employees table */
SELECT 
account_manager AS "Account Manager",
title AS "Title",
age AS "Age",
department AS "Department",
start_date AS "Start Date",
years_at_dunder_mifflin AS "Years Employed"
FROM novaksam.dm_employees

/* Selecting data for the Orders table */
SELECT 
order_id AS "Order ID",
purchased_at AS "Purchase Date",
EXTRACT(QUARTER FROM purchased_at) AS "Quarter",
status AS "Order Status",
cancelled_at AS "Cancel Date",
returned_at AS "Return Date",
product_id AS "Product ID",
quantity AS "Units Sold",
price * quantity AS "Total Price",
payment_cycle AS "Payment Cycle",
account_manager AS "Account Manager",
account_id AS "Account ID",
rating AS "Rating"
FROM mode.dunder_mifflin_paper_sales

/* Selecting data for the Products table */
SELECT
DISTINCT product_id AS "Product ID",
SPLIT_PART(product_name, ',', 1) AS "Product Name",
product_name AS "Product Description",
price AS "Unit Price"
FROM mode.dunder_mifflin_paper_sales
