SELECT COUNT(*) FROM customer_churn;

SELECT * FROM customer_churn LIMIT 5;

/*1. Overall churn summary (for KPI cards)*/
CREATE VIEW vw_churn_summary AS
SELECT
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate_pct,
    ROUND(AVG(monthlycharges), 2) AS avg_monthly_charges,
    ROUND(AVG(tenure), 1) AS avg_tenure_months
FROM customer_churn;

/*2. Churn rate by contract type (your strongest driver)*/
CREATE VIEW vw_churn_by_contract AS
SELECT
    contract,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY contract
ORDER BY churn_rate_pct DESC;

/*3. Churn rate by tenure bucket*/
CREATE VIEW vw_churn_by_tenure AS
SELECT
    tenure_bucket,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY tenure_bucket
ORDER BY
    CASE tenure_bucket
        WHEN '0-6mo' THEN 1
        WHEN '6-12mo' THEN 2
        WHEN '1-2yr' THEN 3
        WHEN '2-4yr' THEN 4
        WHEN '4-6yr' THEN 5
    END;

/*4. Churn rate by complaint flag*/
CREATE VIEW vw_churn_by_complaints AS
SELECT
    complaint_flag,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY complaint_flag;

/*5. Churn rate by payment method*/
CREATE VIEW vw_churn_by_payment_method AS
SELECT
    payment_method,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY payment_method
ORDER BY churn_rate_pct DESC;

/*6. Revenue at risk (monthly charges tied to churned customers)*/
CREATE VIEW vw_revenue_at_risk AS
SELECT
    contract,
    SUM(CASE WHEN churn = 1 THEN monthlycharges ELSE 0 END) AS monthly_revenue_lost,
    ROUND(100.0 * SUM(CASE WHEN churn = 1 THEN monthlycharges ELSE 0 END)
        / NULLIF(SUM(monthlycharges), 0), 2) AS pct_revenue_at_risk
FROM customer_churn
GROUP BY contract
ORDER BY monthly_revenue_lost DESC;
 
-- 7. Churn rate by income bracket
CREATE VIEW vw_churn_by_income AS
SELECT
    income_bracket,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY income_bracket;
 
-- 8. Churn rate by signup year (cohort trend)
CREATE VIEW vw_churn_by_signup_year AS
SELECT
    signup_year,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY signup_year
ORDER BY signup_year;







