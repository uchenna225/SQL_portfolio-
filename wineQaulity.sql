SELECT COUNT(*)
FROM winequality

SELECT *
FROM winequality

SELECT AVG(quality) AS avg_quality
FROM winequality

SELECT *
FROM winequality
WHERE quality > 7

SELECT TOP 5 *
FROM winequality
ORDER BY alcohol DESC;

SELECT quality, COUNT(quality) AS qq
FROM winequality
GROUP BY quality