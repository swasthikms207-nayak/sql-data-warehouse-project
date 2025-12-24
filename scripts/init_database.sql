/**********************************************************************
-- Script:      Create DataWarehouse Database and Schemas
-- Purpose:     This script creates a fresh DATAWAREHOUSE database 
--              with Bronze, Silver, and Gold schemas for Medallion 
--              architecture in SQL Server.
-- Warning:     This script will DROP the existing DATAWAREHOUSE 
--              database if it exists. ALL data in the existing 
--              database will be lost. Use carefully.
**********************************************************************/

-- Switch to the system database (required for create/drop database operations)
USE master;
GO

-- Check if the DATAWAREHOUSE database already exists
-- If it exists, force close active connections and drop it
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DATAWAREHOUSE')
BEGIN
    ALTER DATABASE DATAWAREHOUSE 
    SET SINGLE_USER 
    WITH ROLLBACK IMMEDIATE;  -- Rollback all active transactions

    DROP DATABASE DATAWAREHOUSE;  -- Remove the existing database
END
GO

-- Create a fresh DATAWAREHOUSE database
CREATE DATABASE DATAWAREHOUSE;
GO

-- Switch context to the newly created database
USE DATAWAREHOUSE;
GO

-- Create Bronze schema for raw/source data
CREATE SCHEMA bronze;
GO

-- Create Silver schema for cleaned and transformed data
CREATE SCHEMA silver;
GO

-- Create Gold schema for business-ready and analytics data
CREATE SCHEMA gold;
GO
