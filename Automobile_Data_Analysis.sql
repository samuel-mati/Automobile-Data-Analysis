-- You are tasked with performing a data analysis project to help a used car dealership optimize its 
-- inventory and pricing strategy. The dealership wants to understand the factors that impact car sales, 
-- fuel efficiency, and pricing trends.


-- 1. IDENTIFYING POPULAR CAR FEATURES & TRENDS
-- A. Find the most common car makes and body types in the inventory.
SELECT * FROM automobile_data;
SELECT
 make, count(*) AS Count
FROM
  automobile_data
GROUP BY make
ORDER BY Count DESC
LIMIT 5;

SELECT
 body_style,  count(*) AS Count
FROM
  automobile_data
GROUP BY body_style
ORDER BY Count DESC
LIMIT 5;

-- B. Top-Selling Fuel Types and Body Styles
SELECT 
 fuel_type, body_style, COUNT(*) As count
FROM automobile_data

GROUP BY  fuel_type, body_style
ORDER BY count DESC
LIMIT 10;

-- C. Analyze the relationship between drive wheels (e.g., front-wheel drive, rear-wheel drive) and car types to see which combination is most popular.
SELECT 
drive_wheels, make, COUNT(*) AS count

FROM automobile_data
GROUP BY drive_wheels, make
ORDER BY count DESC
LIMIT 5;

-- 2. PRICING ANALYSIS BASED ON CAR FEATURES
-- A. Analyze how the price varies with different attributes like horsepower, curb weight, and body type.
SELECT 
horsepower, curb_weight, body_style, AVG(price) AS avg_price
FROM automobile_data
GROUP BY horsepower, curb_weight, body_style
ORDER BY avg_price DESC;
-- A relatively high horse_power and curb weight is highly priced. Also, SEDAN cars seem highly priced compared to others

-- B. Identify any correlation between the car's engine type, number of cylinders, and price.
SELECT
engine_type, num_of_cylinders, AVG(price) AS avg_price
FROM automobile_data
GROUP BY engine_type, num_of_cylinders
ORDER BY avg_price DESC;
-- WHEREAS the "OHCV" engine attracts a higher pricing, the number of cylynders does not necessarily have a correlation to pricing

-- C. Explore the effect of the compression ratio on the car's price to identify if cars with higher compression ratios are priced higher.

SELECT 
compression_ratio, AVG(price) AS avg_price
FROM automobile_data
GROUP BY compression_ratio
ORDER BY avg_price DESC;

-- A commpression ration of around 12,22,8 attracts more pricing than the rest.There is not any definite correlation between 
-- compression ratio and price

-- 3. FUEL EFFICIENCY ANALYSIS
-- A. Determine the average city and highway mileage (mpg) for different fuel types.
SELECT
fuel_type,AVG(city_mpg) AS avg_city_mpg, AVG(highway_mpg) AS avg_highway_mpg

FROM automobile_data
GROUP BY fuel_type
ORDER BY avg_city_mpg, avg_highway_mpg DESC;

-- Average city and highway mpgs for gas and diesel cars are 24.69, 30.31 and 30.30, 34.75 respectively

-- B. Identify cars that offer the best fuel efficiency (high city and highway mpg) and compare their prices.
SELECT
make,AVG(city_mpg) AS avg_city_mpg, AVG(highway_mpg) AS avg_highway_mpg, SUM(price) AS total_price
FROM automobile_data

GROUP BY make

ORDER BY total_price DESC;

-- Toyota has the  highest average city and highway MPG and very highly priced WHEREAS mercury has the lowest

-- C. Analyze the impact of engine location (front, rear) on fuel efficiency.
SELECT
engine_location,AVG(city_mpg) AS avg_city_mpg
FROM automobile_data
GROUP BY engine_location
ORDER BY avg_city_mpg DESC;
-- Cars with engine located in the front seem to have a higher average city mpg than the ones in which the engine is located at the rear