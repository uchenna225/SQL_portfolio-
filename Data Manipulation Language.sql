--CREATING A DATABASE WITH 3 TABLES(STAFFS,RESOURSES,PRICE_TAGS) FOR A BUSINESS MIKES COFFEE.

CREATE TABLE Staffs (
    staff_id INT PRIMARY KEY,
    full_name VARCHAR(30),
    salary INT,
    contact_address VARCHAR(50)
);

CREATE TABLE Resources (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(30),
    price INT,
    quantity INT,
    date_purchased DATE,
    staff_id INT REFERENCES Staffs(staff_id)
);

CREATE TABLE Price_Tags (
    coffee_name VARCHAR(30),
    price INT,
    staff_id INT REFERENCES Staffs(staff_id),
    date_sold DATE
);

--INSERTING INTO TABLES

INSERT INTO Staffs(staff_id, full_name, salary, contact_address)
VALUES
(1, 'eze henry', 3000, 'ikeja'),
(2, 'chibudom mike', 2500, 'ikeja'),
(3, 'ayo paul', 4000, 'ikeja');

INSERT INTO Price_Tags(coffee_name, price, staff_id, date_sold)
VALUES
('cappuccino', 650, 2, '2024-01-01'),
('espresso', 650, 1, '2024-01-01'),
('latte', 700, 2, '2024-01-01');

INSERT INTO Resources(product_id, product_name, price, quantity, date_purchased, staff_id)
VALUES
(1, 'clean_water', 800, 15, '2024-01-01', 3),
(2, 'coffee_beans', 1500, 20, '2024-07-01', 1),
(3, 'milk', 2000, 200, '2024-01-14', 3),
(4, 'paper_cups', 400, 1000, '2024-01-01', 2);

--updating values in a table

UPDATE Staffs
SET full_name = 'paul eze'
WHERE staff_id = 1

UPDATE Staffs
SET contact_address = 'mile 2'
WHERE staff_id = 3

UPDATE Price_Tags
SET date_sold = '2023-01-22'
WHERE coffee_name = 'latte';

UPDATE Price_Tags
SET price = '850'
WHERE date_sold = '2024-01-01';

UPDATE Resources
SET price = '850'
WHERE date_purchased = '2024-01-01';

UPDATE Resources
SET staff_id = 1
WHERE quantity = 1000;

-- Deleting record

DELETE FROM Resources
WHERE staff_id = 3;

DELETE FROM Price_Tags
WHERE coffee_name = 'latte';
