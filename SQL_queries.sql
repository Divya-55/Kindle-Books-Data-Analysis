CREATE OR REPLACE TABLE KINDLE_DATA_TABLE (
    "ProductID" VARCHAR(255) PRIMARY KEY,
    "Title" TEXT,
    "Author" TEXT,
    "Seller" TEXT,
    "ImageURL" TEXT,
    "ProductURL" TEXT,
    "AverageRating" FLOAT,
    "NumberOfReviews" INT,
    "Cost_USD" DECIMAL(10, 2),
    "IsKindleUnlimited" BOOLEAN,
    "CategoryID" INT,
    "IsBestSeller" BOOLEAN,
    "IsEditorsPick" BOOLEAN,
    "IsGoodReadsChoice" BOOLEAN,
    "PublishedDate" DATE,
    "CategoryName" TEXT
);
 -- TEXT -> no length specification compared to VARCHAR

SELECT * FROM KINDLE_DATA_TABLE LIMIT 10;

-- Q1 WHY ARE CERTAIN BOOKS BEST SELLERS?
SELECT 
  "IsBestSeller",
  AVG("AverageRating") AS AvgRating,
  AVG("NumberOfReviews") AS AvgNumberOfReviews,
  AVG("Cost_USD") AS AvgPrice
FROM KINDLE_DATA_TABLE
GROUP BY "IsBestSeller";


-- Q2 DO HIGHER RATINGS LEAD TO MORE REVIEWS?
WITH RatingReviewStats AS (
    SELECT 
        "AverageRating" AS Rating,
        AVG("NumberOfReviews") AS AvgNumberOfReviews
    FROM KINDLE_DATA_TABLE
    GROUP BY "AverageRating"
)
SELECT 
    Rating,
    AvgNumberOfReviews
FROM RatingReviewStats
ORDER BY Rating;


-- Q3 Impact of Price on Book Popularity
SELECT 
  "IsBestSeller",
  AVG("Cost_USD") AS AvgPrice
FROM KINDLE_DATA_TABLE
GROUP BY "IsBestSeller";

-- Q4 DO EDITOR'S PICKS HAVE HIGHER RATINGS
SELECT "IsEditorsPick", AVG("AverageRating") AS "AverageRating"
FROM KINDLE_DATA_TABLE
GROUP BY "IsEditorsPick";


-- Q5 EFFECTS OF KINDLE UNLIMITED ON RATINGS AND REVIEWS

SELECT 
  "IsKindleUnlimited",
  AVG("AverageRating") AS AvgRating,
  AVG("NumberOfReviews") AS AvgNumberOfReviews
FROM KINDLE_DATA_TABLE
GROUP BY "IsKindleUnlimited";



-- Q6 PERFORMANCE OF BOOKS ACROSS CATEGORIES

SELECT 
  "CategoryName",
  AVG("AverageRating") AS AvgRating,
  AVG("NumberOfReviews") AS AvgNumberOfReviews
FROM KINDLE_DATA_TABLE
GROUP BY "CategoryName"
ORDER BY AvgRating;



-- Q7 TRENDS IN RATINGS OVER TIME

SELECT 
  EXTRACT(YEAR FROM "PublishedDate"::DATE) AS Year,
  AVG("AverageRating") AS AvgRating
FROM KINDLE_DATA_TABLE
WHERE Year != '2100'
GROUP BY Year
ORDER BY Year DESC;

-- Q8 RATING AND REVIEW TRENDS FOR BEST SELLERS
SELECT 
  EXTRACT(YEAR FROM "PublishedDate"::DATE) AS Year,
  AVG("AverageRating") AS AvgRating,
  AVG("NumberOfReviews") AS AvgNumberOfReviews
FROM KINDLE_DATA_TABLE
WHERE "IsBestSeller" = TRUE AND Year!='2100'
GROUP BY Year
ORDER BY Year;



-- Q9 ANALYSIS OF PRICE TRENDS FOR TOP-RATED BOOKS

SELECT 
  "Title",
  "Author",
  "Cost_USD",
  "AverageRating"
FROM KINDLE_DATA_TABLE
WHERE "AverageRating" > (SELECT AVG("AverageRating") FROM KINDLE_DATA_TABLE)
ORDER BY "AverageRating" DESC, "Cost_USD" ASC;


-- Q10 IMPACTS OF GOODREADS CHOICE ON BOOK RATINGS
SELECT 
  "IsGoodReadsChoice",
  AVG("AverageRating") AS AvgRating
FROM KINDLE_DATA_TABLE
GROUP BY "IsGoodReadsChoice";

