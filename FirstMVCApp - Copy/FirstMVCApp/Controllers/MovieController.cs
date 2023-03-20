using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FirstMVCApp.Models;
using FirstMVCApp.ViewModel;
using System.Security.Cryptography;
using System.Text;

namespace FirstMVCApp.Controllers
{
    public class MovieController : Controller
    {
        // GET: Movie
        [HandleError]
        //[ActionName("RandomMovie")]
        public string Random()
        {
            var movie = new Movie() {Name="ddfff" };
            var customer = new List<Customer>
            {
                new Customer{ name="ghjgjh"},
                new Customer{ name="hgfhg"}
            };

            var randomviewmodel = new RandomMovieViewModel() { movie = movie, customers= customer };

            //         return @"<ul>
            //   <li>Ali Raza</li>
            //   <li>Mark Upston</li>
            //   <li>Allan Bommer</li>
            //   <li>Greg Jerry</li>
            //</ul>";
            string Password = "India@#$#%^$%^";
            String salt = "LongStringForExtraSecurity@#$!%^&*(*)1234567890";

           string a= EncryptPassword(Password, salt);
            //MessageDigest messageDigest = null;
            //try
            //{
            //    messageDigest = MessageDigest.getInstance("SHA");
            //    messageDigest.update((Password + salt).getBytes());
            //}
            //catch (Exception e)
            //{

            //}
            //String enPassword = (new BigInteger(messageDigest.digest())).toString(16);

            return a;
            //return RedirectToAction("About","Home");
            //return View(randomviewmodel);
        }

        public string EncryptPassword(string password, string salt)
        {
            using (var sha256 = SHA256.Create())
            {
                var saltedPassword = string.Format("{0}{1}", salt, password);
                byte[] saltedPasswordAsBytes = Encoding.UTF8.GetBytes(saltedPassword);
                return Convert.ToBase64String(sha256.ComputeHash(saltedPasswordAsBytes));
            }
        }
    }
}