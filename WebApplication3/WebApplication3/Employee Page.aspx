<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee Page.aspx.cs" Inherits="WebApplication3.Admin_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
           <script type="text/javascript">
        function Validation(evt)
               {
                   alert('Validation');
            var errors = "";
            errors += CheckName(evt);
            errors += CheckLocation(evt);
            errors += CheckUsername(evt);
            errors += CheckAge(evt);
            if (errors != "") {
                alert(errors);
                return false;
            }
        }
        function CheckAge(evt)
        {
            

            var TA = String.fromCharCode(evt.which);
            var Tp = document.getElementById('GridView1_age_0');
            if (TA.value == "")
            {
                alert ('Please Enter Age !!\n');
            }
            else 
            {
                if ((TA.value != "") && ((int)Tp.value >= 18)) {
                    if (!(/[0-9/]/.test(TA))) {
                        evt.preventDefault();
                        //var Tp = document.getElementById('txtAge');
                        //if (Tp.value >= 18) {

                        //    evt.preventDefault();
                        //}
                        //else
                        //{
                        //    return 'Please Enter age above 17 years!!\n';
                        //}
                    }
                }
  
            }
        }
        function CheckName(evt)
        {
            var FName = String.fromCharCode(evt.which);
            var LName = String.fromCharCode(evt.which);
            var exp = /^[a-zA-Z]+$/
            if ((FName.value == "") || (LName.value == ""))
            {
                return 'Please enter your complete name !!\n';
            }
            else if ((exp.test(FName.value)) && (exp.test(LName.value)))
            {
                return "";
            }
            else
            {
                return 'Name can Only have alphabets!!\n'
            }
        }
        function CheckLocation(evt) {
            var City = document.getElementById('txtCity');
            var Country = document.getElementById('txtCountry');
            var exp = /^[a-zA-Z]+$/
            if ((City.value == "") || (Country.value == "")) {
                return 'Please do not miss out City or Country !!\n';
            }
            else if ((exp.test(City.value)) && (exp.test(Country.value)))
            {
                return "";
            }
            else
            {
                return 'City and Country names can Only have alphabets!!\n'
            }
        }
        function CheckUsername(evt) {
            var Username = document.getElementById('txtUsername');
            var exp = /^[a-z. ]+$/
            if (Username.value == "") {
                return 'Enter Your Username !!\n';
            }
            else if (exp.test(Username.value)) {
                return "";
            }
            else {
                return 'Username should not have block letters and numbers!!\n'
            }
               }



               function getUrlVars() {
                   var vars = [], hash;
                   var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                   for (var i = 0; i < hashes.length; i++) {
                       hash = hashes[i].split('=');
                       vars.push(hash[0]);
                       vars[hash[0]] = hash[1];
                   }
                   return vars;
               }
               </script>
   

    <title></title>
     <style type="text/css">
         .Button
        {
        color: #fff !important;
        text-transform: uppercase;
        text-decoration: none;
        background: #ed3330;
        padding: 10px;
        border-radius: 5px;
        display: inline-block;
        border: none;
        transition: all 0.4s ease 0s;
        }
        .Button:hover
        {
        background: #434343;
        letter-spacing: 1px;
        -webkit-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
        -moz-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
        box-shadow: 5px 40px -10px rgba(0,0,0,0.57);
        transition: all 0.4s ease 0s;
        }
        .backgroundimage {
        background-image:url('images/page.jpg');
        background-repeat:no-repeat;
        width: 99%;
        height: 100%;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        }
    </style>
</head>
<body  class="backgroundimage">
    <form id="form1" runat="server">
        <div style="height: 702px; text-align: left">
            <div>
                <h1>
                    
                    <asp:Label ID="welcomeUser" runat="server" Text="Label"></asp:Label>
                    
                </h1>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" style="text-align: center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <EditItemTemplate>
                            <asp:Label ID="LabelID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Labelid" runat="server" style="text-align: left" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Code">
                        <EditItemTemplate>
                            <asp:Label ID="EmployeeCodeLabel" runat="server" Text='<%# Eval("EmployeeCode") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="employeecodeLabel" runat="server" Text='<%# Eval("EmployeeCode") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="firstName" OnKeyPress="return Validation(event);" runat="server" Text='<%# Eval("Fname") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="firstname" runat="server" style="text-align: center" Text='<%# Eval("Fname") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="lastName" OnKeyPress="return Validation(event);" runat="server" Text='<%# Eval( "Lname") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lastname" runat="server" Text='<%# Eval("Lname") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="city" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="city" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <EditItemTemplate>
                            <asp:TextBox ID="country" runat="server" Text='<%# Eval("Country") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="country" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Username">
                        <EditItemTemplate>
                            <asp:TextBox ID="uName" runat="server" Text='<%# Eval("Username") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="uname" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Issued items">
                        <EditItemTemplate>
                            <asp:Label ID="itemsIssued" runat="server" Text='<%# Eval("Items Issued") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="itemsissued" runat="server" Text='<%# Eval("Items Issued") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Age">
                        <EditItemTemplate>
                            <asp:TextBox ID="age"  runat="server" Text='<%# Eval("AGE") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="agelabel" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Operations">
                        <EditItemTemplate>
                            &nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return Validation(event);" CommandName="UPDATE">UPDATE</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="CANCEL">CANCEL</asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="Black" />
                <HeaderStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="Black" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <br />
            <asp:Label ID="AdminSays" runat="server" Text="Admin say:"></asp:Label>
&nbsp;
            <asp:Label ID="messageFromAdmin" runat="server">Have a good day!</asp:Label>
            <br />
&nbsp;<br />
            <asp:Button class="Button" ID="ClearMsgButton" runat="server" Text="Mark as read" OnClick="ClearMsgButton_Click" />
            <br />
            <br />
            <asp:Label ID="DataUpdatedLabel" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="IssueItem" runat="server" Text="Select fom the list the item you wish to borrow"></asp:Label>
            <asp:DropDownList ID="DropDownListitems" runat="server">

            </asp:DropDownList>
            <br />
            <asp:Button ID="IssueButton" class="Button" runat="server" OnClick="IssueButton_Click" Text="Borrow" />
            <br />
            <br />
            <asp:Label ID="itemIssuedLabel" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Button ID="SignOutButton" class="Button" runat="server" OnClick="SignOutButton_Click" Text="Sign out" />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Cure_ResourcesConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Employees] ([EmployeeCode], [Fname], [Lname], [City], [Country], [Username], [Items Issued], [AGE]) VALUES (@EmployeeCode, @Fname, @Lname, @City, @Country, @Username, @Items_Issued, @AGE)" SelectCommand="SELECT * FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [EmployeeCode] = @EmployeeCode, [Fname] = @Fname, [Lname] = @Lname, [City] = @City, [Country] = @Country, [Username] = @Username, [Items Issued] = @Items_Issued, [AGE] = @AGE WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EmployeeCode" Type="Double" />
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Items_Issued" Type="String" />
                <asp:Parameter Name="AGE" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EmployeeCode" Type="Double" />
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Items_Issued" Type="String" />
                <asp:Parameter Name="AGE" Type="Int32" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
