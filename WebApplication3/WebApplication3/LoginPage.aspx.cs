using System;
using BLL;

namespace WebApplication3
{
    public partial class LoginPage : System.Web.UI.Page
    {
        Bll BllObj = new Bll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //testFunction();
            //Session["Username"] = txtUserName.Text;
            //int message = BllObj.logIn(txtUserName.Text, txtPWD.Text);
            //if (message == 0)
            //{
            //    Response.Redirect("Employee Page.aspx");
            //}
            //else if (message == 1)
            //{
            //    Response.Redirect("Admin_Page.aspx");
            //}
            //else if (message == 2)
            //{ MessageLabel.Text = "Wrong Credentials or not Registered Yet!"; }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("authentication/Signup Page.aspx");
        }



        [System.Web.Services.WebMethod(EnableSession = true)]

        public static message testFunction(string txtUserName, string txtPWD)
        {
            Bll BllObj = new Bll();
            message message = new message();
            message.msg = BllObj.logIn(txtUserName, txtPWD);

            return message;
        }

    }
    public class message
    {
        public int msg { set; get; }
    }

}