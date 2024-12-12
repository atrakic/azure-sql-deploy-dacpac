CREATE TABLE [dbo].[DimCustomer] (
    [CustomerKey]    INT NOT NULL PRIMARY KEY,
    [FirstName]      VARCHAR (50)  NOT NULL,
    [LastName]       VARCHAR (50)  NULL,
    [AddressLine1]   VARCHAR (200) NULL,
    [City]           VARCHAR (50)  NULL,
    [PostalCode]     VARCHAR (20)  NULL
);


GO
