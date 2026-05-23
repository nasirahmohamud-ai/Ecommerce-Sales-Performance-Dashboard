CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

CREATE TABLE orders( 
	`Order ID` VARCHAR(20),
    `Date` DATE,
    `CustomerID` VARCHAR(100),
    `Product` VARCHAR(100),
    `Quantity` INT,
    `UnitPrice` DECIMAL(10,2),
    `ShippingAddress` VARCHAR(100),
    `PaymentMethod` VARCHAR(100),
    `OrderStatus` VARCHAR(100),
    `TrackingNumber` VARCHAR(100),
    `ItemsInCart` INT,
    `CouponCode` VARCHAR(100),
	`ReferralSource` VARCHAR(100),
    `TotalPrice` DECIMAL(10,2)
    );
    
-- Which products generated the highest revenue? 
SELECT `Product`,
	SUM(`TotalPrice`) AS Total_revenue
FROM orders
Group by `Product`
ORDER BY TotaL_revenue DESC;


-- Which payment method contribute the highest total sales?     
SELECT `Product`, SUM(`TotalPrice`) AS Total_revenue
FROM orders
GROUP BY `Product`
ORDER BY Total_revenue DESC;

-- Which refferral sources bring in the most revenue? 
SELECT `ReferralSource`,
	SUM(`TotalPrice`) AS Total_revenue
FROM orders
GROUP BY `ReferralSource`
ORDER BY Total_revenue DESC;

 -- Which order statuses occur most frequently?
 SELECT `OrderStatus`,
	COUNT(*) AS Total_orders
 FROM orders
 GROUP BY `OrderStatus`
 ORDER BY Total_orders DESC;
 
 -- Average order values
 SELECT AVG(`TotalPrice`) AS average_order_value
 FROM orders;
 
 
 -- Which customers generated the highest revenue?
 SELECT `CustomerID`,
	SUM(`TotalPrice`) AS Total_revenue
FROM orders 
GROUP BY `CustomerID`
ORDER BY Total_revenue DESC;


-- Do customers using coupon codes generate, 
-- more revenue than those without coupons?
SELECT `CouponCode`,
	SUM(`TotalPrice`) AS Total_revenue
FROM orders
GROUP BY `CouponCode`
ORDER BY Total_revenue DESC;

-- Which products generated the highest revenue among only delivered orders?
SELECT `Product`, `OrderStatus`,
	SUM(`TotalPrice`) AS Total_revenue
FROM orders
WHERE `OrderStatus`= 'Delivered'
GROUP BY `Product`
ORDER BY Total_revenue DESC;


