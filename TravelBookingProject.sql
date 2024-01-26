create database TravelBooking;
use TravelBooking;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    UNIQUE(Email)
);

-- Flights Table
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    Airline VARCHAR(50),
    DepartureAirport VARCHAR(3),
    DestinationAirport VARCHAR(3),
    DepartureDateTime DATETIME,
    ArrivalDateTime DATETIME,
    AvailableSeats INT,
    TicketPrice DECIMAL(10, 2),
    CHECK (AvailableSeats >= 0)
);

-- Hotels Table
CREATE TABLE Hotels (
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(100),
    Location VARCHAR(100),
    CheckInDateTime DATETIME,
    CheckOutDateTime DATETIME,
    AvailableRooms INT,
    RoomRate DECIMAL(10, 2),
    CHECK (AvailableRooms >= 0)
);

-- Cabs Table
CREATE TABLE Cabs (
    CabID INT PRIMARY KEY,
    CabProvider VARCHAR(50),
    PickUpLocation VARCHAR(100),
    DropOffLocation VARCHAR(100),
    DepartureDateTime DATETIME,
    AvailableSeats INT,
    Fare DECIMAL(10, 2),
    CHECK (AvailableSeats >= 0)
);

-- Bookings Table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    BookingType VARCHAR(10), -- 'Flight', 'Hotel', or 'Cab'
    BookingItemID INT, -- References FlightID, HotelID, or CabID based on BookingType
    BookingDateTime DATETIME,
    TotalCost DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (BookingItemID) REFERENCES Flights(FlightID) ON DELETE CASCADE,
    FOREIGN KEY (BookingItemID) REFERENCES Hotels(HotelID) ON DELETE CASCADE,
    FOREIGN KEY (BookingItemID) REFERENCES Cabs(CabID) ON DELETE CASCADE
);

-- Itineraries Table
CREATE TABLE Itineraries (
    ItineraryID INT PRIMARY KEY,
    CustomerID INT,
    FlightBookingID INT,
    HotelBookingID INT,
    CabBookingID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (FlightBookingID) REFERENCES Bookings(BookingID) ON DELETE CASCADE,
    FOREIGN KEY (HotelBookingID) REFERENCES Bookings(BookingID) ON DELETE CASCADE,
    FOREIGN KEY (CabBookingID) REFERENCES Bookings(BookingID) ON DELETE CASCADE
);


INSERT INTO Customers VALUES
    (1, 'Raj', 'Kumar', 'raj@example.com', '987-654-3210'),
    (2, 'Priya', 'Sharma', 'priya@example.com', '987-654-3210'),
    (3, 'Amit', 'Verma', 'amit@example.com', '987-654-3210'),
    (4, 'Neha', 'Singh', 'neha@example.com', '987-654-3210'),
    (5, 'Rahul', 'Patel', 'rahul@example.com', '987-654-3210'),
    (6, 'Anjali', 'Gupta', 'anjali@example.com', '987-654-3210'),
    (7, 'Sandeep', 'Yadav', 'sandeep@example.com', '987-654-3210'),
    (8, 'Pooja', 'Joshi', 'pooja@example.com', '987-654-3210'),
    (9, 'Vikram', 'Kumar', 'vikram@example.com', '987-654-3210'),
    (10, 'Sonia', 'Yadav', 'sonia@example.com', '987-654-3210');
select * from Customers;

INSERT INTO Flights VALUES
    (1, 'IndiAir', 'DEL', 'BOM', '2023-01-01 12:00:00', '2023-01-01 18:00:00', 100, 200.00),
    (2, 'SpiceJet', 'BOM', 'DEL', '2023-01-02 14:00:00', '2023-01-02 20:00:00', 120, 220.00),
    (3, 'Air India', 'DEL', 'MAA', '2023-01-03 10:00:00', '2023-01-03 14:00:00', 80, 180.00),
    (4, 'GoAir', 'MAA', 'BOM', '2023-01-04 13:00:00', '2023-01-04 17:00:00', 90, 190.00),
    (5, 'Vistara', 'DEL', 'MAA', '2023-01-05 11:00:00', '2023-01-05 17:00:00', 110, 250.00),
    (6, 'AirAsia', 'BOM', 'DEL', '2023-01-06 09:00:00', '2023-01-06 13:00:00', 85, 200.00),
    (7, 'GoIndigo', 'MAA', 'BOM', '2023-01-07 15:00:00', '2023-01-07 21:00:00', 95, 230.00),
    (8, 'SpiceJet', 'BOM', 'DEL', '2023-01-08 08:00:00', '2023-01-08 12:00:00', 75, 180.00),
    (9, 'IndiAir', 'DEL', 'MAA', '2023-01-09 16:00:00', '2023-01-09 22:00:00', 105, 240.00),
    (10, 'Vistara', 'MAA', 'DEL', '2023-01-10 17:00:00', '2023-01-10 23:00:00', 88, 210.00);
select * from Flights;   
    
INSERT INTO Hotels VALUES
    (1, 'Taj Mahal Hotel', 'Delhi', '2023-01-01 14:00:00', '2023-01-03 12:00:00', 50, 150.00),
    (2, 'Mumbai Grand Hotel', 'Mumbai', '2023-01-02 16:00:00', '2023-01-04 10:00:00', 40, 180.00),
    (3, 'Chennai Serenity Inn', 'Chennai', '2023-01-03 12:00:00', '2023-01-05 11:00:00', 60, 160.00),
    (4, 'Delightful Delhi Inn', 'Delhi', '2023-01-04 15:00:00', '2023-01-06 09:00:00', 55, 170.00),
    (5, 'Elegant Enclave, Mumbai', 'Mumbai', '2023-01-05 13:00:00', '2023-01-07 14:00:00', 70, 200.00),
    (6, 'Fragrant Forest Retreat, Chennai', 'Chennai', '2023-01-06 11:00:00', '2023-01-08 15:00:00', 45, 190.00),
    (7, 'Garden View, Goa', 'Goa', '2023-01-07 10:00:00', '2023-01-09 13:00:00', 65, 220.00),
    (8, 'Heavenly Hills, Shimla', 'Shimla', '2023-01-08 09:00:00', '2023-01-10 12:00:00', 75, 230.00),
    (9, 'Idyllic Inn, Agra', 'Agra', '2023-01-09 16:00:00', '2023-01-11 14:00:00', 80, 250.00),
    (10, 'Jaipur Royal Residency', 'Jaipur', '2023-01-10 12:00:00', '2023-01-12 11:00:00', 55, 180.00);
 select * from Hotels;   
    
INSERT INTO Cabs VALUES
    (1, 'Ola Cabs', 'Delhi', 'Mumbai', '2023-01-01 15:00:00', 4, 50.00),
    (2, 'Uber', 'Mumbai', 'Delhi', '2023-01-02 10:00:00', 3, 40.00),
    (3, 'Meru Cabs', 'Chennai', 'Bangalore', '2023-01-03 12:00:00', 5, 60.00),
    (4, 'Fasttrack Cabs', 'Bangalore', 'Hyderabad', '2023-01-04 11:00:00', 2, 45.00),
    (5, 'Mega Cabs', 'Hyderabad', 'Kolkata', '2023-01-05 14:00:00', 3, 55.00),
    (6, 'Easy Cabs', 'Kolkata', 'Pune', '2023-01-06 09:00:00', 4, 65.00),
    (7, 'Goa Taxi', 'Goa', 'Jaipur', '2023-01-07 17:00:00', 5, 70.00),
    (8, 'Shimla Cabs', 'Shimla', 'Agra', '2023-01-08 13:00:00', 3, 55.00),
    (9, 'Agra Taxi', 'Agra', 'Lucknow', '2023-01-09 14:00:00', 4, 60.00),
    (10, 'Jaipur Car Rentals', 'Jaipur', 'Delhi', '2023-01-10 16:00:00', 2, 45.00);
select * from Cabs;

INSERT INTO Bookings VALUES
    (1, 1, 'Flight', 1, '2023-01-01 10:00:00', 200.00),
    (2, 2, 'Hotel', 2, '2023-01-02 11:00:00', 180.00),
    (3, 1, 'Cab', 1, '2023-01-03 12:00:00', 50.00),
    (4, 3, 'Flight', 3, '2023-01-04 14:00:00', 180.00),
    (5, 4, 'Hotel', 4, '2023-01-05 16:00:00', 200.00),
    (6, 2, 'Cab', 2, '2023-01-06 13:00:00', 40.00),
    (7, 5, 'Flight', 5, '2023-01-07 15:00:00', 250.00),
    (8, 6, 'Hotel', 6, '2023-01-08 18:00:00', 190.00),
    (9, 3, 'Cab', 3, '2023-01-09 10:00:00', 60.00),
    (10, 7, 'Flight', 7, '2023-01-10 12:00:00', 230.00);
select * from Bookings;
    
INSERT INTO Itineraries VALUES
    (1, 1, 1, 2, 3),
    (2, 2, NULL, 2, NULL),
    (3, 3, 4, 5, 6),
    (4, 4, NULL, 8, 9),
    (5, 5, 10, NULL, NULL),
    (6, 6, 3, 6, 2),
    (7, 7, NULL, 7, NULL),
    (8, 8, 2, NULL, 8),
    (9, 9, 5, 9, 4),
    (10, 10, NULL, 10, NULL);
select * from Itineraries;


/*Retrieve customers who have made bookings, along with the total spending and the most expensive booking:*/


SELECT
    Customers.*,
    COALESCE(SUM(Bookings.TotalCost), 0) AS TotalSpending,
    MAX(Bookings.TotalCost) AS MaxBookingCost
FROM Customers
LEFT JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID
GROUP BY Customers.CustomerID;



-- Retrieve flights with the highest ticket price
SELECT *
FROM Flights
WHERE TicketPrice = (SELECT MAX(TicketPrice) FROM Flights);


-- Retrieve hotels with available rooms > 60 and order by room rate in descending order
SELECT *
FROM Hotels
WHERE AvailableRooms > 60
ORDER BY RoomRate DESC;


/*The query retrieves information from the Itineraries table along with related details from the Customers, Bookings, Flights, Hotels, and Cabs tables. */
SELECT
    I.ItineraryID,
    C.FirstName,
    C.LastName,
    F.Airline,
    H.HotelName,
    CB.CabProvider
FROM
    Itineraries I
JOIN Customers C ON I.CustomerID = C.CustomerID
LEFT JOIN Bookings Bf ON I.FlightBookingID = Bf.BookingID
LEFT JOIN Flights F ON Bf.BookingItemID = F.FlightID
LEFT JOIN Bookings Bh ON I.HotelBookingID = Bh.BookingID
LEFT JOIN Hotels H ON Bh.BookingItemID = H.HotelID
LEFT JOIN Bookings Bc ON I.CabBookingID = Bc.BookingID
LEFT JOIN Cabs CB ON Bc.BookingItemID = CB.CabID;


