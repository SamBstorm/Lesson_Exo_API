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
    public class LocalRepository : ILocalRepository<int, Local>
    {
        private string _constring = ConfigurationManager.ConnectionStrings["Exo_API"].ConnectionString;
        public void Add(Local entity)
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Local_Add";
                    command.Parameters.AddWithValue("name", entity.LocalName);
                    command.Parameters.AddWithValue("Floor", entity.LocalFloor);
                    connection.Open();
                    entity.LocalId = (int)command.ExecuteScalar();
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
                    command.CommandText = "SP_Local_Delete";
                    command.Parameters.AddWithValue("id", id);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public IEnumerable<Local> Get()
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Local_GetAll";
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            yield return new Local()
                            {
                                LocalId = (int)reader["LocalId"],
                                LocalName = (string)reader["LocalName"],
                                LocalFloor = (int)reader["LocalFloor"]
                            };
                        }
                    }
                }
            }
        }

        public Local Get(int id)
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Local_GetById";
                    command.Parameters.AddWithValue("id", id);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Local()
                            {
                                LocalId = (int)reader["LocalId"],
                                LocalName = (string)reader["LocalName"],
                                LocalFloor = (int)reader["LocalFloor"]
                            };
                        }
                        return null;
                    }
                }
            }
        }

        public void Update(int id, Local entity)
        {
            using (SqlConnection connection = new SqlConnection(_constring))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "SP_Local_Update";
                    command.Parameters.AddWithValue("id", id);
                    command.Parameters.AddWithValue("name", entity.LocalName);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
