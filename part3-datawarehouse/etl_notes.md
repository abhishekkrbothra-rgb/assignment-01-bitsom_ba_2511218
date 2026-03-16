ETL Decisions
Decision 1 — Standardizing Date Formats

Problem:
The raw dataset contained inconsistent date formats such as 01-01-2024, 2024/01/01, and Jan 1 2024. These variations make it difficult to perform time-based analysis and prevent proper joins with a date dimension table.

Resolution:
All dates were converted into the ISO standard format YYYY-MM-DD. This standardized format ensures compatibility with SQL databases and allows consistent joins between the fact_sales table and thedim_date dimension.

Decision 2 — Handling NULL Values

Problem:
Some records in the raw dataset had missing values for fields such as product category or store information. NULL values in analytical datasets can lead to inaccurate aggregations or incomplete reports.

Resolution:
Missing category values were filled by referencing the corresponding product records where available. If the information could not be recovered, a default category such as "Unknown" was assigned. This ensured that all records could still participate in aggregations without causing query failures.

Decision 3 — Standardizing Category Names

Problem:
The raw dataset contained inconsistent category casing such as "electronics", "Electronics", and "ELECTRONICS". This inconsistency would cause incorrect grouping when running analytical queries.

Resolution:
All category names were standardized using proper capitalization (e.g., "Electronics", "Clothing", "Groceries"). This ensures accurate grouping and aggregation during reporting queries.

