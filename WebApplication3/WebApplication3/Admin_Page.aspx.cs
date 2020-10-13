using System;
using BLL;
namespace WebApplication3
{
    public partial class Admin_Page1 : System.Web.UI.Page
    {
        Bll BllObj = new Bll();

        protected void Page_Load(object sender, EventArgs e)
        {

            //if ((string)Session["username"] != null)
            //{
            //    sendBroadcast.Visible = false;
            //    Broadcast.Visible = false;
            //    ViewAllEmployeeGrid.Visible = false;
            //}
            //else
            //{
            //    Response.Redirect("Signup Page.aspx");
            //}
                                                                       
            if ((Session["username"] == null) || ((string)Session["username"] != "saad.bakhshi"))
            {
                Response.Redirect("LoginPage.aspx");
            }

            sendBroadcast.Visible = false;
            Broadcast.Visible = false;
            ViewAllEmployeeGrid.Visible = false;
        }

        protected void ViewAllEmployeesBtn_Click(object sender, EventArgs e)
        {
            ViewAllEmployeeGrid.DataSource = BllObj.viewAll();
            ViewAllEmployeeGrid.DataBind();
            ViewAllEmployeeGrid.Visible = true;
        }

        protected void EditEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditEmployees.aspx");
        }

        protected void SendMessage_Click(object sender, EventArgs e)
        {
            sendBroadcast.Visible = true;
            Broadcast.Visible = true;

        }

        protected void sendBroadcast_Click(object sender, EventArgs e)
        {
            
            BllObj.adminPageBroadcast(Broadcast.Text);
            broadcastrLabel.Text = "Message Broadcasted!";
        }
    }
}