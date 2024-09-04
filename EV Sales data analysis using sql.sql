# SQL Data Analysis

SELECT * FROM codebasics.dim_date;
SELECT * FROM codebasics.electric_vehicle_sales_by_makers;
SELECT * FROM codebasics.electric_vehicle_sales_by_state;

## 1. List the top 3 and bottom 3 makers for the fiscal years 2023 and 2024 in terms of the number of 2-wheelers sold.

# Fiscal year 23 top 3

select codebasics.electric_vehicle_sales_by_makers.maker , codebasics.dim_date.fiscal_year  , sum(codebasics.electric_vehicle_sales_by_makers.electric_vehicles_sold) as sales 
from codebasics.electric_vehicle_sales_by_makers
join codebasics.dim_date on dim_date.date = electric_vehicle_sales_by_makers.date
where fiscal_year = "2023" and vehicle_category = "2-Wheelers"
group by electric_vehicle_sales_by_makers.maker
order by sales desc
limit 3;

# Fiscal year 23 bottom 3

select codebasics.electric_vehicle_sales_by_makers.maker , codebasics.dim_date.fiscal_year  , sum(codebasics.electric_vehicle_sales_by_makers.electric_vehicles_sold) as sales 
from codebasics.electric_vehicle_sales_by_makers
join codebasics.dim_date on dim_date.date = electric_vehicle_sales_by_makers.date
where fiscal_year = "2023" and vehicle_category = "2-Wheelers"
group by electric_vehicle_sales_by_makers.maker
order by sales asc
limit 3;

# Fiscal year 24 top 3

select codebasics.electric_vehicle_sales_by_makers.maker , codebasics.dim_date.fiscal_year  , sum(codebasics.electric_vehicle_sales_by_makers.electric_vehicles_sold) as sales 
from codebasics.electric_vehicle_sales_by_makers
join codebasics.dim_date on dim_date.date = electric_vehicle_sales_by_makers.date
where fiscal_year = "2024" and vehicle_category = "2-Wheelers"
group by electric_vehicle_sales_by_makers.maker
order by sales desc
limit 3;

# Fiscal year 24 bottom 3

select codebasics.electric_vehicle_sales_by_makers.maker , codebasics.dim_date.fiscal_year  , sum(codebasics.electric_vehicle_sales_by_makers.electric_vehicles_sold) as sales 
from codebasics.electric_vehicle_sales_by_makers
join codebasics.dim_date on dim_date.date = electric_vehicle_sales_by_makers.date
where fiscal_year = "2024" and vehicle_category = "2-Wheelers"
group by electric_vehicle_sales_by_makers.maker
order by sales asc
limit 3;

## 2. Identify the top 5 states with the highest penetration rate in 2-wheeler and 4-wheeler EV sales in FY 2024.

# in 2 wheelers

select electric_vehicle_sales_by_state.state , sum(codebasics.electric_vehicle_sales_by_makers.electric_vehicles_sold) as sales
from codebasics.electric_vehicle_sales_by_makers 
join codebasics.dim_date on dim_date.date = electric_vehicle_sales_by_makers.date
join codebasics.electric_vehicle_sales_by_state on electric_vehicle_sales_by_state.date = electric_vehicle_sales_by_makers.date
where fiscal_year = "2024" and electric_vehicle_sales_by_makers.vehicle_category = "2-Wheelers"
group by state
order by sales desc
limit 5;

# in 4 wheelers

select electric_vehicle_sales_by_state.state , sum(codebasics.electric_vehicle_sales_by_makers.electric_vehicles_sold) as sales
from codebasics.electric_vehicle_sales_by_makers 
join codebasics.dim_date on dim_date.date = electric_vehicle_sales_by_makers.date
join codebasics.electric_vehicle_sales_by_state on electric_vehicle_sales_by_state.date = electric_vehicle_sales_by_makers.date
where fiscal_year = "2024" and electric_vehicle_sales_by_makers.vehicle_category = "4-Wheelers"
group by state
order by sales desc
limit 5;

## 3. What are the quarterly trends based on sales volume for the EV makers (4-wheelers) from 2022 to 2024 

select codebasics.electric_vehicle_sales_by_makers.maker , codebasics.dim_date.fiscal_year, codebasics.dim_date.quarter  , sum(codebasics.electric_vehicle_sales_by_makers.electric_vehicles_sold) as sales 
from codebasics.electric_vehicle_sales_by_makers
join codebasics.dim_date on dim_date.date = electric_vehicle_sales_by_makers.date
where  vehicle_category = "4-Wheelers"
group by electric_vehicle_sales_by_makers.maker ,codebasics.dim_date.fiscal_year, codebasics.dim_date.quarter 
order by maker asc,codebasics.dim_date.fiscal_year asc , quarter asc , sales desc ;







