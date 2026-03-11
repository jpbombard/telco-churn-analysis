Select *
From customers c

SELECT  
ROUND(100.0 * SUM(Churn) / COUNT(*), 2) AS churn_rate_pct,
COUNT(*) AS total_customers,
SUM(Churn) AS churned
FROM  customers
-- overall churn rate


SELECT 
    Contract,
    COUNT(*) AS total,
    SUM(Churn) AS churned,
    ROUND(100.0 * SUM(Churn) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY Contract
ORDER BY churn_rate_pct DESC
-- chrun based on contract type
-- churn is much higher for those on shorter contracts

SELECT 
    InternetService,
    COUNT(*) AS total,
    SUM(Churn) AS churned,
    ROUND(100.0 * SUM(Churn) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY InternetService
ORDER BY churn_rate_pct DESC
-- churn based on internet service type
-- fiber optic has much higher churn than DSL, no internet has much lower churn 

SELECT 
    Churn,
    ROUND(AVG(tenure), 1) AS avg_tenure_months,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charges
FROM customers
GROUP BY Churn
-- average tenure and charges by churn rate status 
-- basically, customers are more likely to churn earlier than later, possibly due to lower monthly charges from longer contracts

SELECT 
    PaymentMethod,
    COUNT(*) AS total,
    SUM(Churn) AS churned,
    ROUND(100.0 * SUM(Churn) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_pct DESC
-- churn rates seperated by payment method
-- customers using automatic payments are less likely to churn 

SELECT 
    SeniorCitizen,
    COUNT(*) AS total,
    SUM(Churn) AS churned,
    ROUND(100.0 * SUM(Churn) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY SeniorCitizen
-- churn rate based on senior citizen status 
-- seniors are more likely to churn. possibly because they are less likely to use automatic payments
