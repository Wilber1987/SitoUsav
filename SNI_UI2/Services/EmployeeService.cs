using System.Collections.Generic;
using System.Data.SqlClient;
using SNI_UI2.CAPA_NEGOCIO;

namespace SNI_UI2.Services
{
    public class EmployeeService
    {
        private readonly string connectionString;

        public EmployeeService(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public List<Employee> GetEmployees()
        {
            List<Employee> employees = new List<Employee>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT EmployeeId, Name, Position, Experience FROM Employees";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Employee employee = new Employee
                            {
                                EmployeeId = Convert.ToInt32(reader["EmployeeId"]),
                                Name = reader["Name"].ToString(),
                                Position = reader["Position"].ToString(),
                                Experience = Convert.ToInt32(reader["Experience"])
                            };

                            employees.Add(employee);
                        }
                    }
                }
            }

            return employees;
        }
    }
}

