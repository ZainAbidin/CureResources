using System; 
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using BLL;


namespace WebApplication3
{
    public partial class Admin_Page : System.Web.UI.Page
    {
        Bll BllObj = new Bll();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                welcomeUser.Text = "Welcome " + Session["Username"] + "!";
                GridView1.DataSource = BllObj.getUserByUsername((string)Session["Username"]);
                GridView1.DataBind();
                ListItem Laptop = new ListItem("Laptop", "Laptop");
                ListItem Chair = new ListItem("Chair", "Chair");
                ListItem LCD = new ListItem("LCD", "LCD");
                ListItem Mouse = new ListItem("Mouse", "Mouse");
                ListItem Headphones = new ListItem("Headphones", "Headphones");
                DropDownListitems.Items.Add(Laptop);
                DropDownListitems.Items.Add(Chair);
                DropDownListitems.Items.Add(LCD);
                DropDownListitems.Items.Add(Mouse);
                DropDownListitems.Items.Add(Headphones);

            }
            if (Session["username"] == null)
            {
                Response.Redirect("LoginPage.aspx");
            }

            messageFromAdmin.Text = BllObj.getMessageForEmployee((string)Session["Username"]);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = BllObj.getUserByUsername((string)Session["Username"]);
            GridView1.DataBind();
            DataUpdatedLabel.Text = "";
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.White;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = BllObj.getUserByUsername((string)Session["Username"]);
            GridView1.DataBind();
            DataUpdatedLabel.Text = "";
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label EmployeeCode = GridView1.Rows[e.RowIndex].FindControl("EmployeeCodeLabel") as Label;
            TextBox Fname = GridView1.Rows[e.RowIndex].FindControl("firstName") as TextBox;
            TextBox Lname = GridView1.Rows[e.RowIndex].FindControl("lastName") as TextBox;
            TextBox City = GridView1.Rows[e.RowIndex].FindControl("city") as TextBox;
            TextBox Country = GridView1.Rows[e.RowIndex].FindControl("country") as TextBox;
            TextBox Username = GridView1.Rows[e.RowIndex].FindControl("uName") as TextBox;
            TextBox AGE = GridView1.Rows[e.RowIndex].FindControl("age") as TextBox;
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            if (BllObj.EmployeeUpdate(EmployeeCode.Text, Fname.Text, Lname.Text, City.Text, Country.Text, Username.Text, AGE.Text) == 0)
            {
                DataUpdatedLabel.Text = "Data Updated";
                GridView1.EditIndex = -1;
                SqlDataSource1.DataBind();
                GridView1.DataSource = BllObj.getUserByUsername((string)Session["Username"]);
                GridView1.DataBind();
            }
            else
            {
                DataUpdatedLabel.Text = "Data not updated";
            }


        }

        protected void IssueButton_Click(object sender, EventArgs e)
        { 

            if (BllObj.EmployeeIssueItem((string)Session["Username"], DropDownListitems.Text) == "1")
            {
                GridView1.DataSource = BllObj.getUserByUsername((string)Session["Username"]);
                GridView1.DataBind();
                itemIssuedLabel.Text = "Woah!! it seems that you already have this item, Sorry you cannot borrow it.";
            }
            else
            {
                GridView1.DataSource = BllObj.getUserByUsername((string)Session["Username"]);
                GridView1.DataBind();
                itemIssuedLabel.Text = "Item you requested has been issued to you collect it from the IT department.";
            }
            
        }

        protected void SignOutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }

        protected void ClearMsgButton_Click(object sender, EventArgs e)
        {
            BllObj.clearmessagesByEmployee((string)Session["Username"]);
            messageFromAdmin.Text = "Have a good day!";
        }




    }
}
