use classicmodels;

select * from products;

/* To check how many customers per country. */
select country, count(customerNumber) Total_Customer from customers group by country order by Total_Customer DESC;

/* To check Total customers per continent using case expression. */
SELECT 
    CASE 
        WHEN country in ("France", "Spain", "Belgium", "Netherlands", "Poland", "Portugal", "Austria",
                        "Sweden", "Finland", "Norway", "Switzerland", "Italy", "UK", "Germany") THEN "Europe"
        WHEN country in ("USA") THEN "USA"
        ELSE "Others" 
        END AS Continent, 
    COUNT(DISTINCT customerNumber) AS total_customers 
FROM customers 
GROUP BY Continent
ORDER BY total_customers DESC;

SELECT * FROM orderdetails;

/* Query to find the total no. of orders*/
select count(*) from orderdetails;

/*Query to find the total no. of orders*/
select count(*) from employees;

/*Query to find the total no. of customers*/
select count(*) from customers;

/* Query to find the total sale */
select sum(priceEach*quantityOrdered) Total_sale from orderdetails;

/* Query to find the total sale based on country*/
select country,sum(priceEach*quantityOrdered) Total_sale from orderdetails o 
inner join orders od on o.orderNumber = od.orderNumber join customers c on
od.customerNumber = c.customerNumber group by country order by Total_sale DESC limit 5;

/*join the two table for further analysis*/
SELECT * 
FROM orders AS o
INNER JOIN orderdetails AS od USING (orderNumber);

/* Query to find the average shipment days*/
SELECT 
    productCode,
    ROUND(AVG((shippedDate) - (orderDate)),0) AS Avg_days_to_ship
FROM orders AS o
INNER JOIN orderdetails AS od 
USING (orderNumber)
GROUP BY productCode
ORDER BY Avg_days_to_ship DESC;

SELECT 
    productCode,
    ROUND(AVG(priceEach),2) AS Avg_product_price
FROM orders AS o
INNER JOIN orderdetails AS od 
USING (orderNumber)
GROUP BY productCode
ORDER BY Avg_product_price DESC;

/*#Query to check the avg price of each product*/
SELECT 
    productCode,
    ROUND(priceEach*quantityOrdered,2) AS Product_total_sales
FROM orders AS o
INNER JOIN orderdetails AS od 
USING (orderNumber)
GROUP BY productCode
ORDER BY Product_total_sales DESC
LIMIT 5;