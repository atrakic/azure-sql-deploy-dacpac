CREATE TABLE [dbo].[FactSalesOrder]
(
    [SalesOrderKey] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [SalesOrderDateKey] INT NOT NULL,
    [ProductKey] INT NOT NULL,
    [CustomerKey] INT NOT NULL,
    [Quantity] INT NOT NULL DEFAULT 0,
    [SalesTotal] DECIMAL (18, 2) NOT NULL DEFAULT 0.00,

    CONSTRAINT [FK_FactSalesOrder_DimDate] FOREIGN KEY ([SalesOrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactSalesOrder_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey]),
    CONSTRAINT [FK_FactSalesOrder_DimCustomer] FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer] ([CustomerKey])
);
GO

CREATE INDEX IX_FactSalesOrder_DateKey ON [dbo].[FactSalesOrder] ([SalesOrderDateKey]);
GO
CREATE INDEX IX_FactSalesOrder_ProductKey ON [dbo].[FactSalesOrder] ([ProductKey]);
GO
CREATE INDEX IX_FactSalesOrder_CustomerKey ON [dbo].[FactSalesOrder] ([CustomerKey]);
GO
