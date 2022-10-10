using apicellphone.Models;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Security.Cryptography.X509Certificates;

namespace apicellphone.Data
   
{
    public class cellphonesD
    {
        public static bool AddC(cellphones dcellPhone)
        {
            using (SqlConnection nconection = new SqlConnection(cone.conec))
            {

                SqlCommand com =  new SqlCommand("_cellAdd", nconection);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Brandname",dcellPhone.brandNam);
                com.Parameters.AddWithValue("@Model", dcellPhone.model);
                com.Parameters.AddWithValue("@Storage", dcellPhone.storage);
                com.Parameters.AddWithValue("@Price", dcellPhone.price);
                com.Parameters.AddWithValue("@ImgUrl", dcellPhone.imgUrl);

                try
                {
                    nconection.Open();
                    com.ExecuteNonQuery();
                    return true;

                }catch(Exception ex)
                {
                    return false;
                }

            }

           
        }

        public static cellphones Get(int Idn)
        {
            cellphones cellphones1 = new cellphones();
            using (SqlConnection nconection = new SqlConnection(cone.conec))
            {
                SqlCommand com = new SqlCommand("_cellGet", nconection);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Id", Idn);

                try
                {
                    nconection.Open();
                

                    using (SqlDataReader datR =  com.ExecuteReader())
                    {
                        while (datR.Read())
                        {
                            cellphones1 = new cellphones()
                            {
                                id = Convert.ToInt32(datR["id"]),
                                brandNam = datR["brandNam"].ToString(),
                                model = datR["model"].ToString(),
                                storage = datR["storage"].ToString(),
                                price = Convert.ToInt32(datR["price"]),
                                imgUrl = datR["imgUrl"].ToString()
                            };


                        }

                    }

                    return cellphones1;

                }
                catch(Exception ex)
                {
                    return cellphones1;
                }

            }
        }


        public static bool updateC(cellphones dcellPhone)
        {
            using (SqlConnection nconection = new SqlConnection(cone.conec))
            {

                SqlCommand com = new SqlCommand("_cellUpdate", nconection);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Id", dcellPhone.id);
                com.Parameters.AddWithValue("@Brandname", dcellPhone.brandNam);
                com.Parameters.AddWithValue("@Model", dcellPhone.model);
                com.Parameters.AddWithValue("@Storage", dcellPhone.storage);
                com.Parameters.AddWithValue("@Price", dcellPhone.price);
                com.Parameters.AddWithValue("@ImgUrl", dcellPhone.imgUrl);

                try
                {
                    nconection.Open();
                    com.ExecuteNonQuery();
                    return true;

                }
                catch (Exception ex)
                {
                    return false;
                }

            }


        }

        public static List<cellphones> listcll()
        {
            List<cellphones> Lscellphones = new List<cellphones>();
            using (SqlConnection nconection = new SqlConnection(cone.conec))
            {
                SqlCommand com = new SqlCommand("_cellList", nconection);
                com.CommandType = CommandType.StoredProcedure;

                try
                {
                    nconection.Open();

                    using (SqlDataReader datR = com.ExecuteReader())
                    {
                        while (datR.Read())
                        {
                            Lscellphones.Add(new cellphones() { 
                                 id = Convert.ToInt32(datR["id"]),
                                brandNam = datR["brandNam"].ToString(),
                                model = datR["model"].ToString(),
                                storage = datR["storage"].ToString(),
                                price = Convert.ToInt32(datR["price"]),
                                imgUrl = datR["imgUrl"].ToString()
                            
                            });

                        }
                    }
                    return Lscellphones;


                }
                catch(Exception ex)
                {
                    return Lscellphones;
                }
            }
        }

        public static bool DeltCell(int Idn)
        {
            using (SqlConnection nconection = new SqlConnection(cone.conec))
            {
                SqlCommand com = new SqlCommand("_cellDel", nconection);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Id", Idn);

                try
                {
                    nconection.Open();
                    com.ExecuteNonQuery();
                    return true;

                }
                catch(Exception ex)
                {
                    return false;
                }

            }
        }
         

    }
}
