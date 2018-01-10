<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyCases.aspx.cs" Inherits="MyCases" %>


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
			<h2 class="title"><a href="#">My Cases</a></h2>
			
			<div class="entry">
            <br />
				<table border="0" cellpadding="0" align="center" cellspacing="0" width="90%">
                <tr>
                <td  class="style1"> 
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                        DataKeyNames="ID" DataSourceID="ObjectDataSource1" EnableModelValidation="True" 
                        ForeColor="#333333" GridLines="None" Width="95%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="CaseDate" HeaderText="CaseDate" 
                                SortExpression="CaseDate" />
                            <asp:HyperLinkField DataNavigateUrlFields="FileName" DataTextField="FileName" 
                                HeaderText="Record" ControlStyle-ForeColor="Red" >
                            <ItemStyle/>
                            </asp:HyperLinkField>
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                        DeleteMethod="Delete" InsertMethod="Insert" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByUser" 
                        TypeName="MESDSTableAdapters.UserCasesTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_ID" Type="Int64" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="FileName" Type="String" />
                            <asp:Parameter Name="CaseDate" Type="DateTime" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="user" Name="User" SessionField="UserName" 
                                Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="FileName" Type="String" />
                            <asp:Parameter Name="CaseDate" Type="DateTime" />
                            <asp:Parameter Name="Original_ID" Type="Int64" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    </td>
                </tr>
                </table>
			</div>
		</div>

</asp:Content>

