using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using prova.Models;

namespace prova.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        public ActionResult Index()
        {
            return View();
        }
        products[] products = new products[]
        {
            new products { Id = 1, Name = "Tomato Soup", Category = "Groceries", Price = 1 },
            new products { Id = 2, Name = "Yo-yo", Category = "Toys", Price = 3.75M },
            new products { Id = 3, Name = "Hammer", Category = "Hardware", Price = 16.99M }
        };

        public IEnumerable<products> GetAllProducts()
        {
            return products;
        }
        /*
        public IHttpActionResult GetProduct(int id)
        {
            var product = products.FirstOrDefault((p) => p.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            return Ok(product);
        }*/
        // Send an AJAX request
        
    }
}