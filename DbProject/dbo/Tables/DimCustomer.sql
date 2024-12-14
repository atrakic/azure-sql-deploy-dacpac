CREATE TABLE [dbo].[DimCustomer]
(
    [CustomerKey] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [FirstName] VARCHAR (50) NOT NULL,
    [LastName] VARCHAR (50) NOT NULL,
    [AddressLine1] VARCHAR (200) NOT NULL,
    [City] VARCHAR (50) NOT NULL,
    [PostalCode] VARCHAR (20) NOT NULL,
    [SurrogateKey] INT NOT NULL
);
GO

CREATE INDEX IX_DimCustomer_Name ON [dbo].[DimCustomer] ([FirstName], [LastName]);
GO
CREATE INDEX IX_DimCustomer_Address ON [dbo].[DimCustomer] ([AddressLine1], [City], [PostalCode]);
GO

ALTER TABLE [dbo].[DimCustomer]
ADD CONSTRAINT AK_DimCustomer UNIQUE ([FirstName], [LastName], [AddressLine1], [City], [PostalCode]);
GO
