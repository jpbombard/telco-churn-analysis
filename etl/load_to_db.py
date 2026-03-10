import pandas as pd
import sqlite3
import os

# Paths
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
CSV_PATH = os.path.join(BASE_DIR, "../data/WA_Fn-UseC_-Telco-Customer-Churn.csv")
DB_PATH = os.path.join(BASE_DIR, "../data/telco_churn.db")

# Extract 

print('Loading CSV...')
df = pd.read_csv(CSV_PATH)

# Transform 

print('Transforming data...')

df.columns = df.columns.str.strip()
# strips whitespace from column names 

df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')
# converts the TotalCharges column from string to numeric

df = df.dropna(subset=['TotalCharges'])
# drops rows where TotalCharges is null (new customers with no charges yet)

df['Churn'] = df['Churn'].map({'Yes': 1, 'No': 0})
# converts churn to binary integer 

# Load

print('Loading into SQLite database')
conn = sqlite3.connect(DB_PATH)
df.to_sql('customers', conn, if_exists='replace', index=False, )
conn.close()

print(f'Done! {len(df)} records loaded into telco_churn.db')