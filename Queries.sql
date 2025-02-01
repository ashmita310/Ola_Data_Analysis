CREATE DATABASE OLA;
USE OLA;

# 1. retrieve all the successfull bookings

CREATE VIEW Successfull_Bookings AS
SELECT * FROM Bookings WHERE Booking_Status = "SUCCESS";

SELECT * FROM Successfull_Bookings;

# 2. find the average ride distance of each vehicle types

CREATE VIEW Avg_Ride_Distance AS
SELECT Vehicle_Type , AVG(Ride_distance) AS Avg_Distance 
FROM Bookings GROUP BY Vehicle_Type;

SELECT * FROM Avg_Ride_Distance;

# 3. get the total number of canceled rides by customers

CREATE VIEW Canceled_Rides_by_Customer AS
SELECT COUNT(*) FROM Bookings 
WHERE Booking_Status = "Canceled by Customer";

SELECT * FROM Canceled_Rides_by_Customer;

# 4. List the top 5 customers who booked the highest number of rides:

CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) as TOTAL_RIDES 
FROM Bookings GROUP BY Customer_ID
ORDER BY TOTAL_RIDES DESC LIMIT 5;

SELECT * FROM Top_5_Customers;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

CREATE VIEW Canceled_due_to_personal_issues AS
SELECT COUNT(*) FROM Bookings 
WHERE Canceled_Rides_by_Driver = "Personal & Car related issue";

SELECT * FROM Canceled_due_to_personal_issues;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW Ratings AS
SELECT MAX(Driver_Ratings) AS Max_Rating, 
MIN(Driver_Ratings) AS Min_Rating
FROM Bookings WHERE Vehicle_Type="Prime Sedan";

SELECT * FROM Ratings;

# 7. Retrieve all rides where payment was made using UPI:

CREATE VIEW UPI_Rides AS
SELECT * FROM Bookings WHERE Payment_Method = "UPI";

SELECT * FROM UPI_Rides;

# 8. Find the average customer rating per vehicle type:

CREATE VIEW Avg_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS Avg_Customer_Rating 
FROM Bookings 
GROUP BY Vehicle_Type;

SELECT * FROM Avg_Rating ;

# 9. Calculate the total booking value of rides completed successfully:

CREATE VIEW Total_Successful_Value AS
SELECT SUM(Booking_Value) AS Total_Successfull_Bookings 
FROM Bookings
WHERE Booking_Status = "Success";

SELECT * FROM Total_Successful_Value ;

# 10. List all incomplete rides along with the reason:

CREATE VIEW Incomplete_Rides AS
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM Bookings 
WHERE Incomplete_Rides ="Yes";

SELECT * FROM Incomplete_Rides;