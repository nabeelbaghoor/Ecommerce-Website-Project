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
    
    public partial class get_TopRated_Products_Result
    {
        public int productID { get; set; }
        public double rating { get; set; }
        public int ID { get; set; }
        public string name { get; set; }
        public int sellerID { get; set; }
        public int quantity { get; set; }
        public int discount { get; set; }
        public string details { get; set; }
        public int price { get; set; }
        public int CategoryID { get; set; }
        public Nullable<int> SubCategoryID { get; set; }
        public Nullable<bool> ProductAvailable { get; set; }
        public string Weight { get; set; }
        public string Size { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public string Picture1 { get; set; }
        public string Picture2 { get; set; }
        public string Picture3 { get; set; }
        public string Picture4 { get; set; }
        public string ImageURL { get; set; }
    }
}
