SELECT * FROM zepto_sql_project.zepto;

-- count of rows
select count(*) from zepto;

-- null values
select * from zepto 
where name is null  or
      category is null  or
      mrp is null  or
      discountpercent is null  or
      availableQuantity is null  or
      discountedSellingPrice  is null  or
      weightInGms is null  or
      outOfStock is null  or
      quantity is null ;
	
-- different product category
select distinct(category) from zepto;

-- product in stock vs out of stocks
select count(*) , outOfstock from zepto 
group by outOfStock;

-- product name available multiple time
select name , count(*)  from zepto
group by name
having count(*) >1
order by count(*) desc;

-- data cleaning 

-- product price = 0
select * from zepto 
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto 
where mrp = 0;

update zepto 
set 
   mrp = mrp/100,
   discountedSellingPrice =   discountedSellingPrice /100 ;
   
select mrp , discountedSellingPrice from zepto;

-- bussiness insight 

-- find the top 10 best value products based on the discount percentage 
select distinct(name ), discountPercent from zepto
order by discountPercent desc limit 10 ;

-- what are the products with high MRP but out of stock
select distinct(name) , mrp from zepto 
where outOfStock = 'true'  
order by mrp desc ;

-- calculate Estimated Revenue for each category
select category , sum(discountedSellingPrice * availableQuantity) as total_revenue from zepto
group by category 
order by total_revenue;

-- find all products where MRP is greater than 500 and discount is less than 10%
select distinct(name) , mrp , discountPercent from zepto 
where mrp > 500 and discountPercent < 10
order by mrp desc , discountPercent desc ;

-- Identify the top 5 category offering the highest average discount percentage
select category , avg(discountPercent) as avg_percent from zepto 
group by category 
order by avg_percent desc limit 5;

--  find the price per gram for products above 100g and sort by best value 
select distinct(name) , weightInGms , discountedSellingPrice , discountedSellingPrice / weightInGms as price_per_gms
from zepto 
where weightInGms > 100
order by price_per_gms;

-- group the products into category like low , medium , bulk 
select distinct(name ) , weightInGms,
case 
 when weightIngms < 1000 then 'low'
 when weightInGms < 5000 then 'medium'
 else 'bulk'
 end  as weight_category
 from zepto;
 
-- what is the total Inventory weight per category 
select category , sum(weightInGms * availableQuantity) as total_weight
from zepto 
group by category 
order by total_weight;


 



