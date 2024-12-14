CREATE TABLE [dbo].[DimProduct]
(
    [ProductKey] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [ProductName] VARCHAR (50) NOT NULL,
    [Category] VARCHAR (50) NOT NULL,
    [ListPrice] DECIMAL (18, 2) NOT NULL
);
GO

CREATE INDEX IX_DimProduct_Name ON [dbo].[DimProduct] ([ProductName]);
GO

CREATE INDEX IX_DimProduct_Category ON [dbo].[DimProduct] ([Category]);
GO

ALTER TABLE [dbo].[DimProduct]
ADD CONSTRAINT AK_DimProduct UNIQUE ([ProductName], [Category]);
GO
