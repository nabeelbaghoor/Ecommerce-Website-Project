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
    
    public partial class Category
    {
        public Category()
        {
            this.genPromoRights = new HashSet<genPromoRight>();
            this.Products = new HashSet<Product>();
        }
    
        public int CategoryID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Picture1 { get; set; }
        public string Picture2 { get; set; }
        public Nullable<bool> isActive { get; set; }
    
        public virtual ICollection<genPromoRight> genPromoRights { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
