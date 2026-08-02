CREATE TABLE customer_churn (
    customer_id             VARCHAR(50) PRIMARY KEY,
    signup_date             TIMESTAMP,
    age                     INTEGER,
    gender                  VARCHAR(20),
    annual_income           NUMERIC(12,2),
    education               VARCHAR(50),
    marital_status          VARCHAR(20),
    dependents              INTEGER,
    tenure                  INTEGER,
    contract                VARCHAR(30),
    payment_method          VARCHAR(50),
    paperless_billing       VARCHAR(10),
    senior_citizen          INTEGER,
    monthlycharges          NUMERIC(10,2),
    totalcharges            NUMERIC(12,2),
    num_services            INTEGER,
    has_phone_service       INTEGER,
    has_internet_service    INTEGER,
    has_online_security     INTEGER,
    has_online_backup       INTEGER,
    has_device_protection   INTEGER,
    has_tech_support        INTEGER,
    has_streaming_tv        INTEGER,
    has_streaming_movies    INTEGER,
    customer_satisfaction   NUMERIC(4,2),
    num_complaints          INTEGER,
    num_service_calls       INTEGER,
    late_payments            INTEGER,
    avg_monthly_gb          NUMERIC(10,2),
    days_since_last_interaction INTEGER,
    credit_score            INTEGER,
    churn                   INTEGER,
    tenure_bucket           VARCHAR(20),
    signup_year             INTEGER,
    income_bracket          VARCHAR(20),
    complaint_flag          INTEGER,
    high_usage_flag         INTEGER
);

ALTER TABLE customer_churn ALTER COLUMN num_complaints 
TYPE NUMERIC(10,2);
ALTER TABLE customer_churn ALTER COLUMN credit_score 
TYPE NUMERIC(10,2);

SELECT column_name, data_type FROM information_schema.columns 
WHERE table_name = 'customer_churn';
