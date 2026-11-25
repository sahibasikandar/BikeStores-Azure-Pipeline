-- CREATE DATABASE bikestores_gold;
-- GO
-- USE bikestores_gold;

CREATE OR ALTER VIEW dbo.daily_sales AS
SELECT * FROM OPENROWSET(
    BULK 'https://myolympicdatastorage.dfs.core.windows.net/bikestores/gold/daily_sales/',
    FORMAT = 'DELTA') AS r;
GO
CREATE OR ALTER VIEW dbo.monthly_sales AS
SELECT * FROM OPENROWSET(
    BULK 'https://myolympicdatastorage.dfs.core.windows.net/bikestores/gold/monthly_sales/',
    FORMAT = 'DELTA') AS r;
GO
CREATE OR ALTER VIEW dbo.top_products AS
SELECT * FROM OPENROWSET(
    BULK 'https://myolympicdatastorage.dfs.core.windows.net/bikestores/gold/top_products/',
    FORMAT = 'DELTA') AS r;
GO
CREATE OR ALTER VIEW dbo.customer_lifetime_value AS
SELECT * FROM OPENROWSET(
    BULK 'https://myolympicdatastorage.dfs.core.windows.net/bikestores/gold/customer_lifetime_value/',
    FORMAT = 'DELTA') AS r;
GO
CREATE OR ALTER VIEW dbo.store_sales AS
SELECT * FROM OPENROWSET(
    BULK 'https://myolympicdatastorage.dfs.core.windows.net/bikestores/gold/store_sales/',
    FORMAT = 'DELTA') AS r;
GO
