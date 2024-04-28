create table sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);
insert into sales_sample (Product_Id, Region, Date, Sales_Amount)
value
    (1, 'East', '2024-01-01', 100000.00),
    (2, 'West', '2024-01-02', 150000.00),
	(3, 'North', '2024-01-03', 200000.00),
	(4, 'South', '2024-01-03', 250000.00 );

select * from sales_sample;

select Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
from sales_sample
group by Region, Product_Id
order by  Region, Product_Id;

select Product_Id, Region, SUM(Sales_Amount) AS Total_Sales
from sales_sample
group by Product_Id, Region
order by  Product_Id, Region;


select Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
from sales_sample
group by CUBE (Product_Id, Region, Date)
order by  Product_Id, Region, Date;


select Region, Date, SUM(Sales_Amount) AS Total_Sales
from sales_sample
WHERE Region = 'East' AND Date BETWEEN '2024-01-01' AND '2024-01-15'
group by Region, Date
order by  Date;

select Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
from sales_sample
WHERE Product_Id = 1 AND Region = 'East' AND Date = '2024-01-01'
group by Product_Id, Region, Date
order by Date;
