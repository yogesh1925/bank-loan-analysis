# 🏦 Bank Loan Analysis Dashboard — SQL + Power BI

An end-to-end **Finance Domain** data analytics project that analyzes ~38,500 loan records using SQL Server for data validation and Power BI for interactive dashboard development. The project covers key lending KPIs across a **3-page dashboard**: Summary, Overview, and Details.

---

## 📁 Repository Structure

```
📦 Bank Loan Analysis
 ┣ 📂 Power BI
 ┃ ┗ 📄 BANK LOAN DASHBOARD Final....pbix
 ┣ 📂 Raw Data
 ┃ ┗ 📄 financial_loan.csv
 ┣ 📂 SQL
 ┃ ┗ 📄 SQLQuery bank loan.sql
 ┗ 📂 Screen Shot
   ┣ 🖼️ summary.png
   ┣ 🖼️ overview.png
   ┗ 🖼️ details.png
```

---

## 🎯 Project Objective

Build a comprehensive loan analytics dashboard to help financial stakeholders:

- Monitor **total loan applications** with MTD and Month-over-Month trends
- Track **funded amounts** vs. **amount received** from borrowers
- Distinguish **Good Loans** (Fully Paid / Current) from **Bad Loans** (Charged Off)
- Analyze loan performance by **region, purpose, term, and home ownership**
- Provide a **granular drill-down** view of individual loan records

---

## 📌 KPIs Tracked

| KPI | Description |
|-----|-------------|
| Total Loan Applications | Count of all applications with MTD & MoM change |
| Total Funded Amount | Total loan amount disbursed to borrowers |
| Total Amount Received | Total repayments collected from borrowers |
| Average Interest Rate | Mean interest rate across all active loans |
| Average DTI | Average Debt-to-Income ratio of borrowers |
| Good Loan % | Share of loans that are Fully Paid or Current |
| Bad Loan % | Share of loans that are Charged Off |

---

## 🗄️ SQL Analysis — `SQL/SQLQuery bank loan.sql`

All KPIs were first calculated in **MS SQL Server** to validate figures before connecting to Power BI.

**Queries include:**

```sql
-- Total Loan Applications
SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data;

-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data;

-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan_data;

-- Average Interest Rate
SELECT ROUND(AVG(int_rate) * 100, 4) AS Avg_Interest_Rate FROM bank_loan_data;

-- Average DTI
SELECT ROUND(AVG(dti) * 100, 4) AS Avg_DTI FROM bank_loan_data;

-- Good Loan Percentage
SELECT
  (COUNT(CASE WHEN loan_status IN ('Fully Paid','Current') THEN id END) * 100.0)
  / COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data;

-- Loan Status Summary
SELECT loan_status,
  COUNT(id) AS Applications,
  SUM(loan_amount) AS Funded_Amount,
  SUM(total_payment) AS Amount_Received
FROM bank_loan_data
GROUP BY loan_status;
```

---

## 📊 Power BI Dashboard — `Power BI/BANK LOAN DASHBOARD Final....pbix`

### Page 1 — Summary
- KPI cards for Total Applications, Funded Amount, Amount Received, Avg Interest Rate, Avg DTI
- **Good Loan vs. Bad Loan** section with percentages and absolute values
- Loan Status breakdown table (Fully Paid / Current / Charged Off)

### Page 2 — Overview
- **Monthly Trend** line chart — Applications over time
- **Regional Map** — Loan distribution by U.S. state
- **Loan Term** breakdown (36 vs. 60 months)
- **Employment Length** analysis
- **Loan Purpose** breakdown
- **Home Ownership** analysis
- 🔁 **Field Parameters** — Dynamic metric toggle (Applications / Funded / Received)

### Page 3 — Details
- Full granular grid view of all ~38,500 loan records
- Filterable by status, purpose, state, and date
- Page navigation buttons to switch between all three pages

---

## 🗃️ Dataset — `Raw Data/financial_loan.csv`

| Property | Value |
|----------|-------|
| Rows | ~38,500 loan records |
| Domain | Finance / Lending |
| Format | CSV |

**Key columns:**

| Column | Description |
|--------|-------------|
| `id` | Unique loan identifier |
| `loan_amount` | Amount funded to the borrower |
| `total_payment` | Total repayment received |
| `int_rate` | Interest rate (decimal) |
| `dti` | Debt-to-Income ratio (decimal) |
| `loan_status` | `Fully Paid` / `Current` / `Charged Off` |
| `issue_date` | Date the loan was issued |
| `address_state` | Borrower's U.S. state |
| `purpose` | Loan purpose (e.g., debt consolidation) |
| `home_ownership` | RENT / OWN / MORTGAGE |
| `term` | 36 months or 60 months |
| `emp_length` | Borrower's years of employment |

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| MS SQL Server | Data storage & KPI validation via SQL queries |
| Power BI Desktop | Dashboard design, DAX measures, data modeling |
| Power Query | Data cleaning & custom Date Table creation |
| DAX | MTD, MoM, and percentage calculated measures |

---

## 💡 Key DAX Measures

```dax
Total Loan Applications = COUNT(bank_loan_data[id])

MTD Loan Applications = 
    TOTALMTD(COUNT(bank_loan_data[id]), 'Date Table'[Date])

MoM Loan Applications = 
    DIVIDE([MTD Loan Applications] - [PMTD Loan Applications],
           [PMTD Loan Applications])

Good Loan % = 
    DIVIDE(
        CALCULATE(COUNT(bank_loan_data[id]),
            bank_loan_data[loan_status] IN {"Fully Paid","Current"}),
        COUNT(bank_loan_data[id])
    )
```

---

## 🚀 How to Use

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   ```

2. **Load the data into SQL Server**
   - Import `Raw Data/financial_loan.csv` into MS SQL Server
   - Run `SQL/SQLQuery bank loan.sql` to validate KPIs

3. **Open the Power BI file**
   - Open `Power BI/BANK LOAN DASHBOARD Final....pbix` in Power BI Desktop
   - Update the SQL Server connection string to your local instance
   - Click **Refresh** to load data

4. **Explore the dashboard**
   - Use the navigation buttons to switch between Summary, Overview, and Details pages
   - Use Field Parameters on the Overview page to toggle between metrics

---

## 📝 Key Learnings

- Writing SQL queries to pre-validate Power BI KPIs for accuracy
- Building a custom Date Table in Power Query for time intelligence
- Using **Field Parameters** for dynamic metric switching in visuals
- Designing multi-page dashboards with navigation buttons
- Structuring a finance dashboard for both executive summary and analyst drill-down views

---

## 👤 Author

**[Yogeshwaran Subramanian]**
- 🔗 [LinkedIn](www.linkedin.com/in/yogeshwaran-subramanian-371909270)
- 📧 yogeshsubramanian05@gmail.com

---
