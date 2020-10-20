using System;
using BLL;
namespace WebApplication3
{
    public partial class EditEmployees : System.Web.UI.Page
    {
        Bll BllObj = new Bll();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("LoginPage.aspx");
            //}
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
        SearchEmployeeGrid.DataSource = BllObj.searchEmployee(SearchBox.Text);
        SearchEmployeeGrid.DataBind();
        }

        //protected void Activitybtn_Click(object sender, EventArgs e)
        //{

        //    if ((ActivityCheck1.Checked == true) && (ActivityCheck2.Checked == false))
        //    {
        //        SearchEmployeeGrid.DataSource = BllObj.spChangeEmployeeStatus(ActivityTextbox.Text);
        //        SearchEmployeeGrid.DataBind();

        //    }
        //    //else if ((ActivityCheck1.Checked == false) && (ActivityCheck2.Checked == true))
        //    //{
        //    //    BllObj.spMessageToEmployee(ActivityTextbox.Text, Messagebox.Text);
        //    //    messageSentLabel.Text = "Message sent";

        //    //}
        //    else if ((ActivityCheck1.Checked == true) && (ActivityCheck2.Checked == true))
        //    {
        //        SearchEmployeeGrid.DataSource = BllObj.spChangeEmployeeStatus(ActivityTextbox.Text);
        //        BllObj.spMessageToEmployee(ActivityTextbox.Text, Messagebox.Text);
        //        messageSentLabel.Text = "Message sent";
        //        SearchEmployeeGrid.DataBind();
        //    }
        //}

        [System.Web.Services.WebMethod(EnableSession = true)]

        public static void DoneBtn(string activityTextBox, string messageTextBox)
        {
            Bll BllObj = new Bll();
            BllObj.spMessageToEmployee(activityTextBox, messageTextBox);
            //messageSentLabel.Text = "Message sent";
        }


        protected void BackBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Page.aspx");
        }
    }
}