# Layoffs Data Cleaning with MySQL

## 🧹 Project Overview

This project focuses on data cleaning techniques using MySQL. The raw dataset containing information about tech layoffs was cleaned and standardized to prepare it for analysis.

The operations include:
- Removing duplicates
- Standardizing text fields
- Handling NULL and blank values
- Formatting date and numeric fields
- Dropping unnecessary columns

## 🛠️ Tools & Technologies
- MySQL Workbench
- SQL (CTEs, Window Functions, String Functions, Date Functions)

## 📁 Dataset
The dataset used contains layoffs data from various companies, including fields such as:
- Company, Location, Industry
- Number of Employees Laid Off
- Date, Stage, Country
- Funds Raised

*Note: Data source anonymized for public sharing.*

## 🧠 Key Techniques Used
- `ROW_NUMBER()` for duplicate identification
- `TRIM()`, `FORMAT()`, `STR_TO_DATE()` for standardization
- `UPDATE`, `JOIN`, and `DELETE` for cleaning operations
- Schema restructuring using `ALTER TABLE`

## 📊 Output
The cleaned table `layoffs_staging2` contains:
- Accurate and standardized records
- No NULLs or blanks in critical fields
- Consistent formatting for dates and numeric values

This cleaned data is ready for downstream analytics or visualization projects.

## 📂 File Structure
```bash
sql/
└── layoffs_data_cleaning.sql   # The SQL script for full cleaning workflow

## 🧑‍💻 Author  
**(Ayananta Pramanik)**  
[GitHub Profile](https://github.com/AyanantaPramanik)
