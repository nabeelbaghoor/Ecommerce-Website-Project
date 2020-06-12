using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace IMS_Project.Models
{
    public class TempSellerData
    {
        public virtual Seller Seller { get; set; }
        public virtual Login Login { get; set; }
    }
}