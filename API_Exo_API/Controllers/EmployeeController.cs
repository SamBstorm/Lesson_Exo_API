using API_Exo_API.Models;
using API_Exo_API.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace API_Exo_API.Controllers
{
    [RoutePrefix("api")]
    public class EmployeeController : ApiController
    {
        private EmployeeService _service = new EmployeeService();

        [AcceptVerbs("GET")]
        [Route("Employee")]
        public IEnumerable<Employee> RetrieveAll()
        {
            return _service.Get();
        }

        [AcceptVerbs("GET")]
        [Route("Employee/{id}")]
        public Employee Retrieve(int id)
        {
            return _service.Get(id);
        }

        [AcceptVerbs("POST")]
        [Route("Secure/Employee")]
        public void Register(Employee employee)
        {
            _service.Add(employee);
        }

        [AcceptVerbs("PUT")]
        [Route("Secure/Employee")]
        public void ChangePassword(int id, string password)
        {
            _service.ChangePassword(id,password);
        }

        [AcceptVerbs("PUT")]
        [Route("Secure/Employee/{id}")]
        public void ChangeInfo(int id, Employee employee)
        {
            _service.Update(id, employee);
        }

        [AcceptVerbs("PUT", "POST")]
        [Route("Secure/Employee/{id}/SetAdmin")]
        public void SetAdmin(int id)
        {
            _service.SetAdmin(id);
        }
        [AcceptVerbs("PUT", "POST")]
        [Route("Secure/Employee/{id}/UnsetAdmin")]
        public void UnsetAdmin(int id)
        {
            _service.UnsetAdmin(id);
        }
    }
}
