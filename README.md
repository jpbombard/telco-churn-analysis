# Telco Customer Churn Analysis

An end-to-end data analysis and machine learning project that explores customer churn behavior for a telecom company. The project follows a structured analytics workflow — from raw data ingestion through SQL exploration, EDA, and predictive modeling.

---

## Project Overview

Customer churn is one of the most important metrics for subscription-based businesses. This project analyzes ~7,000 customer records to identify the key drivers of churn and build a classification model to predict which customers are at risk of leaving.

**Key questions addressed:**
- What customer and account characteristics are most associated with churn?
- Can we accurately predict whether a customer will churn?
- What actionable insights can be drawn to improve retention?

---

## Project Structure

```
telco-churn-analysis/
├── data/
│   └── WA_Fn-UseC_-Telco-Customer-Churn.csv   # Raw source data
├── etl/
│   └── load_to_db.py                            # ETL script: loads and cleans CSV into SQLite
├── notebooks/
│   └── churn_analysis.ipynb                     # Main analysis notebook (EDA + modeling)
├── sql/
│   └── exploration_queries.sql                  # SQL queries used for initial data exploration
├── utils/
│   └── data_quality.py                          # Reusable data quality check function
├── .gitignore
├── README.md
└── requirements.txt
```

---

## Workflow

**1. ETL Pipeline**
Raw CSV data is loaded into a local SQLite database using `etl/load_to_db.py`. The script handles known data quality issues including type casting and null handling before writing to the database.

**2. SQL Exploration**
Initial exploration was performed in DBeaver using queries stored in `sql/exploration_queries.sql`. Key findings from this stage informed the direction of the EDA.

**3. Exploratory Data Analysis**
Visualizations and statistical summaries are built in `notebooks/churn_analysis.ipynb` to surface churn patterns across customer segments, contract types, and service usage.

**4. Predictive Modeling**
Classification models are trained and evaluated to predict customer churn, with performance assessed using precision, recall, and AUC-ROC metrics.

---

## Key Findings

### EDA
- Customers on month-to-month contracts churn at a dramatically higher rate than those on one or two year contracts
- Fiber optic customers have the highest churn rate of any internet service tier — nearly 70% hold month-to-month contracts, combining premium pricing with no lock-in
- Customers who churn tend to do so early in their tenure — retention efforts should target the first year
- Electronic check is the highest churn payment method, and seniors use it as their primary payment method over 50% of the time

### Modeling
- Logistic Regression outperformed Random Forest and Gradient Boosting, achieving an AUC-ROC of 0.834
- After threshold tuning from 0.5 to 0.35, churn recall improved from 57% to 71%
- The strongest predictors of churn were contract type, fiber optic internet service, tenure, and electronic check payment method

### Business Recommendations
- Incentivize longer contracts — even moving a customer from month-to-month to one year significantly reduces churn risk
- Target early tenure customers with proactive retention offers before they reach their natural churn window
- Investigate fiber optic service quality and pricing — churn among premium customers suggests unmet expectations or competitive pressure
- Encourage automatic payment enrollment as a simple intervention with meaningful retention impact

---

## Tech Stack

- **Languages:** Python, SQL
- **Libraries:** pandas, NumPy, Matplotlib, Seaborn, scikit-learn
- **Database:** SQLite (via DBeaver)
- **Notebook:** Jupyter (via VSCode)

---

## Setup

1. Clone the repository
```bash
git clone https://github.com/jpbombard/telco-churn-analysis.git
cd telco-churn-analysis
```

2. Create and activate a virtual environment
```bash
python -m venv venv
source venv/bin/activate  # Mac/Linux
```

3. Install dependencies
```bash
pip install -r requirements.txt
```

4. Run the ETL pipeline
```bash
python etl/load_to_db.py
```

5. Open the notebook in VSCode and run `notebooks/churn_analysis.ipynb`

---

## Data Source

[Telco Customer Churn - IBM Dataset](https://www.kaggle.com/datasets/blastchar/telco-customer-churn) via Kaggle