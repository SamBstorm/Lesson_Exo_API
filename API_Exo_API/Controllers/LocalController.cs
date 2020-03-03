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
    public class LocalController : ApiController
    {
        private LocalService _service = new LocalService();

        [AcceptVerbs("GET")]
        [Route("Local/{id}")]
        public Local Retrieve(int id)
        {
            return _service.Get(id);
        }
        [AcceptVerbs("GET")]
        [Route("Local")]
        public IEnumerable<Local> RetrieveAll()
        {
            return _service.Get();
        }

        [AcceptVerbs("POST")]
        [Route("Secure/Local")]
        public void Add(Local local)
        {
            _service.Add(local);
        }
        [AcceptVerbs("PUT")]
        [Route("Secure/Local/{id}")]
        public void Update(int id, Local local)
        {
            _service.Update(id, local);
        }
        [AcceptVerbs("DELETE")]
        [Route("Secure/Local/{id}")]
        public void Delete(int id)
        {
            _service.Delete(id);
        }
    }
}
