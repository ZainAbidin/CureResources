using System;
using BLL;
using System.Web.UI.WebControls;
namespace WebApplication3
{
    public partial class Admin_Page1 : System.Web.UI.Page
    {
        Bll BllObj = new Bll();

        protected void Page_Load(object sender, EventArgs e)
        {
                                                                       
            //if ((Session["username"] == null) || ((string)Session["username"] != "saad.bakhshi"))
            //{
            //    Response.Redirect("LoginPage.aspx");
            //}

            //sendBroadcast.Visible = false;
            //Broadcast.Visible = false;
            ViewAllEmployeeGrid.Visible = false;
        }

        protected void ViewAllEmployeesBtn_Click(object sender, EventArgs e)
        {

        }

        protected void EditEmployee_Click(object sender, EventArgs e)
        {

        }

        protected void SendMessage_Click(object sender, EventArgs e)
        {

        }

        protected void sendBroadcast_Click(object sender, EventArgs e)
        {

            BllObj.adminPageBroadcast(Broadcast.Text);
            broadcastrLabel.Text = "Message Broadcasted!";
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void ViewAllEmployees()
        {
            Bll BllObj = new Bll();
            GridView ViewAllEmployeeGrid = new GridView();
            ViewAllEmployeeGrid.DataSource = BllObj.viewAll();
            ViewAllEmployeeGrid.DataBind();
            ViewAllEmployeeGrid.Visible = true;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void BroadCast()
        {

        }

    }

}