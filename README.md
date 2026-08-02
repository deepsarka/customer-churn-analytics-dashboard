# Customer Churn Analytics Dashboard

A full-scale churn analysis project built on 1 million customer records — from raw data through PostgreSQL to an interactive Power BI dashboard with prioritized retention recommendations.

## 📊 Overview

Customer churn quietly drains revenue long before it shows up on a balance sheet. This project digs into a 1M-row telecom customer dataset to identify what actually drives churn, then translates those findings into a clear, prioritized action plan.

**Key metrics:**
- Total Customers: 1,000,000
- Churn Rate: 9.92%
- Avg. Tenure: 22.4 months
- Avg. Monthly Charges: $86.44

## 🔍 Key Insights

- **Contract type is the dominant driver of churn.** Month-to-month customers churn at **26.5%**, nearly 5x the rate of two-year contract customers (5.65%).
- **Revenue risk doesn't follow churn rate.** One-year contract customers account for **~70% of total revenue at risk** — not because they churn the most, but because they make up the largest share of the customer base. Chasing the highest churn *rate* alone misses where the real dollars are leaking.
- **Complaints matter, but moderately.** Customers who've logged a complaint churn at 11.72% vs. 8.20% for those who haven't.
- **New customers are more likely to leave.** Churn is highest in the first 6 months and gradually declines with tenure.
- **Income bracket is not a meaningful driver.** Churn rate stays flat (~9.8%–10.2%) across all income levels — ruling this out sharpened the focus on what actually matters.

## 🛠️ Tech Stack

- **Python** (Google Colab) — data cleaning, null handling, feature engineering (tenure buckets, income brackets, complaint/usage flags)
- **PostgreSQL** — 1M-row table load, 8 SQL views for pre-aggregated dashboard metrics
- **Power BI** — custom-styled two-page dashboard connected directly to PostgreSQL, DAX-free view-based architecture, conditional formatting
- <img width="1339" height="741" alt="image" src="https://github.com/user-attachments/assets/e0eaa154-fe75-4126-aad2-f44d707bdb51" />

<img width="1297" height="613" alt="image" src="https://github.com/user-attachments/assets/3a6cfe9a-585c-4c85-b975-bac0a7b53a03" />



## 📁 Repo Structure

```
customer-churn-analytics-dashboard/
├── README.md
├── Customer_churn.ipynb        # Python cleaning & feature engineering
├── sql/
│   ├── create_table.sql        # Table schema
│   └── churn_views.sql         # 8 SQL views powering the dashboard
└── powerbi/
    ├── churn_insights_page.png
    ├── recommendations_page.png
    └── customer_churn_dashboard.pbix
```

## 📈 Dashboard Pages

1. **Churn Insights** — 4 KPI cards + 6 visuals covering churn by contract type, complaint status, income bracket, tenure, payment method, and a revenue-at-risk breakdown
2. **Recommendations** — Strategic action table mapping each key finding to prioritized, specific retention actions (Priority and Impact rated)

## 📌 Data Source

This project uses a 1,000,000-row synthetic telecom churn dataset. Due to its size, the raw/cleaned data files are not included in this repo — the full dataset can be downloaded directly from Kaggle:

[Customer Churn Prediction Dataset (1M rows)](https://www.kaggle.com/datasets/isandeep06/customer-churn-prediction-dataset-1m)

## 🔗 Connect

Deep Sarkar — 
LinkedIn - https://www.linkedin.com/feed/
