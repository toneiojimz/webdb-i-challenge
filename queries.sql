-- Database Queries

-- Find all customers with postal code 1010

    SELECT * FROM customers
    where PostalCode = 1010;


-- Find the phone number for the supplier with the id 11

    SELECT Phone from suppliers
    where SupplierId = 11;

-- List first 10 orders placed, sorted descending by the order date

    SELECT * FROM [Orders]
    order by OrderDate desc
    limit 10;

-- Find all customers that live in London, Madrid, or Brazil

    SELECT * FROM [Customers]
    WHERE City in ('London', 'Madrid') or Country= 'Brazil';

-- Add a customer record for "The Shire", the contact name is "Bilbo Baggins" the address is -"1 Hobbit-Hole" in "Bag End", postal code "111" and the country is "Middle Earth"

    INSERT into Customers( CustomerName, ContactName, Address, City, PostalCode, Country)
    values("The Shire", "Bilbo Baggins", "1 hobbit-Hole", "Bag End", "111", "Middle Earth")

-- Update Bilbo Baggins record so that the postal code changes to "11122"

    UPDATE CUSTOMERS
    SET PostalCode = "11122"
    where ContactName = "Bilbo Baggins";

-- (Stretch) Find a query to discover how many different cities are stored in the Customers table. Repeats should not be double counted

    SELECT DISTINCT City FROM Customers;

-- (Stretch) Find all suppliers who have names longer than 20 characters. You can use `length(SupplierName)` to get the length of the name

    SELECT SupplierName from Suppliers WHERE length(SupplierName) > 20;