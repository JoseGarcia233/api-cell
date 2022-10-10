using apicellphone.Data;
using apicellphone.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace apicellphone.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class cellphonesController : ControllerBase
    {
        // GET: api/<cellphonesController>
        [HttpGet]
        public List<cellphones> Get()
        {
            return cellphonesD.listcll();
        }

        // GET api/<cellphonesController>/5
        [HttpGet("{id}")]
        public cellphones Get(int id)
        {
            return cellphonesD.Get(id);
        }

        // POST api/<cellphonesController>
        [HttpPost]
        public bool Post([FromBody] cellphones dcellPhone)
        {
            return cellphonesD.AddC(dcellPhone);
        }

        // PUT api/<cellphonesController>/5
        [HttpPut("{id}")]
        public bool Put( cellphones dcellPhone)
        {
            return cellphonesD.updateC(dcellPhone);
        }

        // DELETE api/<cellphonesController>/5
        [HttpDelete("{id}")]
        public bool Delete(int id)
        {
            return cellphonesD.DeltCell(id);
        }
    }
}
