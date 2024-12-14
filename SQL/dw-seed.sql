-- Insert sample data into the Customers table
MERGE INTO DimCustomer AS target
USING (VALUES
    (1, 'John', 'Doe', '123 Main St', 'Springfield', '12345'),
    (2, 'Jane', 'Doe', '456 Elm St', 'Springfield', '12345'),
    (3, 'Alice', 'Smith', '789 Oak St', 'Springfield', '12345')
) AS source (CustomerKey, FirstName, LastName, AddressLine1, City, PostalCode)
ON target.CustomerKey = source.CustomerKey
WHEN NOT MATCHED BY TARGET THEN
    INSERT (CustomerKey, FirstName, LastName, AddressLine1, City, PostalCode)
    VALUES (source.CustomerKey, source.FirstName, source.LastName, source.AddressLine1, source.City, source.PostalCode);

-- Insert sample data into the DimProducts table
MERGE INTO DimProduct AS target
USING (VALUES
    (1, 'Bike', 'BK-001', 1000.00),
    (2, 'Car', 'CR-001', 2000.00),
    (3, 'Truck', 'TR-001', 3000.00)
) AS source (ProductKey, ProductName, Category, ListPrice)
ON target.ProductKey = source.ProductKey
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductKey, ProductName, Category, ListPrice)
    VALUES (source.ProductKey, source.ProductName, source.Category, source.ListPrice);

-- Insert sample data into the DimDate table
MERGE INTO DimDate AS target
USING (VALUES
    (1, '2020-01-01'),
    (2, '2020-01-02'),
    (3, '2020-01-03')
) AS source (DateKey, Date)
ON target.DateKey = source.DateKey
WHEN NOT MATCHED BY TARGET THEN
    INSERT (DateKey, Date)
    VALUES (source.DateKey, source.Date);

-- Insert sample data into the FactSales table
MERGE INTO FactSalesOrder AS target
USING (VALUES
    (1, 1, 1, 1, 1, 1000.00),
    (2, 2, 2, 2, 2, 4000.00),
    (3, 3, 3, 3, 3, 9000.00)
) AS source (SalesOrderKey, SalesOrderDateKey, ProductKey, CustomerKey, Quantity, SalesTotal)
ON target.SalesOrderKey = source.SalesOrderKey
WHEN NOT MATCHED BY TARGET THEN
    INSERT (SalesOrderKey, SalesOrderDateKey, ProductKey, CustomerKey, Quantity, SalesTotal)
    VALUES (source.SalesOrderKey, source.SalesOrderDateKey, source.ProductKey, source.CustomerKey, source.Quantity, source.SalesTotal);
