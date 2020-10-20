using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using BLL;
namespace WebApplication3
{
    public partial class Signup_Page : System.Web.UI.Page
    {
        private void clearFields()
        {
            txtUsername.Text = "";
            txtConfirmPassword.Text = "";
            txtpassword.Text = "";
            txtFname.Text = "";
            txtLname.Text = "";
            txtCity.Text = "";
            txtCountry.Text = "";
            txtEmployeeCode.Text = "";
            txtAge.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Bll BllObj = new Bll();
            int userExistenceCheck = BllObj.signUp( txtUsername.Text, txtConfirmPassword.Text, txtFname.Text, txtLname.Text, txtCity.Text, txtCountry.Text, txtEmployeeCode.Text, int.Parse(txtAge.Text));

            if (userExistenceCheck == 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('User already registered')</script>");
                clearFields();
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('User Registered')</script>");
                clearFields();
            }

       
            
        }

        protected void GobackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}