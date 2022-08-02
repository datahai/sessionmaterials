--Create a new Serverless SQL Pools database
CREATE DATABASE SQLPipelines;

--Switch to the new database
USE SQLPipelines;

--Create a schema to hold our objects
CREATE SCHEMA LDW authorization dbo;

--encryption to allow authentication
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<password>';

--Create a credential using Managed Identity
CREATE DATABASE SCOPED CREDENTIAL DataLakeManagedIdentity
WITH IDENTITY='Managed Identity'

--Create a data source for use in queries
CREATE EXTERNAL DATA SOURCE ExternalDataSourceDataLakeUKMI
	WITH (
		LOCATION   = 'https://<storage>.dfs.core.windows.net/datalakehouseuk',
        CREDENTIAL = DataLakeManagedIdentity
	    );

--enable support for UTF8
ALTER DATABASE SQLFlorida COLLATE Latin1_General_100_BIN2_UTF8;
