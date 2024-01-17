SELECT 
ord.order_id,
CONCAT(cus.first_name,' ',cus.last_name) AS FULL_NAME,
cus.city,
cus.state,
ord.order_date,
sum(ort.quantity) AS total_unit,
sum(ort.quantity * ort.list_price) AS revenue,
pro.product_name,
pro_c.category_name,
stor.store_name,
brands.brand_name,
CONCAT(staf.first_name,' ',staf.last_name) AS staff_name
FROM sales.orders ord
JOIN Sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ort
ON ord.order_id = ort.order_id
JOIN production.products pro
ON ort.product_id = pro.product_id
JOIN production.categories pro_c
ON pro.category_id = pro_c.category_id
JOIN sales.stores stor
ON ord.store_id = stor.store_id
JOIN sales.staffs staf
ON ord.staff_id = staf.staff_id
JOIN production.brands brands
ON pro.brand_id = brands.brand_id
GROUP BY
ord.order_id,
CONCAT(cus.first_name,' ',cus.last_name),
cus.city,
cus.state,
product_name,
pro_c.category_name,
stor.store_name,
CONCAT(staf.first_name,' ',staf.last_name),
ord.order_date


SELECT *
FROM production.brands