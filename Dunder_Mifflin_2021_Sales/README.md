# :chart_with_upwards_trend: Dunder Mifflin 2021 Sales Analysis :chart_with_downwards_trend:

![DM_PBI](https://github.com/vsupapo/DataAnalysis/assets/60374437/bcb12a4d-53fc-41ca-bdfd-de5cb09ebbd4)


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

The following tables are created using the queries found in the data_extraction.sql file:  
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
| 1 | Sales Manager | An overview of product sales in each quarter | Can determine which products sell the most at different times of the year | A Power BI dashboard which allows for filtering all product sales data by quarter
| 2 | Sales Manager | An overview of product ratings in each quarter | Can follow up on product quality assurance | A Power BI dashboard which allows for filtering product ratings by quarter
| 3 | Sales Manager | An overview of sales representative ratings in each quarter | Can follow up on employee performance  | A Power BI dashboard which allows for filtering sales representative ratings by quarter
| 4 | Sales Manager | An overview of regional product sales in each quarter | Can determine product demand in different regions at different times of the year | A Power BI dashboard which allows for filtering product sales in each region by quarter 
| 5 | Sales Manager | An overview of order status for each sales representative | Can follow up on employee performance | A Power BI dashboard which allows for filtering sales representative orders by order status
| 6 | Sales Representative | An overview of top clients by payment cycle | Can follow up on top clients who purchase the most product | A Power BI dashboard which allows for filtering top clients by payment cycle
| 7 | Sales Representative | An overview of clients for each sales representative | Can follow up on clients as the account manager | A Power BI dashboard which allows for filtering clients by sales representatives



