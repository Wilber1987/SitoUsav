using Microsoft.AspNetCore.Mvc;
using CAPA_DATOS.Security; 
using CAPA_DATOS.Services;

namespace API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class TestController : ControllerBase
    {
        [HttpGet]
        public object getMailData(){
            return true;
        }
     
    }
}
