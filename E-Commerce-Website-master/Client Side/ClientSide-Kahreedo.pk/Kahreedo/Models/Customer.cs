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
    
    public partial class Customer
    {
        public Customer()
        {
            this.Carts = new HashSet<Cart>();
            this.Wishlists = new HashSet<Wishlist>();
            this.Orders = new HashSet<Order>();
            this.Reviews = new HashSet<Review>();
        }
    
        public int ID { get; set; }
        public string Fname { get; set; }
        public string Lname { get; set; }
        public string username { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string State { get; set; }
        public string Gender { get; set; }
        public Nullable<int> Age { get; set; }
        public string Picture { get; set; }
    
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<Wishlist> Wishlists { get; set; }
        public virtual Login Login { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
