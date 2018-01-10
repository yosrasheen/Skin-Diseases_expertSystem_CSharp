<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FFFFCC;
            font-size: large;
           
        }
    </style>

    <div class="post">
			<h2 class="title"><a href="#">services</a></h2>
			
			<div class="entry">
				 <div align="center" width="90%">
    
        <asp:Label ID="lblNodeId" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblNodeType" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblTitle" runat="server" CssClass="style1"></asp:Label>
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server"  CssClass="style1">
            <asp:ListItem Value="True">Yes</asp:ListItem>
            <asp:ListItem Value="False">No</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:LinkButton ID="lnkBtnFirst" runat="server" Visible="False"  CssClass="style1"
            onclick="lnkBtnFirst_Click">First</asp:LinkButton>
&nbsp;
        <asp:LinkButton ID="lnkBtnNext" runat="server" onclick="lnkBtnNext_Click"  CssClass="style1">Next</asp:LinkButton>
&nbsp;&nbsp;
        <asp:LinkButton ID="lnkBtnPrevious" runat="server" Visible="False"  CssClass="style1"
            onclick="lnkBtnPrevious_Click">Previous</asp:LinkButton>
&nbsp;
        <asp:LinkButton ID="lnkBtnFinish" runat="server" Visible="False"  CssClass="style1"
            onclick="lnkBtnFinish_Click">Finish</asp:LinkButton>
    
    </div>
			</div>
		</div>
</asp:Content>

