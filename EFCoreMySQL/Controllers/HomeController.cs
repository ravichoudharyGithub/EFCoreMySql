using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using EFCoreMySQL.Models;
using EFCoreMySQL.EFDbContext;

namespace EFCoreMySQL.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private MyDBContext _myDbContext;
        public HomeController(ILogger<HomeController> logger, MyDBContext context)
        {
            _logger = logger;
            _myDbContext = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpGet]
        public IList<UserGroup> FetchUserGroups()
        {
            return (this._myDbContext.UserGroups.ToList());
        }


        [HttpGet]
        public IList<User> FetchUsers()
        {
            return (this._myDbContext.Users.ToList());
        }

        // TO check insert ,update, delete operations with entity framework
        [HttpGet]
        [Route("/check-ef-core-operations")]
        public async Task<string> CheckEFCoreOperations()
        {
            var tempUser = new User
            {
                FirstName = "Narender",
                LastName = "Modi",
                UserGroupId = 5,
                CreationDateTime = DateTime.Now,
                LastUpdateDateTime = DateTime.Now
            };

            // Operation 1 : Insert record.
            _myDbContext.Add(tempUser);
            _myDbContext.SaveChanges();
            //Fetch the CustomerId returned via SCOPE IDENTITY.
            int id = tempUser.Id;

            // Operation 2 : Update record.
            var item = _myDbContext.Users.FirstOrDefault(x => x.FirstName == "Narender");

            //var item = from x in _myDbContext.Users
            //         where x.FirstName == "Amit"
            //         select x;

            if (item != null)
            {
                item.FirstName = "Amit";
                item.LastName = "Shah";
                _myDbContext.SaveChanges();
            }

            // Operation 3 : Delete record.
            _myDbContext.Remove(tempUser);
            _myDbContext.SaveChanges();

            return "Success";
        }
    }
}
