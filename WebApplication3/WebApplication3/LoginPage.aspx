 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebApplication3.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">

        function Validation() {
            var errors = "";
            errors += CheckPassword();
            errors += CheckUsername();
            if (errors != "") {
                alert(errors);
                return false;
            }
        }
        function CheckPassword() {
            var TP = document.getElementById('txtPWD');
            if (TP.value == "") {
                return 'Please enter Password\n';
            }
            else {
                return "";
            }
        }
        function CheckUsername() {
            var Username = document.getElementById('txtUserName');
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


        $(document).ready(function () {
            $("#btnSubmit").click(function () {

                var username = $('#txtUserName').val();
                var password = $('#txtPWD').val();

                $.ajax({

                    type: "post",
                    url: "LoginPage.aspx/testFunction",
                    async: false,
                    data: JSON.stringify({ "txtUserName": username, "txtPWD": password }),
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d.msg == 0)
                        {
                            alert("User registered");
                            window.location.href = "Employee Page.aspx?username=" + username;
                        }
                        else if (data.d.msg == 1)
                        {
                            alert("Admin");
                            window.location.href = "Admin_Page.aspx";
                        }
                        else
                        {
                            alert("Wrong credentials or user not registered yet!")
                        }
                    },
                    error: function () {
                        alert("Failure");
                    }
                })
            });
        });


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
        background-image:url('images/signup.png');
        background-repeat:no-repeat;
        width: 99%;
        height: 700px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        }
        .auto-style1 {
            font-size: xx-large;
        }
        .body{
            margin:0px 0px 0px 0px;
            padding:0% 0% 0% 0%;
        }
    </style>
</head>
<body class="backgroundimage">
    <form id="form1" runat="server" >
        <h1 style="padding-left:40%; " class="auto-style1"><strong style="text-align: left">Cure Resources</strong></h1>
=
      <div style="font-size:x-large">
          <br />
          <br />
    <table align="center" style="width: 448px">
        <tr>
            <td>
                Username:
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" Width="250px"/>
            </td>
        </tr>
        <tr>
           <td>
            Password:
           </td>
            <td>
                <asp:TextBox ID="txtPWD" runat="server" TextMode="Password" Width="250px"/>
           </td>
       </tr>
        <tr>
            <td>
          </td>
            <td>
                <input runat="server" type = "Button" ID="btnSubmit"  class="Button"  Text="Login" OnClientClick="return Validation()" onclick="btnSubmit_Click" />
                &nbsp;&nbsp;
              
                <asp:Button ID="btnSignup" class="Button" runat="server" Text="Sign up" OnClick="btnSignup_Click" />
            
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="MessageLabel" runat="server"></asp:Label>
            </td>
        </tr>
      </table>
</div>

    </form>
</body>
</html>
