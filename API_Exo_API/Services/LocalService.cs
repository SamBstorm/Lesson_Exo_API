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
    public class LocalService : ILocalRepository<int, API.Local>
    {
        private ILocalRepository<int, DAL.Local> _repo = new LocalRepository();

        public void Add(API.Local entity)
        {
            _repo.Add(entity.ToDAL());
        }

        public void Delete(int id)
        {
            _repo.Delete(id);
        }

        public IEnumerable<API.Local> Get()
        {
            return _repo.Get().Select(l=>l.ToAPI());
        }

        public API.Local Get(int id)
        {
            return _repo.Get(id).ToAPI();
        }

        public void Update(int id, API.Local entity)
        {
            _repo.Update(id, entity.ToDAL());
        }
    }
}
