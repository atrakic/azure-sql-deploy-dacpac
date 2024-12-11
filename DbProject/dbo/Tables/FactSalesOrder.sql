CREATE TABLE [dbo].[FactSalesOrder]
(
    [SalesOrderKey] INT NOT NULL,
    [SalesOrderDateKey] INT NOT NULL,
    [ProductKey] INT NOT NULL,
    [CustomerKey] INT NOT NULL,
    [Quantity] INT NULL,
    [SalesTotal] DECIMAL (18) NULL

    CONSTRAINT [PK_FactSalesOrder] PRIMARY KEY CLUSTERED ([SalesOrderKey] ASC),
    CONSTRAINT [FK_FactSalesOrder_DimDate] FOREIGN KEY ([SalesOrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactSalesOrder_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey]),
    CONSTRAINT [FK_FactSalesOrder_DimCustomer] FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer] ([CustomerKey])
);

GO
