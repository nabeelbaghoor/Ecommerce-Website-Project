using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Khareedo.Models;
using System.Data;

namespace Khareedo.Controllers
{
    public class AccountController : Controller
    {
        Ecommerce1Entities8 db = new Ecommerce1Entities8();

        // GET: Account
        public ActionResult Index()
        {
            this.GetDefaultData();

            var usr = db.Customers.Find(TempShpData.UserID);
            return View(usr);

        }


        //REGISTER CUSTOMER
        [HttpPost]
        public ActionResult Register(Customer cust,string Password) //validations only on frontend,must add
        {
            if (ModelState.IsValid)
            {

               System.Data.Objects.ObjectParameter flag = new System.Data.Objects.ObjectParameter("flag", typeof(bool));
               db.sign_up(cust.username, Password, cust.Fname, cust.Lname, cust.email, cust.phone,
                  cust.address, cust.city, "customer", flag);

                if (Convert.ToBoolean(flag.Value))
                    Session["username"] = cust.username;
                else
                    Session["username"] = "TEMPSignUp";
                TempShpData.UserID = GetUser(cust.username).ID;   
                return RedirectToAction("Index","Home");
            }
            return View();
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
                System.Data.Objects.ObjectParameter flag = new System.Data.Objects.ObjectParameter("flag", typeof(bool));
                db.check_login(usrName, Pass, flag);

                var cust = (from m in db.Customers
                            where (m.username == usrName)
                            select m).SingleOrDefault();
                if (cust != null)
                {
                    TempShpData.UserID = cust.ID;
                    if (Convert.ToBoolean(flag.Value))
                        Session["username"] = cust.username;
                    else
                        Session["username"] = "TEMPSignIn";
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }

        //LOG OUT
         public ActionResult Logout()
         {
             Session["username"] = null;
             TempShpData.UserID = 0;
             TempShpData.items = null;
             return RedirectToAction("Index", "Home");
         }

        public Customer GetUser(string _usrName)
        {
            var _customer = (from cust in db.Customers 
                            where cust.username == _usrName 
                            select cust).FirstOrDefault();
            return _customer;
        }

        //UPDATE CUSTOMER DATA
        [HttpPost]
        public ActionResult Update(Customer cust)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cust).State = EntityState.Modified;        //for now, we are not changing it
                db.SaveChanges();
                Session["username"] = cust.username;
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
    }
}