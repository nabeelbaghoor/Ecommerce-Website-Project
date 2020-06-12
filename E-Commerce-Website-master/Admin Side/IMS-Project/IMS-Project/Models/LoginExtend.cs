using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace IMS_Project.Models
{
    [MetadataType(typeof(LoginMetaData))]
    public partial class Login
    {
    }
    public class LoginMetaData
    {
        [Required(ErrorMessage="Please enter username")]
        public string username { get; set; }
        [Required(ErrorMessage = "Please enter password")]
        public string password { get; set; }
    }
}