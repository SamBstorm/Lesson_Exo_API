using DAL_Exo_API.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Exo_API.Repositories
{
    public class EmployeeRepository : IEmployeeRepository<int, Employee>
    {

        private string _constring = ConfigurationManager.ConnectionStrings["Exo_API"].ConnectionString;

        public void Add(Employee entity)
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Employee_Add";
                    command.Parameters.AddWithValue("@firstName", entity.FirstName);
                    command.Parameters.AddWithValue("@lastName", entity.LastName);
                    command.Parameters.AddWithValue("@userName", entity.UserName);
                    command.Parameters.AddWithValue("@password", entity.Password);
                    command.Parameters.AddWithValue("@role", entity.Role);
                    connection.Open();
                    entity.EmployeeId = (int)command.ExecuteScalar();
                }
            }
        }

        public void ChangePassword(int id, string password)
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Employee_ChangePassword";
                    command.Parameters.AddWithValue("@empId", id);
                    command.Parameters.AddWithValue("@password", password);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public void Delete(int id)
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Employee_Delete";
                    command.Parameters.AddWithValue("@empId", id);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public IEnumerable<Employee> Get()
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Employee_GetAll";
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            yield return new Employee() {
                                EmployeeId = (int)reader["EmployeeId"],
                                FirstName = (string)reader["FirstName"],
                                LastName = (string)reader["LastName"],
                                UserName = (string)reader["UserName"],
                                Password = "********",
                                Role = (string)reader["Role"]
                            };
                        }
                    }
                }
            }
        }

        public Employee Get(int id)
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Employee_GetById";
                    command.Parameters.AddWithValue("empId", id);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Employee()
                            {
                                EmployeeId = (int)reader["EmployeeId"],
                                FirstName = (string)reader["FirstName"],
                                LastName = (string)reader["LastName"],
                                UserName = (string)reader["UserName"],
                                Password = "********",
                                Role = (string)reader["Role"]
                            };
                        }
                        else
                        {
                            return null;
                        }                        
                    }
                }
            }
        }

        public void SetAdmin(int id)
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Employee_SetAdmin";
                    command.Parameters.AddWithValue("@empId", id);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public void UnsetAdmin(int id)
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Employee_UnsetAdmin";
                    command.Parameters.AddWithValue("@empId", id);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public void Update(int id, Employee entity)
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Employee_Update";
                    command.Parameters.AddWithValue("@empId", id);
                    command.Parameters.AddWithValue("@firstName", entity.FirstName);
                    command.Parameters.AddWithValue("@lastName", entity.LastName);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
