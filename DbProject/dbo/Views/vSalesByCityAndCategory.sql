
CREATE VIEW vSalesByCityAndCategory
AS
        SELECT
                c.City,
                p.Category,
                SUM(f.Quantity) AS TotalQuantity,
                SUM(f.SalesTotal) AS TotalSales
        FROM
                dbo.FactSalesOrder f
                INNER JOIN dbo.DimCustomer c ON f.CustomerKey = c.CustomerKey
                INNER JOIN dbo.DimProduct p ON f.ProductKey = p.ProductKey
        GROUP BY
                c.City,
                p.Category

GO
