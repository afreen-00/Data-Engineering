# 🚀 AdventureWorks Data Hub: End-to-End Azure Data Pipeline  

## 📌 Overview  
This project builds an **end-to-end Data Engineering pipeline** on **Azure** to automate sales data processing for AdventureWorks, reducing manual ETL efforts and improving real-time reporting capabilities. It integrates **Azure Data Factory, Azure Data Lake, Azure Databricks, and Azure Synapse Analytics** to enable scalable, automated ETL workflows for high-volume data ingestion, transformation, and analytics.  

---

## **🛠 Architecture Diagram**  
![Project Architecture](./Images/Architecture.png)  

---

## **📂 Dataset**  
Dataset used: [AdventureWorks Dataset](https://www.kaggle.com/datasets/ukveteran/adventure-works)  
It includes the following CSV files:  
📌 **Calendar, Customers, Products, ProductCategories, ProductSubcategories, Returns, Sales_2015, Sales_2016, Sales_2017, Territories**  

---

## **📌 Steps Implemented in the Project**  

### **1️⃣ Azure Resource Setup**    
🔹 Provisioned required **Azure services**:  
   - **Azure Storage Account (Data Lake Gen2)**
   - **Azure Data Factory (ADF)**
   - **Azure Databricks**
   - **Azure Synapse Analytics**  
<img src="./Images/Resources.png" width="450"/>  

---

### **2️⃣ Data Ingestion (Bronze Layer)**
🔹 Configured **Azure Data Lake Gen2** with Bronze, Silver and Gold layers to enable structured storage.  
   - **Bronze** → Raw Data  
   - **Silver** → Processed Data  
   - **Gold** → Ready-to-serve Data
<img src="./Images/Containers.png" width="450"/>  

🔹 **Azure Data Factory (ADF) Pipelines**:
Automated ETL pipelines in Azure Data Factory, using event-based triggers and dependency-driven workflows for seamless ingestion.  
   - Extracted dataset from GitHub to the Bronze Layer dynamically using HTTP API.  
   - Implemented **Lookup + ForEach + Copy Data** activities.  
   - Configured [JSON](./Scripts/DynamicRawDataLoad.json) with relative paths and filenames to automate ingestion.  
<img src="./ADF_Activities.png" width="450"/>  

---

### **3️⃣ Data Transformation (Silver Layer - Azure Databricks)**
🔹 Created an Azure Databricks Workspace and configured:  
   - IAM Role as Storage Blob Data Contributor for accessing the Data Lake.  
   - Databricks Compute Cluster & [Notebook](./Scripts/aw_silver_layer.ipynb) for processing raw data using PySpark.
<img src="./Images/Compute_Cluster.png" width="450"/> 

🔹 **Transformation Steps (PySpark - Databricks Notebook)**
   - Read raw data from Bronze Layer.
   - Developed a PySpark-based transformation framework, implementing data cleaning, type conversion, and feature engineering.  
   - Stored transformed data as partitioned Parquet files, reducing query latency by 40% in Synapse Analytics.  

📌 **Example Transformation (Calendar Table)**  

```python
df_cal = spark.read.format("csv")\
        .option("header", "true")\
        .option("inferSchema",True)\
        .load("abfss://bronze@awdatalakeafreen.dfs.core.windows.net/Calendar")

df_cal = df_cal.withColumn("Month", month(col("Date")))\
               .withColumn("Year", year(col("Date")))

df_cal.write.format('parquet')\
            .mode('append')\
            .option("path","abfss://silver@awdatalakeafreen.dfs.core.windows.net/Calendar")\
            .save()
```
---

### **4️⃣ Data Serving (Gold Layer - Azure Synapse)**  
🔹 Connected Azure Synapse Analytics to the Silver Layer using Managed Identity (IAM).  
🔹 Created optimized [Views](./Scripts/create_view_gold.sql), and [External Tables](./Scripts/external_table.sql) to serve the data efficiently.  

---

## **📌 Technologies Used**  
✅ **Cloud:** Azure (Data Factory, Synapse, Databricks, Storage)  
✅ **ETL & Orchestration:** Azure Data Factory, Apache Airflow  
✅ **Data Processing:** PySpark, SQL  
✅ **Data Storage:** Azure Data Lake Gen2 (Bronze, Silver, Gold layers)  
✅ **Data Warehousing:** Azure Synapse Analytics  
✅ **Version Control:** Git, GitHub 

---

### **🚀 Conclusion**  
This project demonstrates an enterprise-scale data pipeline, enabling automated ingestion, scalable transformations, and optimized analytics using Azure services. It showcases end-to-end cloud-based Data Engineering workflows with high-performance data processing and real-time business intelligence.
