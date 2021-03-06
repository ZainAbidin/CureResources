﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Page.aspx.cs" Inherits="WebApplication3.Admin_Page1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $("#sendBroadcast").hide();
            $("#Broadcast").hide();

                
        });
            $("#ViewAllEmployeesBtn").click(function () {

                $.ajax({

                    type: "post",
                    url: "Admin_Page.aspx/ViewAllEmployees",
                    async: false,
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data) {
                        alert("View All Employees ");
                       
                    },
                    error: function () {
                        alert("Failure");
                    }
                })
            });
      

        function redirectToEditEmployee() {

            window.location.href = "EditEmployees.aspx";
        }
        function makeBroadcastvisible() {

            $("#sendBroadcast").show();
            $("#Broadcast").show();
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
<body style="height: 750px; text-align: left;" class="backgroundimage">
    <form id="form1" runat="server" >
        <div class="container" style="padding-left:40%">
            <h1>
                Welcome Admin!
            </h1>

        </div>
        <div style="height: 205px; padding-left: 40%">
          
            <asp:Button class="Button" ID="ViewAllEmployeesBtn" runat="server" OnClick="ViewAllEmployeesBtn_Click" Text="View All Employees" Width="300px" />
            <br />
            <br />
            <button type="button" style="Width:300px" class="Button" ID="EditEmployeeBtn" OnClick="redirectToEditEmployee()">Edit Employee</button>  
            <br />
            <br />
            <button type = "button" style="width:300px" class="Button" ID="SendMessageBtn" OnClick="makeBroadcastvisible()">Broadcast message</button>

            <br />
            <br />
            <asp:Label ID="broadcastrLabel" runat="server" style="font-size: large"></asp:Label>
            <br />
            <asp:TextBox ID="Broadcast" runat="server"  Height="58px" Width="285px"></asp:TextBox>
            <br />
            <br />
            <asp:Button class="Button" ID="sendBroadcast"  runat="server" OnClick="sendBroadcast_Click" Text="Send" />
        
        </div>
        <div style="padding-left: 20%; height: 197px;">
            <asp:GridView ID="ViewAllEmployeeGrid" runat="server" AutoGenerateColumns="false" style="font-size: large">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText ="ID" />
                    <asp:BoundField DataField="EmployeeCode" HeaderText ="Employee Code" />
                    <asp:BoundField DataField="Fname" HeaderText ="First Name" />
                    <asp:BoundField DataField="Lname" HeaderText ="Last Name" />
                    <asp:BoundField DataField="City" HeaderText ="City" /> 
                    <asp:BoundField DataField="Country" HeaderText ="Country" />
                    <asp:BoundField DataField="Username" HeaderText ="Username" />
                    <asp:BoundField DataField="AGE" HeaderText ="Age" />
                    <asp:BoundField DataField="Activity" HeaderText ="Activity" />
                    <asp:BoundField DataField="Items Issued" HeaderText ="Items Issued" />
                    
                </Columns>
            </asp:GridView>
        </div>


    </form>
</body>
</html>
