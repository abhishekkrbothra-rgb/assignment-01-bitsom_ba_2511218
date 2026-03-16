Storage Systems

To meet the hospital network’s four goals, the system uses a combination of specialized storage technologies. For predicting patient readmission risk, historical treatment records and structured patient data would be stored in a relational database such as PostgreSQL. This database ensures strong transactional consistency for critical healthcare records and supports structured queries required for machine learning model training.

For the natural language query system used by doctors, patient notes and clinical reports would be converted into embeddings and stored in a vector database such as FAISS or Pinecone. This allows semantic search so that doctors can ask questions in plain English and retrieve relevant patient history.

For monthly reporting and hospital management dashboards, data would be transformed and loaded into a data warehouse such as Snowflake or Amazon Redshift. This warehouse would store aggregated metrics such as bed occupancy rates and departmental costs for fast analytical queries.

Finally, real-time vitals streaming from ICU devices would be handled using a streaming system such as Apache Kafka, which captures continuous sensor data and stores it in a scalable data lake for monitoring and analysis.

OLTP vs OLAP Boundary

The OLTP (Online Transaction Processing) system includes the hospital’s operational databases where patient admissions, treatments, and clinical updates are recorded. These systems require high consistency and rapid transaction processing to ensure accurate patient records.

The OLAP (Online Analytical Processing) layer begins once data is extracted from the transactional system through ETL pipelines. Cleaned and aggregated data is then loaded into the data warehouse for reporting and analytics. Machine learning models that predict readmission risk also operate on this analytical dataset rather than the live transactional system. This separation prevents analytical workloads from affecting critical hospital operations.

Trade-offs

One major trade-off in this architecture is system complexity. Using multiple specialized systems—relational databases, vector databases, streaming platforms, and data warehouses—introduces additional operational overhead and integration challenges.

To mitigate this, the hospital could implement centralized orchestration and data pipelines using tools such as Apache Airflow. Airflow would automate data ingestion, transformation, and synchronization between systems. Additionally, clear data governance policies and monitoring tools would ensure reliability across the architecture.

While the architecture is more complex than a single-database solution, the benefits include scalability, flexibility, and the ability to support advanced AI features such as predictive analytics and semantic search.

