using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Khareedo.Models;
using System.Data;

namespace Khareedo.Controllers
{
    
    public class CheckOutController : Controller
    {
        Ecommerce1Entities8 db = new Ecommerce1Entities8();
        // GET: CheckOut
        public ActionResult Index()
        {
            ViewBag.PayMethod = new SelectList(db.PaymentTypes, "PayTypeID", "TypeName");
            var data=this.GetDefaultData();
            return View(data);
        }

        
        //PLACE ORDER--LAST STEP
       public ActionResult PlaceOrder(FormCollection getCheckoutDetails)
        {
            
            int orderid = 1;
            if (db.Orders.Count() > 0)
            {
                orderid = db.Orders.Max(x => x.ID) + 1;
            }
            Order o = new Order();
            o.ID = orderid;
            o.custId = TempShpData.UserID;
            o.isCompleted = true;
            o.OrderDate = DateTime.Now;
            o.Status = 0;
            db.Orders.Add(o);
            db.SaveChanges();
           
            //order table will also be updated here,a bit and the id which will be generrated ,
            //will be used here,and order table will be updated agin in stored procedure
            foreach (var cartitem in TempShpData.items)
            {
                cartitem.orderId = orderid;
                cartitem.custID = TempShpData.UserID;

                cartitem.Order = db.Orders.Find(orderid);
                cartitem.Product = db.Products.Find(cartitem.productID);
                db.Carts.Add(cartitem);
                db.SaveChanges();
            }

            //will only update orderdetails,were it will calculate 
            //@total_amount int
            //@total_discount int
            //@total_items int
            db.place_order(orderid, Convert.ToInt32(getCheckoutDetails["PayMethod"]));
            
            return RedirectToAction("Index","ThankYou");
            
        }

    }
}