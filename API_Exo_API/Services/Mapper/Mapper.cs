using API = API_Exo_API.Models;
using DAL = DAL_Exo_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API_Exo_API.Services.Mapper
{
    public static class Mapper
    {
        public static DAL.Employee ToDAL(this API.Employee employee)
        {
            return new DAL.Employee{
                EmployeeId = employee.EmployeeId,
                FirstName = employee.FirstName,
                LastName = employee.LastName,
                UserName = employee.UserName,
                Password = employee.Password,
                Role = employee.Role
            };
        }
        public static API.Employee ToAPI(this DAL.Employee employee)
        {
            return new API.Employee
            {
                EmployeeId = employee.EmployeeId,
                FirstName = employee.FirstName,
                LastName = employee.LastName,
                UserName = employee.UserName,
                Password = employee.Password,
                Role = employee.Role
            };
        }

        public static DAL.Local ToDAL(this API.Local local)
        {
            return new DAL.Local
            {
                LocalId = local.LocalId,
                LocalName = local.LocalName,
                LocalFloor = local.LocalFloor
            };
        }
        public static API.Local ToAPI(this DAL.Local local)
        {
            return new API.Local
            {
                LocalId = local.LocalId,
                LocalName = local.LocalName,
                LocalFloor = local.LocalFloor
            };
        }
    }
}