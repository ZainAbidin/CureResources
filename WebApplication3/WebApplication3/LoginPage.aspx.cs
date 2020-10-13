using System;
using BLL;
using System.Web.Security;

namespace WebApplication3
{
    public partial class LoginPage : System.Web.UI.Page
    {
        Bll BllObj = new Bll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            testFunction();
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("authentication/Signup Page.aspx");
        }

        private void testFunction(string txtUserName, string txtPWD)
        {
            Session["Username"] = txtUserName;
            int message = BllObj.logIn(txtUserName, txtPWD);
            if (message == 0)
            {
                Response.Redirect("Employee Page.aspx");
            }
            else if (message == 1)
            {
                Response.Redirect("Admin_Page.aspx");
            }
            else if (message == 2)
            { MessageLabel.Text = "Wrong Credentials or not Registered Yet!"; }
        }

    }
}