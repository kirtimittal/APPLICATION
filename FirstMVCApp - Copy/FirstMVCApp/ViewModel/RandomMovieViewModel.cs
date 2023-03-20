using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FirstMVCApp.Models;

namespace FirstMVCApp.ViewModel
{
    public class RandomMovieViewModel
    {
        public Movie movie { get; set; }
        public List<Customer> customers { get; set; }
    }
}