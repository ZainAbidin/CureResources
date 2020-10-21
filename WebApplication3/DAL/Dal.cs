using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace DAL
{
    public class Dal
    {
        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        public int logIn(string username, string password)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmnd = new SqlCommand("spCheckCredentials", con);
                cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                cmnd.Parameters.AddWithValue("@Username", username);
                cmnd.Parameters.AddWithValue("@Password", password);
                con.Open();

                string role = Convert.ToString(cmnd.ExecuteScalar());
                int returnvar = 0;
                if (!string.IsNullOrEmpty(role))
                {
                    if (role.Equals("User"))
                    {
                        returnvar = 0;
                    }
                    else if (role.Equals("Admin"))
                    {
                        returnvar = 1;
                    }
                    return returnvar;

                }
                else
                {
                    return 2;
                }
            }


        }

        public int signUp(string username, string confirmPassword, string Fname, string Lname, string city, string country, string employeeCode, int Age)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmnd = new SqlCommand("spuserSignup", con);
                cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                cmnd.Parameters.AddWithValue("@Username", username);
                cmnd.Parameters.AddWithValue("@ConfirmPassword", confirmPassword);
                cmnd.Parameters.AddWithValue("@FirstName", Fname);
                cmnd.Parameters.AddWithValue("@LastName", Lname);
                cmnd.Parameters.AddWithValue("@City", city);
                cmnd.Parameters.AddWithValue("@COUNTRY", country);
                cmnd.Parameters.AddWithValue("@EmployeeCode", employeeCode);
                cmnd.Parameters.AddWithValue("@Age", Age);
                con.Open();
                int returnvar = 1;
                string userExistenceCheck = Convert.ToString(cmnd.ExecuteScalar());
                if (!string.IsNullOrEmpty(userExistenceCheck))
                {
                    if (userExistenceCheck.Equals("0"))
                    {
                        returnvar = 0;
                    }
                    else
                    {
                        returnvar = 1;
                    }
                    
                }
                return returnvar;
                //else
                //{
                //    return returnvar;
                //}

            }
        }

        public void adminPageBroadcast(string broadCast)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmnd = new SqlCommand("broadcast", con);
                cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                cmnd.Parameters.AddWithValue("@message", broadCast);
                con.Open();
                cmnd.ExecuteNonQuery();
            }
        }

        public DataTable viewAll()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmnds = new SqlCommand("SELECT * FROM Employees", con);
                SqlDataAdapter da = new SqlDataAdapter(cmnds);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public DataTable searchEmployee(string SearchInput)
        {
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlCommand cmand = new SqlCommand("spSearch", conn);
                cmand.CommandType = System.Data.CommandType.StoredProcedure;
                cmand.Parameters.AddWithValue("@SearchInput", SearchInput);
                conn.Open();
                SqlDataAdapter adap = new SqlDataAdapter(cmand);
                DataTable datable = new DataTable();
                adap.Fill(datable);
                return datable;
            }
        }

        public DataTable spChangeEmployeeStatus(string username)
        {
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlCommand cmand = new SqlCommand("spActivity", conn);
                cmand.CommandType = System.Data.CommandType.StoredProcedure;
                cmand.Parameters.AddWithValue("@Username", username);
                conn.Open();
                cmand.ExecuteNonQuery();
            }
            return searchEmployee(username);
        }

        public void spMessageToEmployee(string username, string message)
        {
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlCommand cmand = new SqlCommand("spIM", conn);
                cmand.CommandType = System.Data.CommandType.StoredProcedure;
                cmand.Parameters.AddWithValue("@Username", username);
                cmand.Parameters.AddWithValue("@message", message);
                conn.Open();
                cmand.ExecuteNonQuery();

            }
        }

        public DataTable getUserByUsername(string username)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmnds = new SqlCommand("spuseridentify", con);
                cmnds.CommandType = System.Data.CommandType.StoredProcedure;
                cmnds.Parameters.AddWithValue("@Username", username);
                SqlDataAdapter da = new SqlDataAdapter(cmnds);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public string EmployeeIssueItem(string username, string item)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmnd = new SqlCommand("spIssueItem", con);
                cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                cmnd.Parameters.AddWithValue("@Username", username);
                cmnd.Parameters.AddWithValue("@Item", item);
                con.Open();
                string check = Convert.ToString(cmnd.ExecuteScalar());
                return check;
            }

        }

        public string getMessageForEmployee(string username)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmnd = new SqlCommand("readIM", con);
                    cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmnd.Parameters.AddWithValue("@Username", username);
                    con.Open();
                    string IM = Convert.ToString(cmnd.ExecuteScalar());
                    if (!string.IsNullOrEmpty(IM))
                    {
                        return IM;
                    }
                    else
                    {
                        return "No new message from Admin";
                    }

                }
            }
            catch
            {
                return "There was an error in getting a message to you, please contact Admin. Thank you";
            }

        }

        public void clearmessagesByEmployee(string username)
        {
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlCommand cmand = new SqlCommand("spClearmsg", conn);
                cmand.CommandType = System.Data.CommandType.StoredProcedure;
                cmand.Parameters.AddWithValue("@Username", username);
                conn.Open();
                cmand.ExecuteNonQuery();
                conn.Close();
            }
        }

        public int EmployeeUpdate(string EmployeeCode, string Fname, string Lname, string City, string Country, string Username, string AGE)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    int ageCheck = int.Parse(AGE);
                    if ((ageCheck >= 18) && (ageCheck <= 60))
                    {
                        SqlCommand cmnd = new SqlCommand("spUpdateEmployee", con);
                        cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmnd.Parameters.AddWithValue("@Username", Username);
                        cmnd.Parameters.AddWithValue("@FirstName", Fname);
                        cmnd.Parameters.AddWithValue("@LastName", Lname);
                        cmnd.Parameters.AddWithValue("@City", City);
                        cmnd.Parameters.AddWithValue("@Country", Country);
                        cmnd.Parameters.AddWithValue("@Age", int.Parse(AGE));
                        cmnd.Parameters.AddWithValue("@EmployeeCode", int.Parse(EmployeeCode));
                        con.Open();
                        cmnd.ExecuteNonQuery();
                        con.Close();
                        return 0;
                    }
                    return 1;
                }
            }
            catch
            {

                return 1;
            }


        }
    }
}
