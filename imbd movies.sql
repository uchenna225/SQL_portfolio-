SELECT TOP 10 names, AVG(score) AS average_score
FROM imdb_movies$
WHERE score > (SELECT AVG(score) FROM imdb_movies$)
GROUP BY names;

SELECT *
FROM imdb_movies$;

SELECT date_x, COUNT(*)
FROM imdb_movies$
GROUP BY date_x
ORDER BY date_x DESC;

SELECT TOP 5 genre, count(*) AS movie_count
FROM imdb_movies$
GROUP BY genre
ORDER BY movie_count;

SELECT names, date_x, score
FROM imdb

SELECT TOP 5 genre, COUNT(*) AS movie_count
FROM (
    SELECT DISTINCT names, 
                    SUBSTRING(genre, 1, CHARINDEX(',', genre + ',') - 1) AS genre
    FROM imdb_movies$
    WHERE CHARINDEX(',', genre) > 0  -- Filter out single-genre movies
    UNION ALL
    SELECT names, genre
    FROM imdb_movies$
    WHERE CHARINDEX(',', genre) = 0  -- Include single-genre movies
) AS genre_split
GROUP BY genre
ORDER BY movie_count DESC;
SELECT TOP 10 names, AVG(score) AS average_score
FROM imdb_movies$
WHERE score > (SELECT AVG(score) FROM imdb_movies$)
GROUP BY names

SELECT *
FROM imdb_movies$;

SELECT date_x, COUNT(*)
FROM imdb_movies$
GROUP BY date_x
ORDER BY date_x DESC;

SELECT TOP 5 genre, count(*) AS movie_count
FROM imdb_movies$
GROUP BY genre
ORDER BY movie_count;

SELECT names, date_x, score
FROM imdb_movies$
WHERE YEAR(date_x) = 2020;

SELECT TOP 5 genre, COUNT(*) AS movie_count
FROM (
    SELECT DISTINCT names, 
                    SUBSTRING(genre, 1, CHARINDEX(',', genre + ',') - 1) AS genre
    FROM imdb_movies$
    WHERE CHARINDEX(',', genre) > 0  -- Filter out single-genre movies
    UNION ALL
    SELECT names, genre
    FROM imdb_movies$
    WHERE CHARINDEX(',', genre) = 0  -- Include single-genre movies
) AS genre_split
GROUP BY genre
ORDER BY movie_count DESC;

SELECT TOP 3 names, AVG(revenue)AS movie_income
FROM imdb_movies$
WHERE revenue > (SELECT AVG(revenue) FROM imdb_movies$)
GROUP BY names

SELECT names, date_x, score
FROM imdb_movies$
WHERE crew like '%Leonardo Dicaprio%';

SELECT genre, AVG(score) AS average_rating
FROM (
    SELECT DISTINCT names, 
                    SUBSTRING(value, 1, CHARINDEX(',', value + ',') - 1) AS genre,
                    score
    FROM imdb_movies$
    CROSS APPLY STRING_SPLIT(genre, ',')
) AS genre_split
GROUP BY genre
ORDER BY average_rating DESC;

SELECT genre, AVG(score) AS average_rating
FROM (
    SELECT DISTINCT names, 
                    CASE 
                        WHEN CHARINDEX(',', genre) > 0 THEN SUBSTRING(genre, 1, CHARINDEX(',', genre) - 1)
                        ELSE genre
                    END AS genre,
                    score
    FROM imdb_movies$
) AS genre_split
GROUP BY genre
ORDER BY average_rating DESC;

SELECT names, date_x, score
FROM imdb_movies$
WHERE score > 85 and YEAR(date_x) > 2015
ORDER BY date_x;



