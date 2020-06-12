using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Khareedo.Models;

namespace Khareedo.Controllers
{
    public class WishListController : Controller
    {
        Ecommerce1Entities8 db = new Ecommerce1Entities8();

        // GET: WishList
        public ActionResult Index()
        {
             this.GetDefaultData();

            var wishlistProducts = db.Wishlists.Where(x => x.CustomerID == TempShpData.UserID).ToList();
            return View(wishlistProducts);
        }

        //REMOVE ITEM FROM WISHLIST
        public ActionResult Remove(int id)
        {
            db.Wishlists.Remove(db.Wishlists.Find(id));
            db.SaveChanges();
            return RedirectToAction("Index");

        }
        //ADD TO CART WISHLIST

        public ActionResult AddToCart(int id)       //will add featue to check availibility
        {
            //now cart will not store temp items list for cutomers
            //tempshdata will do, in place


            int pid = db.Wishlists.Find(id).ProductID;

            Cart item = new Cart();
            item.productID = pid;

            int Qty = 1;
            item.quantity = Qty;

            item.Product = db.Products.Find(pid);

            if (TempShpData.items == null)
            {
                TempShpData.items = new List<Cart>();
            }
            TempShpData.items.Add(item);


            db.Wishlists.Remove(db.Wishlists.Find(id));
            db.SaveChanges();

            return Redirect(TempData["returnURL"].ToString());

        }
    }
}