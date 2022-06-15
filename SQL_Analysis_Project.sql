Select*From dbo.Groceries_dataset;
Select member_number from dbo.Groceries_dataset where member_number IS NULL;
Select purchase_Date from dbo.Groceries_dataset where purchase_Date IS NULL;
Select item_description from dbo.Groceries_dataset where item_description IS NULL;
select COUNT(member_number) from dbo.Groceries_dataset;
select COUNT(Distinct member_number) from dbo.Groceries_dataset;
select COUNT(Distinct item_description) from dbo.Groceries_dataset;
select MAX(purchase_Date) from dbo.Groceries_dataset;
select MIN(purchase_Date) from dbo.Groceries_dataset;
Alter table dbo.Groceries_dataset ADD Purchase_year INT;
Alter table dbo.Groceries_dataset ADD Purchase_month INT;
Alter table dbo.Groceries_dataset ADD Purchase_day INT;
Alter table dbo.Groceries_dataset ADD Purchase_dow nvarchar(255);
Update dbo.Groceries_dataset Set purchase_year = YEAR(Purchase_date);
Update dbo.Groceries_dataset Set purchase_month = MONTH(purchase_date);
Update dbo.Groceries_dataset Set purchase_day = Day(purchase_date);
Update dbo.Groceries_dataset Set purchase_dow = DATENAME(weekday,purchase_date);
Select item_description, COUNT(item_description) From dbo.Groceries_dataset
Where purchase_year=2014 Group by item_description Order by Count(item_description) Desc;
Select item_description, COUNT(item_description) From dbo.Groceries_dataset
Where purchase_year=2015 Group by item_description Order by Count(item_description) Desc;
Select Purchase_year, COUNT(item_description) From dbo.Groceries_dataset
Group by Purchase_year Order by Count(item_description) Desc;
Select Purchase_month, count(item_description) From dbo.Groceries_dataset
Group by purchase_month order by count(item_description) Desc;
Select Purchase_month, count(item_description) From dbo.Groceries_dataset where purchase_year=2014
Group by purchase_month order by count(item_description) Desc;
Select Purchase_month, count(item_description) From dbo.Groceries_dataset where purchase_year=2015
Group by purchase_month order by count(item_description) Desc;
Select Purchase_day, count(item_description) From dbo.Groceries_dataset
Group by purchase_day order by count(item_description) Desc;
Select Purchase_day, count(item_description) From dbo.Groceries_dataset where purchase_year=2014
Group by purchase_day order by count(item_description) Desc;
Select Purchase_day, count(item_description) From dbo.Groceries_dataset where purchase_year=2015
Group by purchase_day order by count(item_description) Desc;
Select Purchase_dow, count(item_description) From dbo.Groceries_dataset
Group by purchase_dow order by count(item_description) Desc;
Select Purchase_dow, count(item_description) From dbo.Groceries_dataset where purchase_year=2014
Group by purchase_dow order by count(item_description) Desc;
Select Purchase_dow, count(item_description) From dbo.Groceries_dataset where purchase_year=2015
Group by purchase_dow order by count(item_description) Desc;
Select item_number,item_description,CAST(item_price as decimal(10,2)) from dbo.Itemprices;
select member_number, purchase_Date,priceitem.item_description,item_number,
cast(item_price as decimal (10,2)) as purchase_price,purchase_year,purchase_month,purchase_day,purchase_dow
from dbo.Itemprices priceitem
left join dbo.Groceries_dataset groceryitem
on priceitem.item_description = groceryitem.item_description
order by 1,2;
with Grocerysales (member_number,purchase_date,item_description,item_number,purchase_price,
purchase_year,purchase_month,purchase_day,purchase_dow)
as
(select member_number, purchase_Date,priceitem.item_description,item_number,
cast(item_price as decimal (10,2)) as purchase_price,purchase_year,purchase_month,purchase_day,purchase_dow
from dbo.Itemprices priceitem
left join dbo.Groceries_dataset groceryitem
on priceitem.item_description = groceryitem.item_description)

select*from Grocerysales

select purchase_year , sum(purchase_price) from Grocerysales
group by purchase_year;
with Grocerysales (member_number,purchase_date,item_description,item_number,purchase_price,
purchase_year,purchase_month,purchase_day,purchase_dow)
as
(select member_number, purchase_Date,priceitem.item_description,item_number,
cast(item_price as decimal (10,2)) as purchase_price,purchase_year,purchase_month,purchase_day,purchase_dow
from dbo.Itemprices priceitem
left join dbo.Groceries_dataset groceryitem
on priceitem.item_description = groceryitem.item_description)


select purchase_year , sum(purchase_price) from Grocerysales
group by purchase_year;
with Grocerysales (member_number,purchase_date,item_description,item_number,purchase_price,
purchase_year,purchase_month,purchase_day,purchase_dow)
as
(select member_number, purchase_Date,priceitem.item_description,item_number,
cast(item_price as decimal (10,2)) as purchase_price,purchase_year,purchase_month,purchase_day,purchase_dow
from dbo.Itemprices priceitem
left join dbo.Groceries_dataset groceryitem
on priceitem.item_description = groceryitem.item_description)


select purchase_month, sum(purchase_price) as total_sales from Grocerysales
where purchase_year=2014
group by purchase_month
order by 2 desc;
with Grocerysales (member_number,purchase_date,item_description,item_number,purchase_price,
purchase_year,purchase_month,purchase_day,purchase_dow)
as
(select member_number, purchase_Date,priceitem.item_description,item_number,
cast(item_price as decimal (10,2)) as purchase_price,purchase_year,purchase_month,purchase_day,purchase_dow
from dbo.Itemprices priceitem
left join dbo.Groceries_dataset groceryitem
on priceitem.item_description = groceryitem.item_description)

select purchase_dow, sum(purchase_price) as total_sales from Grocerysales
where purchase_year=2015
group by purchase_dow
order by 2 desc;
Create view Grocerysales as
(select member_number, purchase_Date,priceitem.item_description,item_number,
cast(item_price as decimal (10,2)) as purchase_price,purchase_year,purchase_month,purchase_day,purchase_dow
from dbo.Itemprices priceitem
left join dbo.Groceries_dataset groceryitem
on priceitem.item_description = groceryitem.item_description);