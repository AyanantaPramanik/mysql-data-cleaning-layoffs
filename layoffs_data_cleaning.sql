-- Data Cleaning

SELECT *
FROM layoffs
;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or blank values
-- 4. Remove Any Columns


-- REMOVING DUPLICATES

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs staging;

INSERT layoffs_staging
SELECT *
FROM laylayoffs_stagingoffs;


SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date` , stage, country, funds_raised) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS
( 
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date` , stage, country, funds_raised) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` double DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM layoffs_staging2
WHERE row_num > 1;


INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date` , stage, country, funds_raised) AS row_num
FROM layoffs_staging;

DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

SELECT *
FROM layoffs_staging2;


-- STANDARDIZE THE DATA

SELECT company
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

-- SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
-- FROM layoffs staging2
-- ORDER BY 1;

-- UPDATE layoffs_staging2
-- SET country = TRIM(TRAILING '.' FROM country)
-- WHERE country LIKE 'United States%';

SELECT *
FROM layoffs_staging2
ORDER BY 1;

SELECT `date`
FROM layoffs staging2;

UPDATE layoffs_staging2
SET `date` = DATE(STR_TO_DATE(`date`, '%Y-%m-%dT%H:%i:%s.000Z'));

ALTER TABLE layoffs_staging2 MODIFY COLUMN `date` DATE;

-- Null or Blank Values

SELECT *
FROM layoffs_staging2;

-- SELECT *
-- FROM layoffs staging2
-- WHERE total_laid_off IS NULL
-- AND percentage_laid_off IS NULL;

-- SELECT *
-- FROM layoffs_staging2 t1
-- JOIN layoffs_staging2 t2
-- 	 ON t1.company = t2.company
-- WHERE (t1.industry IS NULL OR t1.industry = '')
-- AND t2.industry IS NOT NULL;

-- UPDATE layoffs_staging2 t1
-- JOIN layoffs_staging2 t2
-- 	 ON t1.company = t2.company
-- SET t1.industry = t2.industry
-- WHERE t1.industry IS NULL
-- AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging2
WHERE TRIM(percentage_laid_off) = ''
   OR TRIM(funds_raised) = ''
   OR percentage_laid_off IS NULL
   OR funds_raised IS NULL;

DELETE
FROM layoffs_staging2
WHERE TRIM(percentage_laid_off) = ''
   OR TRIM(funds_raised) = ''
   OR percentage_laid_off IS NULL
   OR funds_raised IS NULL;
   
-- Removing Columns
   
ALTER TABLE layoffs_staging2 DROP COLUMN `date_converted`;

ALTER TABLE layoffs_staging2 DROP COLUMN `row_num`;   


SELECT *
FROM layoffs_staging2;
