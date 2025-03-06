------------------------
-- create view Sales
------------------------
CREATE VIEW gold.sales
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awdatalakeafreen.dfs.core.windows.net/silver/Sales/',
        FORMAT = 'PARQUET'
    ) as quer1

------------------------
-- create view Calendar
------------------------
CREATE VIEW gold.calendar
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awdatalakeafreen.dfs.core.windows.net/silver/Calendar/',
        FORMAT = 'PARQUET'
    ) as quer1

------------------------
-- create view Customers
------------------------
CREATE VIEW gold.customer
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awdatalakeafreen.dfs.core.windows.net/silver/Customers/',
        FORMAT = 'PARQUET'
    ) as quer1

------------------------
-- create view ProductSubCategory
------------------------
CREATE VIEW gold.productsubcategories
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awdatalakeafreen.dfs.core.windows.net/silver/Product_Subcategories/',
        FORMAT = 'PARQUET'
    ) as quer1

------------------------
-- create view ProductCategories
------------------------
CREATE VIEW gold.productcategories
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awdatalakeafreen.dfs.core.windows.net/silver/ProductCategories/',
        FORMAT = 'PARQUET'
    ) as quer1

------------------------
-- create view Products
------------------------
CREATE VIEW gold.products
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awdatalakeafreen.dfs.core.windows.net/silver/Products/',
        FORMAT = 'PARQUET'
    ) as quer1

------------------------
-- create view Returns
------------------------
CREATE VIEW gold.returns
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awdatalakeafreen.dfs.core.windows.net/silver/Returns/',
        FORMAT = 'PARQUET'
    ) as quer1

   
------------------------
-- create view Territories
------------------------
CREATE VIEW gold.Territories
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awdatalakeafreen.dfs.core.windows.net/silver/Territories/',
        FORMAT = 'PARQUET'
    ) as quer1