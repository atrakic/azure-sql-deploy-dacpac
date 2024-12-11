CREATE TABLE [dbo].[DimProduct] (
    -- Update comment
    [ProductKey]    INT NOT NULL PRIMARY KEY,
    [ProductAltKey] VARCHAR (25) NULL,
    [ProductName]   VARCHAR (50) NOT NULL,
    [Category]      VARCHAR (50) NULL,
    [ListPrice]     DECIMAL (18) NULL
);


GO
