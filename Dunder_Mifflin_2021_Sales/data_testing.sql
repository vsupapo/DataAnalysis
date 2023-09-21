/* Queries to test Power BI visualization accuracy */

/* Return the total revenue for each payment cycle 
   ANNUAL: 18380755.6
   BIWEEK: 9447646.1
   MONTH: 9374788.7
   WEEK: 8191710.7
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

/* Return the average rating received from accounts for each payment cycle 
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

/* Return the top product based on total sales for each payment cycle 
   ANNUAL: EarthChoice Multipurpose Paper | 15778617.4
   BIWEEK: TRU RED Multipurpose Paper | 5300820
   MONTH: TRU RED Multipurpose Paper | 4832040
   WEEK: TRU RED Multipurpose Paper | 3119190
*/
SELECT DISTINCT ON (s.payment_cycle)
  s.payment_cycle,
  s.product_name,
  MAX(s.total_sales) AS "top_sale"
FROM
   ( SELECT payment_cycle, 
        product_name, 
        SUM(quantity) AS "units_sold", 
        SUM(quantity * price) AS "total_sales"
     FROM mode.dunder_mifflin_paper_sales
     WHERE status = 'COMPLETED'
     GROUP BY payment_cycle, product_name
   ) s
GROUP BY s.payment_cycle, s.product_name
ORDER BY s.payment_cycle, top_sale DESC

/* Return the total count of active accounts for each region for each payment cycle 
   ANNUAL
     MIDWEST: 38
     NORTHEAST: 57
     SOUTH: 83
     WEST: 99
   BIWEEK
     MIDWEST: 31
     NORTHEAST: 36
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

/* Return a list of products, including units sold and total sales, for each payment cycle */
SELECT payment_cycle, 
  product_name, 
  SUM(quantity) AS "units_sold", 
  SUM(quantity * price) AS "total_sales"
FROM mode.dunder_mifflin_paper_sales
WHERE status = 'COMPLETED'
GROUP BY payment_cycle, product_name
ORDER BY payment_cycle, "total_sales" DESC

/* Return a list of clients with the top product sales for each payment cycle */
SELECT s.payment_cycle,
  s.account_name,
  s.total_sales,
  s.rank
FROM
   ( SELECT payment_cycle, 
        account_name,
        SUM(quantity * price) AS "total_sales",
        RANK() OVER (
           PARTITION BY payment_cycle
           ORDER BY SUM(quantity * price) DESC, account_name
      )
   FROM mode.dunder_mifflin_paper_sales
   WHERE status = 'COMPLETED'
   GROUP BY payment_cycle, account_name
   ORDER BY payment_cycle, total_sales DESC, account_name
   ) s
WHERE s.rank <= 12

/* Return the average ratings received for each quarter
   Q1: 3.7836
   Q2: 3.7233
   Q3: 3.7552
   Q4: 3.7929
*/
SELECT EXTRACT(QUARTER FROM purchased_at) AS "quarter",
  AVG(rating)
FROM mode.dunder_mifflin_paper_sales
GROUP BY quarter
ORDER BY quarter

/* Return the total count of managed accounts for each quarter 
   Q1: 237
   Q2: 245
   Q3: 256
   Q4: 262
*/
SELECT EXTRACT(QUARTER FROM purchased_at) AS "quarter",
  COUNT(account_id)
FROM mode.dunder_mifflin_paper_sales
GROUP BY quarter
ORDER BY quarter
