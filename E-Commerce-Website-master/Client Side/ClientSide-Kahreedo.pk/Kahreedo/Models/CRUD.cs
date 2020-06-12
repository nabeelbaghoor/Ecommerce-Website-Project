//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;

//using System.Data.SqlClient;
//using System.Data.Sql;
//using System.Data;
////for now we have different projects/pages for customer selller signup
////lets consider this for cutomer only
//namespace db_connectivity.Models
//{
//    public class CRUD
//    {
//        public static string connectionString = "data source=localhost; Initial Catalog=connectivity;Integrated Security=true";
   
//        public static List<Customer> getAllUsers()  //user means  customers mb for 
//        {
//            SqlConnection con = new SqlConnection(connectionString);
//            con.Open();
//            SqlCommand cmd;

//            try
//            {
//                cmd = new SqlCommand("ViewCustomer", con);
//                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    
//                SqlDataReader rdr = cmd.ExecuteReader();

//                List<Controllers.Customer> list = new List<Controllers.Customer>();
//                while (rdr.Read())
//                {
//                    Controllers.Customer customer = new Controllers.Customer();
//                        //password not inclide3d yet...se it
//                    customer.ID = (int)rdr["ID"];   //for now..check it
//                    customer.Fname = rdr["Fname"].ToString();
//                    customer.Lname = rdr["Lname"].ToString();
//                    customer.username = rdr["username"].ToString();
//                    customer.email = rdr["email"].ToString();
//                    customer.phone = rdr["phone"].ToString();
//                    customer.address = rdr["address"].ToString();
//                    //customer. = rdr["[city]"].ToString();
//                    //customer.Fname = rdr["Fname"].ToString();
//                    //customer.Fname = rdr["Fname"].ToString();
//                    //customer.userId = rdr["userId"].ToString();
//                    //customer.password = rdr["password"].ToString();
//                    //customer.dateOfBirth = rdr["dateOfBirth"].ToString();
//                    //customer.address = rdr["address"].ToString();
//                    //customer.phone = rdr["phone"].ToString();

//                    list.Add(customer);
//                }
//                rdr.Close();
//                con.Close();

//                return list;
//            }

//            catch (SqlException ex)
//            {
//                Console.WriteLine("SQL Error" + ex.Message.ToString());
//                return null;   
//            }
      
//        }

//        public static int SignUp(string username, string password,bool type, String dateOfBirth,string Name ,string address ,string phone )//fornow dateOfBirth
//        {

//            SqlConnection con = new SqlConnection(connectionString);
//            con.Open();
//            SqlCommand cmd;
//            int result = 0;

//            try
//            {
//                cmd = new SqlCommand("sign_up", con);
//                cmd.CommandType = System.Data.CommandType.StoredProcedure;
//                cmd.Parameters.Add("@username", SqlDbType.NVarChar, 10).Value = userId;
//                cmd.Parameters.Add("@password", SqlDbType.NVarChar, 20).Value = password;
//                cmd.Parameters.Add("@Fname", SqlDbType.NVarChar, 50).Value = password;
//                cmd.Parameters.Add("@Lname", SqlDbType.Date, 50).Value = dateOfBirth;//mb Date
//                cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = Name;
//                cmd.Parameters.Add("@phone", SqlDbType.NVarChar, 50).Value = phone;
//                cmd.Parameters.Add("@address", SqlDbType.NVarChar, 50).Value = address;
//                //city missing ...error may occur
//                cmd.Parameters.Add("@type", SqlDbType.Binary,1).Value = type;
//                cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;

//                cmd.ExecuteNonQuery();
//                result = Convert.ToInt32(cmd.Parameters["@output"].Value);

//            }

//            catch (SqlException ex)
//            {
//                Console.WriteLine("SQL Error" + ex.Message.ToString());
//                result = -1; //-1 will be interpreted as "error while connecting with the database."
//            }
//            finally
//            {
//                con.Close();
//            }
//            return result;

//        }

//        public static int Login(string userId, string password)
//        {
           
//            SqlConnection con = new SqlConnection(connectionString);
//            con.Open();
//            SqlCommand cmd;
//            int result = 0;

//            try
//            {
//                cmd = new SqlCommand("UserLoginProc", con);
//                cmd.CommandType = System.Data.CommandType.StoredProcedure;
//                cmd.Parameters.Add("@userId", SqlDbType.NVarChar, 50).Value = userId;
//                cmd.Parameters.Add("@password", SqlDbType.NVarChar, 50).Value = password;


//                cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;

//                cmd.ExecuteNonQuery();
//                result = Convert.ToInt32(cmd.Parameters["@output"].Value);

              

//            }

//            catch (SqlException ex)
//            {
//                Console.WriteLine("SQL Error" + ex.Message.ToString());
//                result= -1; //-1 will be interpreted as "error while connecting with the database."
//            }
//            finally
//            {
//                con.Close();
//            }
//            return result;

//        }

//    }
//}