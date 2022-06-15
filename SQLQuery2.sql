Select*From dbo.Groceries_dataset;
Select member_number from dbo.Groceries_dataset where member_number IS NULL;
Select purchase_Date from dbo.Groceries_dataset where purchase_Date IS NULL;
Select item_description from dbo.Groceries_dataset where item_description IS NULL;
select COUNT(member_number) from dbo.Groceries_dataset;
select COUNT(Distinct member_number) from dbo.Groceries_dataset;
select COUNT(Distinct item_description) from dbo.Groceries_dataset;
select MAX(purchase_Date) from dbo.Groceries_dataset;
select MIN(purchase_Date) from dbo.Groceries_dataset;