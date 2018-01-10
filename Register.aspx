<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FFFFCC;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="post">
			<h2 class="title"><a href="#">Register</a></h2>
			
			<div class="entry">
            <br />
				<table border="0" cellpadding="0" align="center" cellspacing="0" width="80%">
                <tr>
                <td width="35%" class="style1">User Name :</td>
                <td width="65%">
                    <asp:TextBox ID="txtUserName" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUserName" ErrorMessage="Required" 
                        ValidationGroup="register">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td width="35%" class="style1">Password :</td>
                <td width="65%">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Required" 
                        ValidationGroup="register">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td width="35%" class="style1">Confirm Password :</td>
                <td width="65%">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" 
                        Width="170px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtConfirmPassword" ErrorMessage="Required" 
                        ValidationGroup="register">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtConfirmPassword" ControlToValidate="txtPassword" 
                        ErrorMessage="Not Equal" ValidationGroup="register">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                <td width="35%" class="style1">Email :</td>
                <td width="65%">
                    <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Required" 
                        ValidationGroup="register">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Not Formed Email" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="register">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnRegister" runat="server" 
                        Text="Register" ValidationGroup="register" onclick="btnRegister_Click" />
                    </td>
                 </tr>
                 <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblInfo" runat="server" Font-Size="Medium" ForeColor="Red"></asp:Label>
                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        ShowMessageBox="True" ValidationGroup="register" />
                     </td>
                 </tr>
                </table>
			</div>
		</div>
</asp:Content>

