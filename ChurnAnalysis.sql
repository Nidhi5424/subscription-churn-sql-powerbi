
USE rw7;


DROP TABLE IF EXISTS CustomerSubscriptions;

-- ==============================
--  CREATE TABLE
-- ==============================
CREATE TABLE CustomerSubscriptions (
    CustomerID       VARCHAR(10) PRIMARY KEY,
    Name             VARCHAR(100),
    Age              INT,
    Gender           VARCHAR(10),
    SubscriptionType VARCHAR(20),
    SubscriptionDate DATE,
    LastLoginDate    DATE,
    TotalSessions    INT,
    FeedbackScore    INT,
    IsChurned        TINYINT
);

-- ==============================
--  LOAD DATA FROM CSV
-- ==============================

LOAD DATA LOCAL INFILE 'D:/Power BI/BCS/CustomerSubscriptions.csv'
INTO TABLE CustomerSubscriptions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(CustomerID, Name, Age, Gender, SubscriptionType, SubscriptionDate,
 LastLoginDate, TotalSessions, FeedbackScore, IsChurned);

-- ==============================
--  QUERIES 
-- ==============================

-- 1) Total number of active vs churned customers (by SubscriptionType)
SELECT
    SubscriptionType,
    SUM(CASE WHEN IsChurned = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
    SUM(CASE WHEN IsChurned = 0 THEN 1 ELSE 0 END) AS ActiveCustomers
FROM CustomerSubscriptions
GROUP BY SubscriptionType;

-- 2) Average FeedbackScore by SubscriptionType and Gender
SELECT
    SubscriptionType,
    Gender,
    AVG(FeedbackScore) AS AvgFeedbackScore
FROM CustomerSubscriptions
GROUP BY SubscriptionType, Gender;

-- 3) Customers who attended < 5 sessions AND FeedbackScore < 5
SELECT *
FROM CustomerSubscriptions
WHERE TotalSessions < 5
  AND FeedbackScore < 5;


-- 4) Customers who haven't logged in for the past 60 days
SELECT *
FROM CustomerSubscriptions
WHERE DATEDIFF(CURRENT_DATE, LastLoginDate) >= 60;

-- 5) Churn rate by SubscriptionType


-- 6) Top 10 customers with longest subscriptions (oldest SubscriptionDate)
SELECT
    CustomerID,
    Name,
    SubscriptionType,
    SubscriptionDate
FROM CustomerSubscriptions
ORDER BY SubscriptionDate
LIMIT 10;

-- 7) Age group-wise churn analysis
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Other'
    END AS AgeGroup,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN IsChurned = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
    100.0 * SUM(CASE WHEN IsChurned = 1 THEN 1 ELSE 0 END) / COUNT(*) AS ChurnRatePercent
FROM CustomerSubscriptions
GROUP BY AgeGroup
ORDER BY AgeGroup;
