using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API_Exo_API.Models
{
    public class EmployeeDetails
    {
        public Employee Employee { get; set; }
        public IEnumerable<Local> Locals { get; set; }
    }
}