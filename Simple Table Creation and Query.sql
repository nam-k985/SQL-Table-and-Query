
-- Table Creation

CREATE TABLE Promotion (
    PromoID CHAR(3) NOT NULL,
    PromoName VARCHAR(50) NOT NULL,
    PromoDiscount DECIMAL(4,1) NOT NULL,
    PRIMARY KEY (PromoID)
);

CREATE TABLE Category (
    CategoryID CHAR(5) NOT NULL,
    CategoryName VARCHAR(50) NOT NULL,
    CategoryDesc VARCHAR(200) NOT NULL,
    PRIMARY KEY (CategoryID)
);

CREATE TABLE Chocolate (
    ChocolateID CHAR(6) NOT NULL,
    ChocolateName VARCHAR(50) NOT NULL,
    ChocolateDesc VARCHAR(200) NOT NULL,
    ChocolatePrice DECIMAL (5, 2) NOT NULL,
    ChocolateWeight INT NOT NULL,
    CategoryID CHAR(5) NOT NULL,
    PRIMARY KEY (ChocolateID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Discount (
    PromotionID CHAR(3) NOT NULL,
    ChocolateID CHAR(6) NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    PRIMARY KEY (PromotionID, ChocolateID),
    FOREIGN KEY (PromotionID) REFERENCES Promotion(PromoID),
    FOREIGN KEY (ChocolateID) REFERENCES Chocolate(ChocolateID)
);

CREATE TABLE Customer (
    CustomerID CHAR(6) NOT NULL,
    CustomerName VARCHAR(70) NOT NULL,
    CustomerEmail VARCHAR(100) NOT NULL,
    CustomerPhNum VARCHAR(32) NOT NULL,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Review (
    ReviewID CHAR(6) NOT NULL,
    ReviewRating DECIMAL (2,0) NOT NULL,
    ReviewComment VARCHAR(255) NOT NULL,
    ReviewDate DATETIME NOT NULL,
    CustomerID CHAR(6) NULL,
    ChocolateID CHAR(6) NOT NULL,
    PRIMARY KEY (ReviewID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ChocolateID) REFERENCES Chocolate(ChocolateID)
);

-- Please ensure you INSERT atleast 5 records for every table and add it below
INSERT INTO Promotion VALUES
    ('P01', "Opening Sale", 50.0),
    ('P02', "Summer Discount", 30.0),
    ('P03', "Holiday Special", 40.0),
    ('P04', "End of Season Sale", 25.0),
    ('P05', "Exclusive Member Discount", 20.0);

INSERT INTO Category VALUES
    ('CAT01', "Ecuador Single Origin", "Cocoa beans from a single Ecuadorian source"),
    ('CAT02', "Venezuelan Single Origin", "Premium cocoa from Venezuela"),
    ('CAT03', "Mixed Origin", "A blend of multiple cocoa sources"),
    ('CAT04', "Single Bean Origin", "Single type of cocoa bean"),
    ('CAT05', "Special Reserve", "Limited edition, rare origin beans");

INSERT INTO Chocolate VALUES
    ('CHOC13', "Dark Chocolate Tablet", "Small, bite-sized dark chocolate tablets", 17.99, 80, 'CAT01'),
    ('CHOC14', "Milk Chocolate Bar", "Rich, creamy milk chocolate", 12.99, 100, 'CAT02'),
    ('CHOC15', "White Chocolate Tablet", "Sweet, creamy white chocolate", 15.99, 90, 'CAT03'),
    ('CHOC16', "Spicy Dark Chocolate", "Dark chocolate with a spicy kick", 18.99, 85, 'CAT04'),
    ('CHOC17', "Fruit and Nut Chocolate", "Milk chocolate with fruits and nuts", 20.99, 110, 'CAT05');

INSERT INTO Discount VALUES
    ('P01', 'CHOC13', '2023-02-01 08:00:00', '2023-02-02 18:00:00'),
    ('P02', 'CHOC14', '2023-06-01 08:00:00', '2023-06-30 18:00:00'),
    ('P03', 'CHOC15', '2023-12-01 08:00:00', '2023-12-31 18:00:00'),
    ('P04', 'CHOC16', '2024-01-15 08:00:00', '2024-01-31 18:00:00'),
    ('P05', 'CHOC17', '2024-03-01 08:00:00', '2024-03-15 18:00:00');

INSERT INTO Customer VALUES
    ('CUS145', "Jon Snow", "j.snow@notreal.com",  "90861923"),
    ('CUS146', "Daenerys Targaryen", "d.targaryen@notreal.com", "90861924"),
    ('CUS147', "Tyrion Lannister", "t.lannister@notreal.com", "90861925"),
    ('CUS148', "Arya Stark", "a.stark@notreal.com", "90861926"),
    ('CUS149', "Bran Stark", "b.stark@notreal.com", "90861927");

INSERT INTO Review VALUES
    ('REV131', 8, "A delicious milk chocolate", '2023-02-02 13:22:54', 'CUS145','CHOC13'),
    ('REV132', 9, "Loved the rich flavor", '2023-06-02 14:30:00', 'CUS146','CHOC14'),
    ('REV133', 7, "Too sweet for my taste", '2023-12-05 12:15:00', 'CUS147','CHOC15'),
    ('REV134', 10, "Perfect blend of spice", '2024-01-20 10:05:30', 'CUS148','CHOC16'),
    ('REV135', 8, "Nutty and fruity delight", '2024-03-02 11:20:45', 'CUS149','CHOC17');

show tables;








-- Question-B
/* Explain in simple words what each query does and make sure you comment it
 */ 

-- An example of an answer to a Query

/* This query prints the names of all chocolates */

/*Select ChocolateName
from Chocolate;*/

-- Query 1: A query involving a single table with one condition. Insert your answer below
/*SELECT * 
FROM Chocolate 
WHERE ChocolatePrice > 15.00;
*/



-- Query 2: A query involving a single table with two conditions, with one of the conditions that uses a wild card operator. Insert your answer below
/*wildcard operator
SELECT * 
FROM Customer 
WHERE CustomerEmail LIKE '%@notreal.com%' AND CustomerPhNum LIKE '9086%';
*/


-- Query 3: A query involving a join between at least two tables with an order by clause. Insert your answer below
/*SELECT Customer.CustomerName, Chocolate.ChocolateName, Review.ReviewRating
FROM Review 
JOIN Customer ON Review.CustomerID = Customer.CustomerID
JOIN Chocolate ON Review.ChocolateID = Chocolate.ChocolateID
ORDER BY Review.ReviewRating DESC;
*/


-- Query 4: A query involving a single table with an aggregate and group by function. Insert your answer below
/*SELECT Customer.CustomerName, Chocolate.ChocolateName, Review.ReviewRating
FROM Review 
JOIN Customer ON Review.CustomerID = Customer.CustomerID
JOIN Chocolate ON Review.ChocolateID = Chocolate.ChocolateID
ORDER BY Review.ReviewRating DESC;
*/