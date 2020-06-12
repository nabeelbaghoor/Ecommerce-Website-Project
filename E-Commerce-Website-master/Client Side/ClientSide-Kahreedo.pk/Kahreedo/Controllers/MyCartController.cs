using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Khareedo.Models;


namespace Khareedo.Controllers
{
    public class MyCartController : Controller
    {
        Ecommerce1Entities8 db = new Ecommerce1Entities8();

        // GET: MyCart
        public ActionResult Index()
        {
            var d = this.GetDefaultData();

            return View(d);

        }

        public ActionResult Remove(int num)
        {
            TempShpData.items.RemoveAll(x => x.productID == num);
            return RedirectToAction("Index");
        }
        [HttpPost]

        public ActionResult ProcedToCheckout(FormCollection n)
        {
            var a = TempShpData.items.ToList();

            for (int i = 0; i < n.Count / 2; i++)
            {
                int prID = Convert.ToInt32(n["shcartID-" + i + ""]);
                var item = TempShpData.items.FirstOrDefault(x => x.productID == prID);

                int quant = Convert.ToInt32(n["Qty-" + i + ""]);
                item.quantity = quant;

                TempShpData.items.RemoveAll(x => x.productID == prID);

                if (TempShpData.items == null)
                {
                    TempShpData.items = new List<Cart>();
                }
                TempShpData.items.Add(item);

            }

            return RedirectToAction("Index", "CheckOut");
        }
    }
}