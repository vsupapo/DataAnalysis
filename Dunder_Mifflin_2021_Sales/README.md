# :chart_with_upwards_trend: Dunder Mifflin 2021 Sales Analysis :chart_with_downwards_trend:


![ER Diagram](https://github.com/vsupapo/SQLDataAnalysis/assets/60374437/15d1ef73-e288-49ad-878e-f87bd134c297)


## Overview
Dunder Mifflin 2021 sales data is extracted and analyzed to provide insight on sales, clients, and company performance.

#### SQL Language
- PostgreSQL

#### Tools
- Mode Studio
- Power BI

## Data Extraction
Data is extracted from Mode Studio using the following tables:  
`mode.dunder_mifflin_paper_sales`   
`novaksam.dm_employees`   

The following tables are created using the queries found in the `data_extraction.sql` file:  
`Clients`   
`Employees`   
`Orders`   
`Products`   

## Business Requests
- Focus on how much we have sold and keep track of our top new clients and top products by payment cycle.
- View information for orders tied to each salesperson to follow up on company performance.
- Determine how clients rate our products and business over time.
- Identify the peak periods of the year concerning new account sales.

## User Stories

| No # | As a [role] | I want [request/demand] | So that I [user value] | Acceptance Criteria |
|------|-------------|-------------------------|------------------------|---------------------|
| 1 | Sales Manager | An overview of product sales for each payment cycle | Can determine which products sell the most and find the total revenue generated for each payment cycle  | A Power BI dashboard which allows for filtering product sales by payment cycle
| 2 | Sales Manager | An overview of sales representative ratings in each quarter | Can follow up on employee performance  | A Power BI dashboard which allows for filtering sales representative ratings by quarter
| 3 | Sales Manager | An overview of regional product sales for each payment cycle | Can determine product demand for each payment cycle | A Power BI dashboard which allows for filtering product sales in each region by payment cycle
| 4 | Sales Manager | An overview of new accounts managed for each quarter | Can determine the peak periods of the year | A Power BI dashboard which allows for filtering all new accounts by quarter
| 5 | Sales Representative | An overview of top clients by payment cycle | Can follow up on top clients who purchase the most product | A Power BI dashboard which allows for filtering top clients by payment cycle
| 6 | Sales Representative | An overview of clients for each sales representative | Can follow up on clients as the account manager | A Power BI dashboard which allows for filtering clients by sales representatives

## Data Quality Testing
Data quality is ensured using the queries found in the `data_testing.sql` file.

The queries found in the `data_testing.sql` file are performed on the `mode.dunder_mifflin_paper_sales` table and return the following data:
- The total revenue for each payment cycle
- The total active accounts for each payment cycle
- The average rating received from accounts for each payment cycle
- The top product based on total sales for each payment cycle
- The total count of active accounts for each region for each payment cycle
- A list of products, including units sold and total sales, for each payment cycle
- A list of clients with the top product sales for each payment cycle
- The average ratings received for each quarter
- The total count of managed accounts for each quarter 

