﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup Page.aspx.cs" Inherits="WebApplication3.Signup_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        function Validation() {
            var errors = "";
            errors += CheckName();
            errors += CheckLocation();
            errors += CheckPassword();
            errors += CheckCnfPassword();
            errors += CheckUsername();
            errors += CheckAge();
            //errors += CheckEmployeeCode();
            if (errors != "") {
                alert(errors);
                return false;
            }
            return true;
        }
        function CheckAge() {
            var TA = document.getElementById('txtAge');
            if (TA.value == "") {
                return 'Please Enter Age !!\n';
            }
            else if (TA.value >= 18) {
                return "";
            }
            else {
                return "Please Enter age above 17 years!!\n";
            }
        }
        function CheckName()
        {
            var FName = document.getElementById('txtFname');
            var LName = document.getElementById('txtLname');
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

        function CheckPassword() {
            var TP = document.getElementById('txtpassword');
            if (TP.value == "") {
                return 'Please enter Password\n';
            }
            else {
                return "";
            }
        }

        function CheckCnfPassword()
        {
            var TP = document.getElementById('txtpassword');
            var TCF = document.getElementById('txtConfirmPassword');
            if (TCF.value == "") {
                return 'Please enter Confirm Password!!\n';
            }
            else if (TP.value == TCF.value) {
                return "";
            }
            else {
                return "Password and Confirm Password does not Match!!\n";
            }
        }

        function CheckLocation() {
            var City = document.getElementById('txtCity');
            var Country = document.getElementById('txtCountry');
            var exp = /^[a-zA-Z]+$/
            if ((City.value == "") || (Country.value == "")) {
                return 'Please do not miss out City or Country !!\n';
            }
            else if ((exp.test(City.value)) && (exp.test(Country.value))) {
                return "";
            }
            else {
                return 'City and Country names can Only have alphabets!!\n'
            }
        }

        function CheckUsername() {
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

        function CheckEmployeeCode()
        {
            var employeeCode = document.getElementById('txtEmployeeCode');
            var exp = /^[0-9]\d{4}$/;
            if (employeeCode.value == "") {
                return 'Enter your Employee Code.\n';
            }
            else if (exp.test(employeeCode.value)) {
                return "";
            }
            else {
                return 'Enter Correct Employee Code!!\n'
            }
        }

        function GoBackBtn() {
            window.location.href = "LoginPage.aspx";
        }
        function click_Register() {
            if (Validation()) {
                register(); 

            }}
        
        function register() {

            var Username = $('#txtUsername').val();
            var ConfirmPassword = $('#txtConfirmPassword').val();
            var Fname = $('#txtFname').val();
            var Lname = $('#txtLname').val();
            var City = $('#txtCity').val();
            var Country = $('#txtCountry').val();
            var EmployeeCode = $('#txtEmployeeCode').val();
            var Age = $('#txtAge').val();
            $.ajax({

                type: "post",
                url: "SignUp Page.aspx/SignUpBtn",
                async: false,
                data: JSON.stringify({ "Username": Username, "ConfirmPassword": ConfirmPassword, "Fname": Fname, "Lname": Lname, "City": City, "Country": Country, "EmployeeCode": EmployeeCode, "Age": Age }),
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    if (data.d == 0) {

                        
                        alert("User Already registered");
                        
                    }
                    else if (data.d==1)
                    alert("User Registered");

                },
                error: function () {
                    alert("Failure");
                }
            })
        }
        




    </script>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
            color: #000000;
        }
        .auto-style2 {
            font-size: large;
        }
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
        height: 100%;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        }
        .auto-style3 {
            font-size: xx-large;
        }
    </style>
</head>
<body style="height: 700px" class="backgroundimage">
    <form id="form1" runat="server" >
        <p style="padding-left:50%; font-size:xx-large" class="auto-style3"><strong>Sign up</strong></p>
        <div style="padding:10% 20% 0%" 60% >

            <table>

                <tr>
                    <td>
                        <asp:Label Text="First Name" runat="server" CssClass="auto-style1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFname" runat="server" CssClass="auto-style2" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label Text="Last Name" runat="server" CssClass="auto-style1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtLname" runat="server" CssClass="auto-style2" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Employee Code" runat="server" CssClass="auto-style1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmployeeCode" runat="server" CssClass="auto-style2" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="City" runat="server" CssClass="auto-style1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="auto-style2" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Country" runat="server" CssClass="auto-style1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCountry" runat="server" CssClass="auto-style2" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Age" runat="server" CssClass="auto-style1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAge" runat="server" CssClass="auto-style2" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style2">
                        <hr style="width: 248px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="User Name" runat="server" CssClass="auto-style2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="auto-style2" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Password" runat="server" CssClass="auto-style2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtpassword" runat="server" CssClass="auto-style2" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Confirm Password" runat="server" CssClass="auto-style2" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="auto-style2" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" class="Button" ID="btnRegister" onclick="click_Register()" style="font-size: medium;">Register</button>

                    </td>
                    <td>

                        <button type="button" class="Button" ID="GobackButton"  style="font-size: medium;" onclick="GoBackBtn()">Go Back</button>

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
