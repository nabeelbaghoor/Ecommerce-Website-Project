using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class ProductController : Controller
    {
        Ecommerce1Entities5 db = new Ecommerce1Entities5();

        public ActionResult Index()
        {
            return View(db.Products.ToList());
        }

        public ActionResult Create()
        {
            GetViewBagData();
            return View();
        }
        public void GetViewBagData()
        {

            ViewBag.SellerID = new SelectList(db.Sellers, "ID", "CompanyName");
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "Name");
            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "SubCategoryID", "Name");

        }

        [HttpPost]
        public ActionResult Create(Product prod)
        {
            if (ModelState.IsValid)
            {
                //using stored procedure
                db.post_product(prod.name, TemData.sellerID, prod.quantity, prod.discount, prod.details, 
                    prod.price, prod.CategoryID, prod.SubCategoryID, prod.ProductAvailable, prod.Weight,
                    prod.Size, prod.ShortDescription, prod.LongDescription, prod.Picture1, prod.Picture2,
                    prod.Picture3, prod.Picture4, prod.ImageURL);

               return RedirectToAction("Index", "Product");
            }
            GetViewBagData();
            return View();
        }


        //Get Edit
        [HttpGet]
        public ActionResult Edit(int id)
        {

            //using stored procedure
            var prod = db.get_product(id).FirstOrDefault();
            Product product = new Product();
            product.ID = prod.ID;
            product.name = prod.name;
            product.sellerID = prod.sellerID;
            product.quantity = prod.quantity;
            product.discount = prod.discount;
            product.details = prod.details;
            product.price = prod.price;
            product.CategoryID = prod.CategoryID;
            product.SubCategoryID = prod.SubCategoryID;
            product.ProductAvailable = prod.ProductAvailable;
            product.Weight = prod.Weight;
            product.Size = prod.Size;
            product.ShortDescription = prod.ShortDescription;
            product.LongDescription = prod.LongDescription;
            product.Picture1 = prod.Picture1;
            product.Picture2 = prod.Picture2;
            product.Picture3 = prod.Picture3;
            product.Picture4 = prod.Picture4;
            product.ImageURL = prod.ImageURL;

            if (product == null)
            {
                return HttpNotFound();
            }
            GetViewBagData();
            return View("Edit", product);
        }

        //Post Edit
        [HttpPost]
        public ActionResult Edit(Product prod)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prod).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Product");
            }
            GetViewBagData();
            return View(prod);
        }

        //Get Details
        public ActionResult Details(int id)
        {

            //using stored procedure
            var prod = db.get_product(id).FirstOrDefault();
            Product product = new Product();
            product.ID = prod.ID;
            product.name = prod.name;
            product.sellerID = prod.sellerID;
            product.quantity = prod.quantity;
            product.discount = prod.discount;
            product.details = prod.details;
            product.price = prod.price;
            product.CategoryID = prod.CategoryID;
            product.SubCategoryID = prod.SubCategoryID;
            product.ProductAvailable = prod.ProductAvailable;
            product.Weight = prod.Weight;
            product.Size = prod.Size;
            product.ShortDescription = prod.ShortDescription;
            product.LongDescription = prod.LongDescription;
            product.Picture1 = prod.Picture1;
            product.Picture2 = prod.Picture2;
            product.Picture3 = prod.Picture3;
            product.Picture4 = prod.Picture4;
            product.ImageURL = prod.ImageURL; ;
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //Get Delete
        public ActionResult Delete(int id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);

        }

        //Post Delete Confirmed
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product); 
            db.SaveChanges();
            return RedirectToAction("Index");
        }
         
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
        
    }
}
