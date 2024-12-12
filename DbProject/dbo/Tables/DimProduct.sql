CREATE TABLE [dbo].[DimProduct] (
    [ProductKey]    INT NOT NULL PRIMARY KEY,
    [ProductName]   VARCHAR (50) NOT NULL,
    [Category]      VARCHAR (50) NULL,
    [ListPrice]     DECIMAL (18) NULL
);


GO
