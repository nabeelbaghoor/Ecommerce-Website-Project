using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;
using System.Data.Entity.Core.Objects;
//the basic logic is diifernet, we have no suppliers in our db,but yhere they sare
//so ,we have to handle this case as well
namespace IMS_Project.Controllers
{
    public class admin_LoginController : Controller
    {
        Ecommerce1Entities5 db = new Ecommerce1Entities5();
        // GET: admin_Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SignUp()
        {
            return View();
        }

        public ActionResult Register(FormCollection formColl)//TempSellerData data) //validations only on frontend,must add
        {
            if (ModelState.IsValid)
            {
                //Seller _seller = data.Seller;
                //var Password = data.Login.password;
                //System.Data.Objects.ObjectParameter flag = new System.Data.Objects.ObjectParameter("flag", typeof(bool));
                System.Data.Entity.Core.Objects.ObjectParameter flag = new System.Data.Entity.Core.Objects.ObjectParameter("flag", typeof(bool));
                db.sign_up(formColl["username"], formColl["password"], formColl["Fname"], formColl["Lname"], formColl["email"], formColl["phone"],
                       formColl["address"], "", "Seller", flag);//formColl["city"]

                if (Convert.ToBoolean(flag.Value))
                {
                    Session["username"] = formColl["username"];

                    TemData.sellerID = GetUser(formColl["username"]).ID;
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    Session["username"] = "TEMPSignUp";

                    TemData.sellerID = 0;//for now
                }
            }


            return RedirectToAction("SignUp", "admin_Login");
        }
        //our old
        //public ActionResult Register(Seller _seller ,string Password)//TempSellerData data) //validations only on frontend,must add
        //{
        //    if (ModelState.IsValid)
        //    {
        //        //Seller _seller = data.Seller;
        //        //var Password = data.Login.password;
        //        //System.Data.Objects.ObjectParameter flag = new System.Data.Objects.ObjectParameter("flag", typeof(bool));
        //        System.Data.Entity.Core.Objects.ObjectParameter flag = new System.Data.Entity.Core.Objects.ObjectParameter("flag", typeof(bool));
        //        db.sign_up(_seller.username, Password, _seller.Fname, _seller.Lname, _seller.email, _seller.phone,
        //               _seller.address, _seller.city, "Seller", flag);

        //        if (Convert.ToBoolean(flag.Value))
        //        {
        //            Session["username"] = _seller.username;

        //            TemData.sellerID = GetUser(_seller.username).ID;
        //            return RedirectToAction("Index", "Product");
        //        }
        //        else
        //        {
        //            Session["username"] = "TEMPSignUp";

        //            TemData.sellerID = 0;//for now
        //        }
        //    }


        //    return RedirectToAction("SignUp", "admin_Login");
        //}
        public Seller GetUser(string _usrName)
        {
            var _seller = (from seller in db.Sellers
                             where seller.username == _usrName
                             select seller).FirstOrDefault();
            return _seller;
        }

        //LOG IN
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection formColl)
        {
            string usrName = formColl["UserName"];
            string Pass = formColl["Password"];
            if (ModelState.IsValid)
            {
                //System.Data.Objects.ObjectParameter flag = new System.Data.Objects.ObjectParameter("flag", typeof(bool));
                System.Data.Entity.Core.Objects.ObjectParameter flag = new System.Data.Entity.Core.Objects.ObjectParameter("flag", typeof(bool));
                db.check_login(usrName, Pass, flag);

                var seller = (from m in db.Sellers
                            where (m.username == usrName)
                            select m).SingleOrDefault();
                if (seller != null)
                {
                    TemData.sellerID = seller.ID;
                    if (Convert.ToBoolean(flag.Value))
                    {
                        Session["username"] = seller.username;
                        return RedirectToAction("Index", "Product");
                    }
                    else
                        Session["username"] = "TEMPSignIn";
                }
            }
            return View("Index");
        }

        //LOG OUT
        public ActionResult Logout()
        {
            Session["username"] = null;
            //not for now
            TemData.sellerID = 0;  
            //TempShpData.items = null;
            return RedirectToAction("Index", "admin_Login");
        }

        //old
        //[HttpPost]
        //public ActionResult Login(admin_Login login)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var model = (from m in db.admin_Login
        //                     where m.UserName == login.UserName && m.Password == login.Password
        //                    select m).Any();
        //        if (model)
        //        {                 
        //            var loginInfo = db.admin_Login.Where(x=>x.UserName==login.UserName && x.Password==login.Password).FirstOrDefault();

        //            Session["username"] = loginInfo.UserName;
        //            TemData.EmpID = loginInfo.EmpID;
        //           return RedirectToAction("Index", "Dashboard");
        //        }       
        //    }
        //    return View("Index");
        //}
        //old
        //public ActionResult Logout()
        //{
        //    Session.Clear();
        //    return RedirectToAction("Index", "admin_Login");
        //}
    }
}