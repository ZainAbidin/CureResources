<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditEmployees.aspx.cs" Inherits="WebApplication3.EditEmployees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">


function DoneBtnClick() {

            var activity = $('#ActivityTextbox').val();
            var message = $('#Messagebox').val();
            $.ajax({

                type: "post",
                url: "EditEmployees.aspx/DoneBtn",
                async: false,
                data: JSON.stringify({ "activityTextBox": activity,"messageTextBox":message}),
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {

                    $('#messageSentLabel').text("Message Sent");
                },
                error: function () {
                    alert("Failure");
                }
            })
        }
    </script>
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
  
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            text-align: justify;
        }
    </style>

</head>
<body  class="backgroundimage">
    <form id="form1" runat="server">
        <div style="height: 650px; padding-top:5%;" class="auto-style3">
            <div class="auto-style1">
            <asp:TextBox ID="SearchBox" placeholder="Search by Firstname, username or city..." runat="server" Width="482px" CssClass="auto-style2"></asp:TextBox>
                <span class="auto-style2">&nbsp;&nbsp;&nbsp;
            </span>
            <asp:Button class="Button" ID="SearchBtn" runat="server" OnClick="SearchBtn_Click" Text="Search" />
            </div>
            <div>
            <br />
            <br />
            </div>
            <div style="text-align: center">
            <asp:GridView ID="SearchEmployeeGrid" runat="server" AutoGenerateColumns="false" style="font-size: large; margin-left: 0px;" Width="1503px">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText ="ID" />
                    <asp:BoundField DataField="EmployeeCode" HeaderText ="Employee Code" />
                    <asp:BoundField DataField="Fname" HeaderText ="First Name" />
                    <asp:BoundField DataField="Lname" HeaderText ="Last Name" />
                    <asp:BoundField DataField="City" HeaderText ="City" /> 
                    <asp:BoundField DataField="Country" HeaderText ="Country" />
                    <asp:BoundField DataField="Username" HeaderText ="Username" />
                    <asp:BoundField DataField="Pword" HeaderText ="Password" />
                    <asp:BoundField DataField="AGE" HeaderText ="Age" />
                    <asp:BoundField DataField="Activity" HeaderText ="Employee Status" />
                    <asp:BoundField DataField="Items Issued" HeaderText ="Items Issued" />
                    
                    
                </Columns>
            </asp:GridView>
            </div>
            <br />
            <div style="padding-left:30%; font-size: large;" class="auto-style4">
            <asp:Label ID="ActivityLabel" runat="server" Text="Enter Username to mark Active/Inactive or send messsage"></asp:Label>
&nbsp;
            <asp:TextBox ID="ActivityTextbox" runat="server" ></asp:TextBox>
&nbsp;
            <br />
            <br />
            <br />
            <asp:CheckBox ID="ActivityCheck1" runat="server" Text="Mark Active/Inactive" />
            <br />
            <br />
            <asp:CheckBox ID="ActivityCheck2" runat="server" Text="Send Message" />
            <br />
            <br />
            <br />
            <asp:TextBox ID="Messagebox" placeholder="Type your message here..." runat="server" Height="80px" Width="236px" style="text-align: left"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Label ID="messageSentLabel" runat="server"></asp:Label>
            <br />
            <br />
            <button type="button" class="Button" ID="Activitybtn" onclick="DoneBtnClick()">Done</button>
                <br />
                <br />
                <br />
                <asp:Button class="Button" ID="BackBtn" runat="server" OnClick="BackBtn_Click" Text="Go Back" />
            <br />
            </div>
        </div>
    </form>
</body>
</html>
