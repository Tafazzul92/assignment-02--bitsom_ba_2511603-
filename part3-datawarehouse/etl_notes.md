**## ETL Decisions**



**###Decision 1 — Standardizing Date Formats**



Problem:  

The raw CSV had dates written in multiple formats — some rows used DD/MM/YYYY, others used MM-DD-YY, and a few had month names spelled out. This made it impossible to load dates consistently into the dim\_date table or generate reliable time‑based reports.



Resolution:  

I converted every date into a single format: YYYY-MM-DD. After standardizing, I generated a date\_id key in the form YYYYMMDD so the fact table could link cleanly to the date dimension.





**Decision 2 — Fixing Inconsistent Category Names**



Problem:  

Product categories in the raw data were inconsistent. For example, “electronics”, “Electronics”, and “ELECTRONICS” all appeared in different rows. This inconsistency would have caused duplicate categories in the product dimension and inaccurate roll‑up totals in BI queries.



Resolution:  

I standardized all category values to a single, clean format with proper casing (e.g., “Electronics”, “Clothing”, “Grocery”). This ensured that the dim\_product table had one consistent category per product.





**Decision 3 — Handling Missing or Null Store Information**



Problem:  

Some rows in the raw file had missing store names or incomplete city information. If loaded directly, these NULLs would break foreign key relationships and produce gaps in store‑level reporting.



Resolution:  

I cleaned the store data by filling missing values with corrected or verified names from other rows. When a store name was completely missing, I assigned a standardized placeholder (e.g., “Unknown Store”) to maintain referential integrity and allow the fact rows to load without errors.

