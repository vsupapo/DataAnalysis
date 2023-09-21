/* Queries to test Power BI visualization accuracy */

/* Return the total revenue for each payment cycle 
   ANNUAL: 18380755.6
   BIWEEK: 9447646.1
   MONTH: 9374788.7
   WEEK: 8191710.7

|--tABLE--|----------------------|
| HELLO  |                    |

*/
SELECT payment_cycle, 
  SUM(quantity * price)
FROM mode.dunder_mifflin_paper_sales
WHERE status = 'COMPLETED'
GROUP BY payment_cycle

/* Return the total active accounts for each payment cycle 
   ANNUAL: 277
   BIWEEK: 224
   MONTH: 144
   WEEK: 202
*/
SELECT payment_cycle, 
  COUNT(order_id)
FROM mode.dunder_mifflin_paper_sales
WHERE status = 'COMPLETED'
GROUP BY payment_cycle

/* Return the average rating received from accounts from each payment cycle 
   ANNUAL: 3.764
   BIWEEK: 3.8229
   MONTH: 3.7438
   WEEK: 3.7241
*/
SELECT payment_cycle, 
  AVG(rating)
FROM mode.dunder_mifflin_paper_sales
WHERE status = 'COMPLETED'
GROUP BY payment_cycle

/* Return the top product based on total sales for each payment cycle */
SELECT product_name
FROM mode.dunder_mifflin_paper_sales
WHERE payment_cycle = 'ANNUAL' 
  AND status = 'COMPLETED'
GROUP BY product_name
ORDER BY SUM(quantity * price) DESC
LIMIT 1

SELECT product_name
FROM mode.dunder_mifflin_paper_sales
WHERE payment_cycle = 'BIWEEK' 
  AND status = 'COMPLETED'
GROUP BY product_name
ORDER BY SUM(quantity * price) DESC
LIMIT 1

SELECT product_name
FROM mode.dunder_mifflin_paper_sales
WHERE payment_cycle = 'MONTH' 
  AND status = 'COMPLETED'
GROUP BY product_name
ORDER BY SUM(quantity * price) DESC
LIMIT 1

SELECT product_name
FROM mode.dunder_mifflin_paper_sales
WHERE payment_cycle = 'WEEK' 
  AND status = 'COMPLETED'
GROUP BY product_name
ORDER BY SUM(quantity * price) DESC
LIMIT 1

/* Return the total count of active accounts for each region for each payment cycle 
   ANNUAL
     MIDWEST: 38
     NORTHEAST: 57
     SOUTH: 83
     WEST: 99
   BIWEEK
     MIDWEST: 31
     NORTHEAST: 56
     SOUTH: 70
     WEST: 87
   MONTH
     MIDWEST: 12
     NORTHEAST: 43
     SOUTH: 44
     WEST: 45
   WEEK
     MIDWEST: 24
     NORTHEAST: 50
     SOUTH: 61
     WEST: 67
*/
SELECT payment_cycle, 
  shipping_region,
  COUNT(order_id)
FROM mode.dunder_mifflin_paper_sales
WHERE status = 'COMPLETED'
GROUP BY payment_cycle, shipping_region
ORDER BY payment_cycle, shipping_region

/* Return a list of products, including units sold and total sales, for each payment cycle 
   ANNUAL
     UNITS SOLD: 6860
*/
SELECT payment_cycle, 
  product_name, 
  SUM(quantity) AS "units_sold", 
  SUM(quantity * price) AS "total_sales"
FROM mode.dunder_mifflin_paper_sales
WHERE status = 'COMPLETED'
GROUP BY payment_cycle, product_name
ORDER BY payment_cycle, "total_sales" DESC

/* Return a list of clients with the top product sales for each payment cycle */

/* Return the average ratings received in each quarter */

/* Return the total count of managed accounts in each quarter */
