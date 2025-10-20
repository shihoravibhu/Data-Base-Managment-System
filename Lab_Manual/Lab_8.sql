USE CSE_A4_177

CREATE TABLE SALES_DATA (
    Region VARCHAR(50),
    Product VARCHAR(50),
    Sales_Amount INT,
    Year INT
);

INSERT INTO SALES_DATA (Region, Product, Sales_Amount, Year) VALUES
('North America', 'Watch', 1500, 2023),
('Europe', 'Mobile', 1200, 2023),
('Asia', 'Watch', 1800, 2023),
('North America', 'TV', 900, 2024),
('Europe', 'Watch', 2000, 2024),
('Asia', 'Mobile', 1000, 2024),
('North America', 'Mobile', 1600, 2023),
('Europe', 'TV', 1500, 2023),
('Asia', 'TV', 1100, 2024),
('North America', 'Watch', 1700, 2024);


-- Part � A: 

-- 1. Display Total Sales Amount by Region. 
    
     SELECT REGION,SUM(Sales_Amount) AS TOTAL_SALES
     FROM SALES_DATA
     GROUP BY REGION

-- 2. Display Average Sales Amount by Product 
    
    SELECT PRODUCT , AVG(Sales_Amount)
    FROM SALES_DATA
    GROUP BY PRODUCT
    
-- 3. Display Maximum Sales Amount by Year 

    SELECT YEAR,MAX(Sales_Amount) AS MAX_SALES
    FROM SALES_DATA
    GROUP BY YEAR
    
-- 4. Display Minimum Sales Amount by Region and Year 
    
    SELECT REGION,YEAR,MIN(Sales_Amount) AS MIN_SALES
    FROM SALES_DATA
    GROUP BY REGION,YEAR
    
-- 5. Count of Products Sold by Region

    SELECT REGION,COUNT(PRODUCT) AS PRODUCT
    FROM SALES_DATA
    GROUP BY REGION
       
-- 6. Display Sales Amount by Year and Product 

    SELECT YEAR , PRODUCT , SUM(Sales_Amount) AS SUM
    FROM SALES_DATA
    GROUP BY YEAR , PRODUCT    

-- 7. Display Regions with Total Sales Greater Than 5000
    
    SELECT REGION , SUM(SALES_AMOUNT) AS SUM
    FROM SALES_DATA
    GROUP BY REGION
    HAVING SUM(SALES_AMOUNT)>5000

-- 8. Display Products with Average Sales Less Than 10000 
    
    SELECT PRODUCT , AVG(SALES_AMOUNT) AS AVG
    FROM SALES_DATA
    GROUP BY PRODUCT
    HAVING AVG(SALES_AMOUNT) < 10000

-- 9. Display Years with Maximum Sales Exceeding 500 
    
    SELECT YEAR , MAX(SALES_AMOUNT)
    FROM SALES_DATA 
    GROUP BY YEAR
    HAVING MAX(SALES_AMOUNT) > 500

-- 10. Display Regions with at Least 3 Distinct Products Sold. 
    
    SELECT REGION , COUNT (DISTINCT PRODUCT) AS COUNT
    FROM SALES_DATA
    GROUP BY REGION
    HAVING COUNT (DISTINCT PRODUCT) > 2

-- 11. Display Years with Minimum Sales Less Than 1000 
    
    SELECT YEAR , MIN(SALES_AMOUNT) AS AMOUNT
    FROM SALES_DATA
    GROUP BY YEAR
    HAVING MIN(SALES_AMOUNT) < 1000

-- 12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount 

    SELECT REGION , SUM(SALES_AMOUNT) AS TOTAL
    FROM SALES_DATA
    WHERE YEAR = '2023'
    GROUP BY REGION 
    ORDER BY SUM(SALES_AMOUNT)

-- 13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years. 
    
    SELECT TOP 1 REGION , SUM(SALES_AMOUNT) AS LOWEST
    FROM SALES_DATA
    WHERE PRODUCT = 'MOBILE'
    GROUP BY REGION
    ORDER BY SUM(SALES_AMOUNT)


-- 14. Find the Product with the Highest Sales Across All Regions in 2023. 
    
    SELECT TOP 1 PRODUCT, SUM(SALES_AMOUNT) AS HIGHEST
    FROM SALES_DATA
    WHERE YEAR = 2023
    GROUP BY PRODUCT
    ORDER BY SUM(SALES_AMOUNT) DESC


-- 15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000. 

    SELECT REGION , SUM(SALES_AMOUNT) AS TOTAL_AMOUNT
    FROM SALES_DATA
    WHERE PRODUCT = 'TV' AND YEAR = '2023'
    GROUP BY REGION
    HAVING SUM(SALES_AMOUNT) > 1000
    

-- Part � B: 

-- 1. Display Count of Orders by Year and Region, Sorted by Year and Region 
    
    SELECT YEAR ,REGION,COUNT(*) AS ORDER_COUNT
    FROM SALES_DATA
    GROUP BY YEAR,REGION
    ORDER BY YEAR,REGION

-- 2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region 
    
    SELECT REGION ,YEAR, MAX(SALES_AMOUNT) AS MAX
    FROM SALES_DATA    
    GROUP BY REGION  , YEAR
    HAVING MAX(SALES_AMOUNT) > 1000
    ORDER BY REGION

-- 3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending 

    SELECT YEAR , SUM(SALES_AMOUNT) AS TOTAL_SALES
    FROM SALES_DATA
    GROUP BY YEAR
    HAVING SUM(SALES_AMOUNT) < 10000
    ORDER BY YEAR DESC

-- 4. Display Top 3 Regions by Total Sales Amount in Year 2024 
    
    SELECT TOP 3 REGION , SUM(SALES_AMOUNT) AS TOTAL_SALES
    FROM SALES_DATA
    WHERE YEAR = 2024
    GROUP BY REGION
    ORDER BY SUM(SALES_AMOUNT) DESC


    
-- 5. Find the Year with the Lowest Total Sales Across All Regions. 
    
    SELECT TOP 1 YEAR , SUM(SALES_AMOUNT)
    FROM SALES_DATA
    GROUP BY YEAR
    ORDER BY SUM(SALES_AMOUNT)



-- Part � C: 


-- 1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name 

    SELECT PRODUCT, AVG(SALES_AMOUNT) AS AVG
    FROM SALES_DATA
    GROUP BY PRODUCT
    HAVING AVG(SALES_AMOUNT) BETWEEN 1000 AND 2000
    ORDER BY PRODUCT;

-- 2. Display Years with More Than 1 Orders from Each Region 
    
    SELECT YEAR , REGION , COUNT(*)
    FROM SALES_DATA
    GROUP BY YEAR , REGION  
    HAVING COUNT(*) > 1

-- 3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending. 
    
    SELECT REGION , AVG(SALES_AMOUNT) AS AVG 
    FROM SALES_DATA
    WHERE YEAR = 2023
    GROUP BY REGION 
    HAVING  AVG(SALES_AMOUNT) > 1500
    ORDER BY  AVG(SALES_AMOUNT) DESC


-- 4. Find out region wise duplicate product. 
    
    SELECT REGION , PRODUCT , COUNT(*) AS DUPLICATE_PRODUCT
    FROM SALES_DATA
    GROUP BY REGION , PRODUCT
    HAVING COUNT(*) > 1

--5. Find out year wise duplicate product. 

    SELECT YEAR , PRODUCT , COUNT(*) AS DUPLICATE_PRODUCT
    FROM SALES_DATA
    GROUP BY YEAR , PRODUCT
    HAVING COUNT(*) > 1
