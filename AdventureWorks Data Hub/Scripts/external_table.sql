CREATE DATABASE SCOPED CREDENTIAL cred_afreen
WITH
    IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE silver_source
WITH
(
    LOCATION = 'https://awdatalakeafreen.dfs.core.windows.net/silver',
    CREDENTIAL = cred_afreen
)

CREATE EXTERNAL DATA SOURCE gold_source
WITH
(
    LOCATION = 'https://awdatalakeafreen.dfs.core.windows.net/gold',
    CREDENTIAL = cred_afreen
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

---------------------------------------
-- Create External Table EXTSALES
--------------------------------------
CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.sales

---------------------------------------
-- Create External Table EXTCALENDAR
--------------------------------------
CREATE EXTERNAL TABLE gold.extcalendar
WITH
(
    LOCATION = 'extcalendar',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.calendar

---------------------------------------
-- Create External Table EXTCUSTOMERS
--------------------------------------
CREATE EXTERNAL TABLE gold.extcustomers
WITH
(
    LOCATION = 'extcustomers',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.customer

---------------------------------------
-- Create External Table EXTProductSubCategories
--------------------------------------
CREATE EXTERNAL TABLE gold.extproductsubcategories
WITH
(
    LOCATION = 'extproductsubcategories',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.productsubcategories

---------------------------------------
-- Create External Table EXTProductCategories
--------------------------------------
CREATE EXTERNAL TABLE gold.extproductcategories
WITH
(
    LOCATION = 'extproductcategories',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.productcategories

---------------------------------------
-- Create External Table EXTProducts
--------------------------------------
CREATE EXTERNAL TABLE gold.extproducts
WITH
(
    LOCATION = 'extproducts',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.products

---------------------------------------
-- Create External Table EXTRETURNS
--------------------------------------
CREATE EXTERNAL TABLE gold.extreturns
WITH
(
    LOCATION = 'extreturns',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.returns

---------------------------------------
-- Create External Table EXTTERRITORIES
--------------------------------------
CREATE EXTERNAL TABLE gold.extterritories
WITH
(
    LOCATION = 'extterritories',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.territories
