SELECT COUNT(PassengerId) AS total_passengers, AVG(Age) AS averag_age, MIN(age) AS minimum_age, MAX(age) AS maximum_age
FROM tested$

SELECT *
FROM tested$

SELECT *
FROM tested$
WHERE Survived = 1

SELECT *
FROM tested$
WHERE Survived = 0

SElECT (COUNT(Survived) / COUNT(*))*100 AS survival_rate
FROM tested$
WHERE Survived = 1

SELECT
   (SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS SurvivalPercentage
FROM tested$;

SELECT 
	(SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END)*100/ COUNT(*)) AS survival_rate
FROM tested$

SELECT Pclass, COUNT(*) AS numberperClass
FROM tested$
GROUP BY Pclass

SELECT Pclass, AVG(Fare) AS averageFare
FROM tested$
GROUP BY Pclass

SELECT Sex, COUNT(Sex) AS gender
FROM tested$
GROUP BY Sex

SELECT SibSp, COUNT(*) AS PassengerCount
FROM tested$
GROUP BY SibSp;

SELECT COUNT( DISTINCT(Ticket)) AS valid_ticket
FROM tested$

SELECT Ticket, COUNT(*) AS PassengerCount
FROM tested$
GROUP BY Ticket
HAVING COUNT(*) > 1;
