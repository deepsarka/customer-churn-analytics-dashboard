SELECT * FROM vw_churn_summary;

SELECT * FROM vw_churn_by_contract;

DROP VIEW vw_churn_by_complaints;

CREATE VIEW vw_churn_by_complaints AS
SELECT
    CASE WHEN complaint_flag = 1 THEN 'Has Complaints' ELSE 'No Complaints' END AS complaint_status,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY complaint_flag;