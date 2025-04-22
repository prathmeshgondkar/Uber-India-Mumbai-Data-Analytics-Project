-- 1. Create and use the database
CREATE DATABASE Uber;
USE Uber;

-- 2. Create a view for successful bookings
CREATE VIEW Successful_Bookings AS
SELECT * FROM bookings
WHERE Booking_Status = 'Success';

-- 3. Retrieve all successful bookings
SELECT * FROM Successful_Bookings;

-- 4. Average ride distance for each vehicle type
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;

-- 5. Total number of cancelled rides by customers
SELECT COUNT(*) AS cancelled_by_customer
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

-- 6. Top 5 customers with highest ride count
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

-- 7. Rides cancelled by drivers due to personal & car issues
SELECT COUNT(*) AS driver_cancel_personal_car
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 8. Max and min driver ratings for Prime Sedan
SELECT MAX(Driver_Ratings) AS max_rating,
       MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

-- 9. All rides where payment method was UPI
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';

-- 10. Average customer rating per vehicle type
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

-- 11. Total booking value for successful rides
SELECT SUM(Booking_Value) AS total_successful_value
FROM bookings
WHERE Booking_Status = 'Success';

-- 12. All incomplete rides with reasons
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';