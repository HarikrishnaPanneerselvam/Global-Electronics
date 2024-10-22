use dataspark;

*** Query 1: Customer based on Country and Continent
SELECT 
    country, 
    continent, 
    COUNT(customerkey) AS customer_count FROM 
    customers GROUP BY 
    country, 
    continent ORDER BY 
    continent, 
    country;
 
*** Query 2: Customer age group
SELECT 
    CASE 
        WHEN age BETWEEN 0 AND 18 THEN '0-18'
        WHEN age BETWEEN 19 AND 25 THEN '19-25'
        WHEN age BETWEEN 26 AND 36 THEN '26-36'
        WHEN age BETWEEN 37 AND 48 THEN '37-48'
        WHEN age BETWEEN 49 AND 59 THEN '49-59'
        ELSE '60 and above'
    END AS age_group,
    COUNT(customerkey) AS customer_count FROM 
    customers GROUP BY 
    age_group ORDER BY 
    age_group;
    
    
*** Query 3: Which gender have more sales
SELECT 
    c.country,
    COUNT(CASE WHEN c.gender = 'Male' THEN 1 END) AS male_count,
    COUNT(CASE WHEN c.gender = 'Female' THEN 1 END) AS female_count FROM 
    customers c
JOIN 
    sales s ON c.customerkey = s.customerkey GROUP BY 
    c.country
ORDER BY 
    c.country;
    
*** Query 4: Which date have more exchange happens
SELECT 
    date,
    sum(exchange) AS exchange_count
FROM 
    exchange
GROUP BY 
    date
ORDER BY 
    date DESC;

*** Query 5: Customer sales based on year and countries
SELECT 
    c.country,
    COUNT(s.customerkey) AS customer_count
FROM 
    customers c
JOIN 
    sales s ON c.customerkey = s.customerkey
GROUP BY 
    c.country
ORDER BY 
    customer_count DESC;

*** Query 6: Whcih color have more sales
SELECT 
    p.color,
    COUNT(s.productkey) AS color_count
FROM 
    products p
JOIN 
    sales s ON p.productkey = s.productkey
GROUP BY 
    p.color
ORDER BY 
    color_count DESC;

*** Query 7: Which Country have more sales
SELECT 
    s.country,
    COUNT(s.storekey) AS store_count
FROM 
    stores s
GROUP BY 
    s.country
ORDER BY 
    store_count DESC;

*** Query 8: Which currency have more exchanges
SELECT 
    currency,
    SUM(exchange) AS total_exchange
FROM 
    exchange
GROUP BY 
    currency
ORDER BY 
    total_exchange DESC;
    
*** Query 9: which countrh have more squre_meters
SELECT country, SUM(square_meters) AS total_square_meters
FROM stores
GROUP BY country
ORDER BY total_square_meters DESC;

*** Query 10: Which category have more stores
SELECT p.subcategory, COUNT(s.productkey) AS sales_count
FROM products p
JOIN sales s ON p.productkey = s.productkey
GROUP BY p.subcategory
ORDER BY sales_count DESC;


