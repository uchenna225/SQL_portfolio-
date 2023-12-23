SELECT *
FROM Track$
JOIN Album$ 
ON Album$.AlbumId = Track$.AlbumId

SELECT *
FROM InvoiceLine$


SELECT *
FROM Invoice$

SELECT *
FROM Genre$
JOIN Track$
ON Track$.GenreId = Genre$.GenreId

SELECT *
FROM PlaylistTrack$

SELECT *
FROM Track$

UPDATE Track$
SET UnitPrice = 1
WHERE GenreId = 4;

SELECT Customer$.*, COUNT(Invoice$.InvoiceId) AS times
FROM Customer$
JOIN Invoice$
ON Invoice$.CustomerId = Customer$.CustomerId
GROUP BY Customer$.CustomerId, Customer$.FirstName, Customer$.LastName
HAVING COUNT(Invoice$.InvoiceId) > 1;

SELECT *
FROM Customer$

SELECT Customer$.*, subquery.times
FROM Customer$
JOIN (
    SELECT Customer$.CustomerId, COUNT(Invoice$.InvoiceId) AS times
    FROM Customer$
    JOIN Invoice$ ON Invoice$.CustomerId = Customer$.CustomerId
    GROUP BY Customer$.CustomerId
    HAVING COUNT(Invoice$.InvoiceId) > 1
) AS subquery ON Customer$.CustomerId = subquery.CustomerId;


SELECT *
FROM Employee$

SELECT *
FROM Artist$

SELECT *
FROM Album$