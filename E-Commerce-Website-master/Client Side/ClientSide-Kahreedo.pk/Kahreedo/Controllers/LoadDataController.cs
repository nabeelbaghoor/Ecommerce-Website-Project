using Khareedo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Khareedo.Controllers
{
    public static class LoadDataController 
    {
        static Ecommerce1Entities8 db = new Ecommerce1Entities8();
        public static List<Cart> GetDefaultData(this ControllerBase controller)
        {
            if (TempShpData.items == null)
            {
                TempShpData.items = new List<Cart>();
            }
            var data = TempShpData.items.ToList();

            controller.ViewBag.cartBox = data.Count == 0 ? null : data;
            controller.ViewBag.NoOfItem = data.Count();
            int? SubTotal = Convert.ToInt32(data.Sum(x => x.quantity*x.Product.price));// was 0 thorugh update
            controller.ViewBag.Total = SubTotal;
            //discont is on products,no other disounts or cpupons or 
            //price remains same,whether you buy more or less
            int? Discount = Convert.ToInt32(data.Sum(x => x.quantity * x.Product.discount));// was 0 thorugh update

            //int Discount = 0;
            controller.ViewBag.SubTotal = SubTotal;
            controller.ViewBag.Discount = Discount;
            controller.ViewBag.TotalAmount = SubTotal - Discount;

            controller.ViewBag.WlItemsNo = db.Wishlists.Where(x => x.CustomerID == TempShpData.UserID).ToList().Count();
            return data;
        }
    }
}