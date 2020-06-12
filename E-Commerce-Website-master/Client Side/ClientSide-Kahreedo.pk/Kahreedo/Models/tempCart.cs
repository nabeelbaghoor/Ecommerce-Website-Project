using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Khareedo.Models
{
    public class tempCart///it is just an object...to store
    {
        public int custID { get; set; }//mb better instead of just int like
        // public int custID;
        public int productID { get; set; }
        public int quantity { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual Product Product { get; set; }
    }
}