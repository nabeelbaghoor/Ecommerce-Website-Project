//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IMS_Project.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Review
    {
        public int productID { get; set; }
        public int custId { get; set; }
        public double rating { get; set; }
        public string comment { get; set; }
        public System.DateTime date { get; set; }
        public Nullable<bool> isDelete { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Product Product { get; set; }
    }
}
