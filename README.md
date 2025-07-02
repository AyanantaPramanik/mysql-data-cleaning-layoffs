# Layoffs Data Cleaning and EDA with MySQL

## 📌 Project Overview

This project showcases a full data pipeline using SQL in MySQL Workbench:  
1. **Data Cleaning:** Standardizing and preparing raw layoffs data.  
2. **Exploratory Data Analysis (EDA):** Deriving key insights and trends from the cleaned data.

The dataset consists of information about tech layoffs globally — including companies, industries, countries, funding stages, dates, and numbers of employees laid off.

---

## 🧹 Part 1: Data Cleaning

**Goal:** Prepare raw data for analysis by removing inconsistencies, duplicates, blanks, and formatting issues.

### ✅ Key Cleaning Steps
- Removed duplicates using `ROW_NUMBER()` in a CTE
- Trimmed whitespace and standardized company & country names
- Converted string dates into `DATE` format using `STR_TO_DATE()`
- Removed rows with NULL/blank values in key columns
- Dropped unnecessary columns and created new formatted fields
- Re-structured table `layoffs_staging2` to hold cleaned data

### 🛠️ Techniques Used
- CTEs
- `ROW_NUMBER()`, `TRIM()`, `FORMAT()`, `STR_TO_DATE()`
- `UPDATE`, `DELETE`, `ALTER TABLE`
- Conditional joins to fill missing values

---

## 📊 Part 2: Exploratory Data Analysis (EDA)

**Goal:** Explore patterns and trends in layoffs data using SQL.

### 🔍 Key Questions Explored
- Which companies laid off the most employees?
- Which industries and countries were most affected?
- How have layoffs changed over time?
- What stages of funding are most associated with layoffs?
- Who were the top 5 companies with the most layoffs each year?

### 📌 Key Insights
- 📈 Layoffs peaked in late 2022 and early 2023
- 🌍 USA and India were the most affected countries
- 🏢 Google, Meta, and Amazon had some of the highest layoffs
- 🧠 Most layoffs occurred in "Post-IPO" and "Series C" funding stages
- 📆 Monthly rolling totals showed rising trends through pandemic years

### 🛠️ Techniques Used
- Aggregations with `GROUP BY`, `SUM()`
- Time-based queries using `YEAR()`, `SUBSTRING()`
- `DENSE_RANK()` to rank top companies per year
- Rolling total using `SUM() OVER(ORDER BY Month)`
- CTEs for advanced grouping and filtering

---

## 🗃️ Dataset

A cleaned layoffs dataset originally containing fields like:
- `Company`, `Location`, `Industry`, `Total Laid Off`, `Percentage Laid Off`
- `Date`, `Stage`, `Country`, `Funds Raised`

*Note: Source anonymized for public sharing.*

## 🧑‍💻 Author  
**(Ayananta Pramanik)**  
[GitHub Profile](https://github.com/AyanantaPramanik)


---

## 📁 File Structure

```bash
sql/
├── layoffs_data_cleaning.sql   # Data cleaning workflow
└── layoffs_eda.sql             # EDA queries and insights
