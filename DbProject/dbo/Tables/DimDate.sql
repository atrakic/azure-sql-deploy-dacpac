CREATE TABLE [dbo].[DimDate]
(
    [DateKey] INT NOT NULL PRIMARY KEY,
    [Date] DATE NOT NULL
);
GO

CREATE INDEX IX_DimDate_DateKey ON [dbo].[DimDate] ([DateKey]);
GO
