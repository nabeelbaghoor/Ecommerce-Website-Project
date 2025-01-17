//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Khareedo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Seller
    {
        public Seller()
        {
            this.Products = new HashSet<Product>();
        }
    
        public int ID { get; set; }
        public string Fname { get; set; }
        public string Lname { get; set; }
        public string username { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string CompanyName { get; set; }
        public string Gender { get; set; }
        public Nullable<int> Age { get; set; }
        public string PhotoPath { get; set; }
    
        public virtual Login Login { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
