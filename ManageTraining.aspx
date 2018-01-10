<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageTraining.aspx.cs" Inherits="ManageTraining" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <style type="text/css">
        .style1
        {
        }
    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="post">
			<h2 class="title"><a href="#">Manage Training</a></h2>
			
			<div class="entry">
            <br />
				<table border="0" cellpadding="0" align="center" cellspacing="0" width="98%">
                <tr>
                <td class="style1">
                    From:
                    <asp:DropDownList ID="ddFrom" runat="server" DataSourceID="ObjectDataSource1" 
                        DataTextField="Title" DataValueField="ID" Width="600px" 
                        ondatabound="ddFrom_DataBound">
                    </asp:DropDownList>
                    <br />
&nbsp;To:&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddTo" runat="server" DataSourceID="ObjectDataSource1" 
                        DataTextField="Title" DataValueField="ID" Width="600px" 
                        ondatabound="ddTo_DataBound">
                    </asp:DropDownList>
&nbsp;<br />
                    Condition:
                    <asp:DropDownList ID="ddDecision" runat="server">
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="2">No</asp:ListItem>
                    </asp:DropDownList>
&nbsp;&nbsp;
                    <asp:CheckBox ID="chkRoot" runat="server" Text="Is Root" />
&nbsp;<asp:Button ID="btnAdd" runat="server" 
                        Text="Add" onclick="btnAdd_Click" Width="64px"  />
                    </td>
                </tr>
                <tr>
                <td align="left">
                    <asp:ListBox ID="lstFlow" runat="server" Rows="20" Width="99%" 
                        Font-Size="X-Small"></asp:ListBox>
                    </td>
                </tr>
                <tr>
                <td align="center">
                    <asp:Button ID="btnDelete" runat="server" 
                        Text="Delete" onclick="btnDelete_Click"  />
                    </td>
                 </tr>
                 <tr>
                <td align="center">
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="MESDSTableAdapters.ExpertNodesTitlesTableAdapter">
                    </asp:ObjectDataSource>
                     </td>
                 </tr>
                </table>
			</div>
		</div>

</asp:Content>


