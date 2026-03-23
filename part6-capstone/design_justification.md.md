
## Storage Systems
For patient readmission prediction, a cloud data warehouse (e.g., BigQuery or Snowflake) is chosen for its scalability and analytical processing speed. Patient history queries use an OLTP database such as PostgreSQL or Azure SQL, ensuring fast updates and low-latency lookups. Reporting uses the data warehouse as the single point of truth. Real-time ICU vitals stream into a time-series database like InfluxDB or a streaming platform such as Kafka before being stored in long-term cold storage.

## OLTP vs OLAP Boundary
The boundary is clearly drawn where operational systems (patient records, appointments, vitals) feed into ETL pipelines. OLTP handles write-heavy patient updates, while OLAP handles analytics, AI models, and monthly reporting. No analytics run on OLTP to avoid performance degradation.

## Trade-offs
A trade-off exists between real-time streaming complexity and long-term stability. Real-time ingestion adds operational overhead and cost. To mitigate this, a managed streaming service and auto-scaling storage ensure reliability without excessive manual maintenance.
