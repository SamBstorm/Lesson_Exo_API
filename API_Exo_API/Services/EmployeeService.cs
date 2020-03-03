using API = API_Exo_API.Models;
using DAL = DAL_Exo_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL_Exo_API.Repositories;
using API_Exo_API.Services.Mapper;

namespace API_Exo_API.Services
{
    public class EmployeeService : IEmployeeRepository<int, API.Employee>
    {
        private IEmployeeRepository<int, DAL.Employee> _repo = new EmployeeRepository();

        public void Add(API.Employee entity)
        {
            _repo.Add(entity.ToDAL());
        }

        public void ChangePassword(int id, string password)
        {
            _repo.ChangePassword(id, password);
        }

        public void Delete(int id)
        {
            _repo.Delete(id);
        }

        public IEnumerable<API.Employee> Get()
        {
            return _repo.Get().Select(e=> e.ToAPI());
        }

        public API.Employee Get(int id)
        {
            return _repo.Get(id).ToAPI();
        }

        public void SetAdmin(int id)
        {
            _repo.SetAdmin(id);
        }

        public void UnsetAdmin(int id)
        {
            _repo.UnsetAdmin(id);
        }

        public void Update(int id, API.Employee entity)
        {
            _repo.Update(id,entity.ToDAL());
        }
    }
}