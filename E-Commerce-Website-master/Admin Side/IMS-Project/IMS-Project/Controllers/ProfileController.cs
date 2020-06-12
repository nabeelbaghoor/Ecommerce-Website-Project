using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;
using System.Data;


namespace IMS_Project.Controllers
{
    public class ProfileController : Controller
    {
        Ecommerce1Entities5 db = new Ecommerce1Entities5();
        // GET: Profile
        public ActionResult Index()
        {
            return View(db.Sellers.Find(TemData.sellerID));

        }

        public ActionResult Edit(int id)
        {
           Seller _seller =  db.Sellers.Find(id);
          if (_seller == null)
          {
              return HttpNotFound();
          }
           return View(_seller);
        }

        [HttpPost]
        public ActionResult Edit(Seller _seller)
        {
            _seller.username= db.Sellers.Find(TemData.sellerID).username; //mb
            if (ModelState.IsValid)
            {
                //db.Set<Seller>().Add(_seller);
                db.Entry(_seller).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }
    }
}