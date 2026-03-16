Architecture Recommendation

For a fast-growing food delivery startup handling diverse data types such as GPS logs, customer reviews, payment transactions, and restaurant menu images, a Data Lakehouse architecture would be the most suitable solution.

A Data Lakehouse combines the flexibility of a data lake with the structured analytics capabilities of a data warehouse. This hybrid approach is ideal because the startup collects multiple types of data with very different formats and structures.
irst, the system needs to store highly diverse data. GPS location logs are time-series data, customer reviews are unstructured text, payment transactions are structured records, and menu images are binary media files. A traditional data warehouse is designed mainly for structured data and would struggle to efficiently store and process images or raw logs. A data lake component allows the system to store all raw data formats at scale.

Second, the company still needs powerful analytics for business intelligence. Managers may want reports such as delivery times by city, customer satisfaction trends, or revenue by restaurant. A lakehouse architecture allows structured analytical queries on top of the raw data using engines like DuckDB, Apache Spark, or Databricks.

Third, scalability is essential for a rapidly growing startup. Data lakes scale horizontally and can store massive amounts of data at relatively low cost. As the business grows and collects more user interactions, delivery logs, and restaurant data, the lakehouse architecture can expand without requiring major redesigns.

Therefore, a Data Lakehouse architecture offers the best balance of flexibility, scalability, and analytical capability for this use case.

