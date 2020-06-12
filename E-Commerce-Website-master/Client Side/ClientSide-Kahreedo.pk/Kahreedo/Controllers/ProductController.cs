using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Khareedo.Models;
using PagedList;
using PagedList.Mvc;

namespace Khareedo.Controllers
{
    public class ProductController : Controller
    {
        Ecommerce1Entities8 db = new Ecommerce1Entities8();


        public ActionResult Index()
        {
            ViewBag.Categories = db.Categories.Select(x => x.Name).ToList();

            //for now
            ViewBag.TopRatedProducts = TopSoldProducts();//db.get_TopRated_Products(5);//

            return View("Products");
        }

        //TOP SOLD PRODUCTS
        //see original
        public List<TopSoldProduct> TopSoldProducts()
        {
            var prodList = (from prod in db.Carts
                            select new { prod.productID, prod.quantity } into p
                            group p by p.productID into g
                            select new
                            {
                                pID = g.Key,
                                sold = g.Sum(x => x.quantity)
                            }).OrderByDescending(y => y.sold).Take(3).ToList();



            List<TopSoldProduct> topSoldProds = new List<TopSoldProduct>();

            for (int i = 0; i < 3; i++)
            {
                topSoldProds.Add(new TopSoldProduct()
                {
                    product = db.Products.Find(prodList[i].pID),
                    CountSold = Convert.ToInt32(prodList[i].sold)
                });
            }
            return topSoldProds;
        }

        //ADD TO CART
        //NEW
        //will add only in tempShDataa..not cart table
        public ActionResult AddToCart(int id)       //will add featue to check availibility
        {
            //now cart will not store temp items list for cutomers
            //tempshdata will do, in place


            Cart item = new Cart();
            item.productID = id;

            int Qty = 1;
            item.quantity = Qty;

            item.Product = db.Products.Find(id);
            if (TempShpData.items == null)
            {
                TempShpData.items = new List<Cart>();
            }
            TempShpData.items.Add(item);

            return Redirect(TempData["returnURL"].ToString());

        }

        //VIEW DETAILS
        public ActionResult ViewDetails(int id)
        {
            var prod = db.Products.Find(id);
            //var reviews = db.Reviews.Where(x => x.productID == id).ToList();

            //to get all reviews of product with productID = id
            var productReviews = (from rv in db.Reviews
                                where rv.productID == id
                                select rv).ToList();

            ViewBag.Reviews = productReviews;
            ViewBag.TotalReviews = productReviews.Count();
            ViewBag.RelatedProducts = db.Products.Where(y => y.CategoryID == prod.CategoryID).ToList();//will see
            
            //can the current customer review,a customer can only review once
            bool canReview = true;
            foreach (Review rv in productReviews)
            {
                    if (rv.custId == TempShpData.UserID)
                        canReview = false;
            }
            ViewBag.CanReview = canReview;

            //to get avgRating
            var avgRating = db.get_Average_rating(id).FirstOrDefault();
            if (avgRating is null)
                ViewBag.AvgRate = 0;        //avg rating zero if no review
            else
                ViewBag.AvgRate = avgRating.Average_Rating;
        
            this.GetDefaultData();
            return View(prod);

        }

        //will see
        //WISHLIST
        public ActionResult WishList(int id)
        {
            
            Wishlist wl = new Wishlist();
            wl.ProductID = id;
            wl.CustomerID = TempShpData.UserID;

            db.Wishlists.Add(wl);
            db.SaveChanges();

            ViewBag.WlItemsNo = db.Wishlists.Where(x => x.CustomerID == TempShpData.UserID).ToList().Count();
            if (TempData["returnURL"].ToString()=="/")
            {
                return RedirectToAction("Index","Home");
            }
            return Redirect(TempData["returnURL"].ToString());
        }

       
        //ADD REVIEWS ABOUT PRODUCT
        public ActionResult AddReview(int productID, FormCollection getReview)
        {
            //see if it works
            db.add_review(productID, TempShpData.UserID,
                Convert.ToInt32(getReview["rate"]), getReview["message"]);
          
            return RedirectToAction("ViewDetails/" + productID + "");

        }

        //will see
        public ActionResult Products(int subCatID=1)//=0 for now
        {
            ViewBag.Categories = db.Categories.Select(x => x.Name).ToList();
            var prods = db.Products.Where(y => y.SubCategoryID == subCatID).ToList();
            return View(prods);
        }

        //GET PRODUCTS BY CATEGORY
        public ActionResult GetProductsByCategory(string categoryName, int? page)
        {
            ViewBag.Categories = db.Categories.Select(x => x.Name).ToList();

            //for now,not included
            ViewBag.TopRatedProducts = TopSoldProducts();// db.get_TopRated_Products(5);// TopSoldProducts();

            //will see
            var prods = db.Products.Where(x => x.Category.Name == categoryName).ToList();
            return View("Products", prods.ToPagedList(page ?? 1, 9));
        }

        //we are using our procedure
        //SEARCH BAR
        //original
        public ActionResult Search(string product, int? page)
        {
            ViewBag.Categories = db.Categories.Select(x => x.Name).ToList();
            ViewBag.TopRatedProducts = TopSoldProducts();


            List<Product> products;
            if (!string.IsNullOrEmpty(product))
            {
                products = db.Products.Where(x => x.name.StartsWith(product)).ToList();
            }
            else
            {
                products = db.Products.ToList();
            }
            return View("Products", products.ToPagedList(page ?? 1, 6));
        }
       
        //will see it latter,jason......!!!!
        public JsonResult GetProducts(string term)
        {
            List<string> prodNames = db.Products.Where(x => x.name.StartsWith(term)).Select(y => y.name).ToList();
            return Json(prodNames, JsonRequestBehavior.AllowGet);

        }
        //will see,its new like above
        public ActionResult FilterByPrice(int minPrice,int maxPrice,int? page)
        {
            ViewBag.Categories = db.Categories.Select(x => x.Name).ToList();
            ViewBag.TopRatedProducts = TopSoldProducts();// db.get_TopRated_Products(5);//TopSoldProducts();

            ViewBag.filterByPrice = true;
           var filterProducts= db.Products.Where(x => x.price >= minPrice && x.price <= maxPrice).ToList();
           return View("Products", filterProducts.ToPagedList(page ?? 1, 9));
        }

       
    }
}