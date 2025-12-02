# 📊 Subscription Churn Analysis – SQL + Power BI

A complete end-to-end data analytics project to analyze **customer churn** for a subscription-based fitness/wellness service.  
This project includes:

- ✔️ Dataset creation  
- ✔️ SQL table creation + data loading  
- ✔️ Required SQL queries  
- ✔️ Power BI dashboard  
- ✔️ Insight summary  
- ✔️ GitHub documentation (this file)

---

## 📁 Project Folder Structure

```
subscription-churn-sql-powerbi/
│
├── data/
│   └── CustomerSubscriptions.csv
│
├── sql/
│   └── ChurnAnalysis.sql
│
├── dashboard/
│   └── ChurnDashboard.pbix
│
├── ChurnSummary.txt
└── README.md
```

---

## 🧠 Project Overview

A startup offering subscription plans (Monthly, Quarterly, Yearly) is facing an increase in customer churn.  
As a data analyst, your task is to:

1. Analyze churn using **SQL**
2. Build visual insights using **Power BI**
3. Derive actionable insights from the data

---

## 🗂️ Dataset Details (`CustomerSubscriptions.csv`)

The dataset contains the following columns:

| Column Name        | Description |
|-------------------|-------------|
| CustomerID        | Unique customer ID |
| Name              | Customer name |
| Age               | Customer age |
| Gender            | Male/Female/Other |
| SubscriptionType  | Monthly / Quarterly / Yearly |
| SubscriptionDate  | When subscription started |
| LastLoginDate     | Last time customer logged in |
| TotalSessions     | Total sessions attended |
| FeedbackScore     | Rating (1–10) |
| IsChurned         | 1 = Churned, 0 = Active |

---

## 🛢️ SQL Part (MySQL)

### 1️⃣ Create Database
```sql
CREATE DATABASE IF NOT EXISTS rw7;
USE rw7;
```

### 2️⃣ Create Table (inside ChurnAnalysis.sql)
Table contains:
- CustomerID  
- Name  
- Age  
- Gender  
- Subscription details  
- Activity details  
- Churn flag  

### 3️⃣ Load Data From CSV
```sql
LOAD DATA LOCAL INFILE 'C:/SQLProject/CustomerSubscriptions.csv'
INTO TABLE CustomerSubscriptions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

### 4️⃣ Required SQL Queries
The SQL file includes:

- Active vs Churned (by SubscriptionType)  
- Average Feedback (by SubscriptionType & Gender)  
- Low Sessions + Low Feedback Customers  
- Customers inactive for 60+ days  
- Churn Rate by SubscriptionType  
- Top 10 longest subscriptions  
- Age-group wise churn  

(Full queries inside `sql/ChurnAnalysis.sql`)

---

## 📈 Power BI Dashboard

### Dashboard Includes:
- 🟠 Donut Chart → Churned vs Active  
- 🟦 Bar Chart → Churn rate by SubscriptionType  
- 🟩 Line Chart → Monthly churn trend  
- 🟣 Scatter Plot → FeedbackScore vs TotalSessions  
- 🟡 KPI Cards →  
  - Total Customers  
  - % Churned  
  - Avg Feedback Score  
  - Avg Days Since Last Login  

### Slicers:
- SubscriptionType  
- Gender  
- AgeGroup  

Dashboard file:  
📁 `dashboard/ChurnDashboard.pbix`

---

## 📝 Insight Summary (ChurnSummary.txt)

Example insights:

- Younger customers (18–25) have the highest churn.
- Monthly-plan users churn more than yearly users.
- People with fewer than 10 sessions churn faster.
- Feedback < 5 strongly predicts churn.
- Lack of login for 60+ days is a major churn signal.

---

## 🚀 How to Run the Project Locally

### 🔹 1. Clone the Repo
```bash
git clone https://github.com/<your-username>/subscription-churn-sql-powerbi.git
cd subscription-churn-sql-powerbi
```

### 🔹 2. Import Dataset into MySQL
```sql
USE rw7;
SOURCE sql/ChurnAnalysis.sql;
```

### 🔹 3. Open Power BI Dashboard
Open:
```
dashboard/ChurnDashboard.pbix
```

---

## 🧩 Tools Used

| Tool | Purpose |
|------|---------|
| MySQL | Data storage + SQL analysis |
| Visual Studio Code | SQL scripting |
| Power BI Desktop | Dashboard + visualization |
| Git & GitHub | Version control |

---

## 🙋‍♀️ Author

**NIDHI PATEL**  
Junior Data Analyst  

---

## ⭐ If you like this project, consider giving the repo a star! ⭐

<img width="1187" height="555" alt="Screenshot 2025-12-02 164453" src="https://github.com/user-attachments/assets/ceca5756-0976-4ca6-9f79-c3771ad76752" />
<img width="1796" height="905" alt="Screenshot 2025-12-02 164444" src="https://github.com/user-attachments/assets/0e090b9b-051d-4b85-aad3-9ffbd4b8200e" />
<img width="834" height="223" alt="Screenshot 2025-12-02 164430" src="https://github.com/user-attachments/assets/ebc93d99-f08f-43df-825b-e31a51c27953" />
<img width="1782" height="946" alt="Screenshot 2025-12-02 164412" src="https://github.com/user-attachments/assets/1b26643f-a1c6-442c-8e59-a1f773791953" />
<img width="1114" height="245" alt="Screenshot 2025-12-02 164324" src="https://github.com/user-attachments/assets/9fc3dcec-9f05-4ada-8c86-d82825291724" />
<img width="1050" height="336" alt="Screenshot 2025-12-02 164311" src="https://github.com/user-attachments/assets/75dca9f1-ea90-428c-86eb-e8297c15c7b2" />


