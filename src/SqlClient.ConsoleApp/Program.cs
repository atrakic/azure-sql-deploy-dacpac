using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Diagnostics;
using Microsoft.Data.SqlClient;
using System.Threading.Tasks;
using static System.Console;

using Microsoft.Extensions.Logging;
using Microsoft.Extensions.DependencyInjection;

namespace SqlClient.ConsoleApp
{
    class Program
    {
        static async Task Main(string[] args)
        {

            var serviceProvider = new ServiceCollection()
                .AddLogging(configure => configure.AddConsole())
                .BuildServiceProvider();

            var logger = serviceProvider.GetService<ILogger<Program>>();


            string connection = Environment.GetEnvironmentVariable("ConnectionString")
                        ?? throw new ArgumentException("Missing 'ConnectionString' env variable");

            if (args.Length == 0)
            {
                logger.LogInformation("Please provide the path to the SQL file:");
                string filePath = ReadLine();
                if (string.IsNullOrEmpty(filePath))
                {
                    logger.LogError("Missing SQL file argument");
                    throw new ArgumentException("Missing SQL file argument");
                }
                args = new string[] { filePath };
            }

            try
            {
                string _sql = System.IO.File.ReadAllText(args[0]);
                SqlConnection conn = new SqlConnection(connection);
                conn.Open();

                var logMessage = new
                {
                    Message = "Connected to SQL Server: ",
                    ServerVersion = conn.ServerVersion,
                    OSVersion = Environment.OSVersion.VersionString
                };
                logger.LogInformation(JsonSerializer.Serialize(logMessage));

                SqlCommand cmd = new SqlCommand(_sql, conn);
                var qr = await cmd.ExecuteScalarAsync();
                logger.LogInformation($"Query from file: {args[0]} executed successfully.");
                logger.LogInformation($"Result: {qr}");
                conn.Close();
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "An error occurred while executing the SQL file.");
            }
        }
    }
}
