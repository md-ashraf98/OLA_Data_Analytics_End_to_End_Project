------------Table Creation------------------
CREATE TABLE ola (
    "Date"                       TIMESTAMP,
    "Time"                       TIME,
    "Booking_ID"                 VARCHAR(20) PRIMARY KEY,
    "Booking_Status"             VARCHAR(30),
    "Customer_ID"                VARCHAR(20),
    "Vehicle_Type"               VARCHAR(30),
    "Pickup_Location"            VARCHAR(50),
    "Drop_Location"              VARCHAR(50),
    "V_TAT"                      INTEGER,
    "C_TAT"                      INTEGER,
    "Canceled_Rides_by_Customer" VARCHAR(100),
    "Canceled_Rides_by_Driver"   VARCHAR(100),
    "Incomplete_Rides"           VARCHAR(10),
    "Incomplete_Rides_Reason"    VARCHAR(50),
    "Booking_Value"              INTEGER,
    "Payment_Method"             VARCHAR(30),
    "Ride_Distance"              INTEGER,
    "Driver_Ratings"             NUMERIC(2,1),
    "Customer_Rating"            NUMERIC(2,1),
    "Vehicle Images"             VARCHAR(200)
);

----------------Data Exploration-----------------
----Display the Number of rows in data 
select count(*) from ola;

----Display the first ten rows of ola table
select * from ola limit 20;

----Display the last ten rows of ola table
select * from ola 


-----------------Data Analysis-------------------
----1. Retrieve all successfull bookings
select * from ola 
where "Booking_Status"='Success';

----Total Number of Successfull bookings by Customers 
select count("Customer_ID") from ola
where "Booking_Status"='Success';


---2.Calculate Average Ride Distance for each Vehicle Type
select "Vehicle_Type", avg("Ride_Distance") as "Avg_Distance"
from ola
group by "Vehicle_Type"
order by avg("Ride_Distance");

---3. Get the Total Number Cancel Ride by Customers.
select count("Customer_ID") as "Customer_Cancellation"
from ola
where "Booking_Status"='Canceled by Customer';

----4. List the top 5 customers who booked the higest number of rides
select "Customer_ID", count("Booking_ID") as "Higest_Number_of_Rides"
from ola
group by "Customer_ID"
order by count("Booking_ID") desc limit 5;

----5. Get the Number of rides canceled by drivers due to personal and Car related issues.
select "Canceled_Rides_by_Driver", count("Customer_ID") as "Canceled_Rides"
from ola
group by "Canceled_Rides_by_Driver"
having "Canceled_Rides_by_Driver"='Personal & Car related issue';

---6. Find the maximum and minimum driver ratings for Prime Sedan Bookings
select "Vehicle_Type", max("Driver_Ratings") as "Maxium_Driver_Ratings", min("Driver_Ratings") as "Minimum_Driver_Ratings"
from ola
where "Vehicle_Type"='Prime Sedan'
group by "Vehicle_Type";

----7.Retrive all the rides where payment was made using UPI
select "Payment_Method", count("Booking_ID") as "Total_rides"
from ola
group by "Payment_Method"
having "Payment_Method"='UPI';

----8. Find the Average customer rating per Vehcile Type
select distinct "Vehicle_Type", avg("Customer_Rating") as "Avg_Customer_Ratings"
from ola
group by "Vehicle_Type"
order by avg("Customer_Rating");

----9. Calculate the total booking value of rides completed successfully
select sum("Booking_Value") as "Total Booking Value"
from ola
where "Booking_Status"='Success';

----10. List all incomplete rides along with the reason
select "Incomplete_Rides","Incomplete_Rides_Reason"
from ola
where "Incomplete_Rides"='Yes' 