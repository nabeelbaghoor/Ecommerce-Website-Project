using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Khareedo.Models
{
    public static class TempShpData
    {
        public static int UserID { get; set; }      //userid is customer id here mb
        //public static List<tempCart> items { get; set; }//mb cart is better
        public static List<Cart> items { get; set; }//we are using it,and we are not using orderid for now,
        ////it will help us to make it easy to access products put in cart yet
    }
}