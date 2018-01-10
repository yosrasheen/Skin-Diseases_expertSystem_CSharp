<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="post">
			<h2 class="title"><a href="#">Update Profile</a></h2>
			
			<div class="entry">
            <br />
				<table border="0" cellpadding="0" align="center" cellspacing="0" width="80%">
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
                <td width="35%" class="style1">Date Of Birth :</td>
                <td width="65%" class="style1">
                    <asp:TextBox ID="txtDOB" runat="server" Width="190px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td width="35%" class="style1">Gender :</td>
                <td width="65%">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="0">Male</asp:ListItem>
                        <asp:ListItem Value="1">Female</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                <td width="35%" class="style1">Nationality:</td>
                <td width="65%">
                    <asp:TextBox ID="txtNationality" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnSave" runat="server" 
                        Text="Save" ValidationGroup="register" onclick="btnSave_Click"  />
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

