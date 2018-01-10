<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageDiagnosis.aspx.cs" Inherits="ManageDiagnosis" %>

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
			<h2 class="title"><a href="#">Manage Syptoms</a></h2>
			
			<div class="entry">
            <br />

                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MESDSTableAdapters.DiagnosisTableAdapter" DeleteMethod="Delete" 
                    InsertMethod="Insert" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_DiagnosisNo" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DiagnosisTitle" Type="String" />
                        <asp:Parameter Name="DiagnosisDescription" Type="String" />
                        <asp:Parameter Name="DangerRate" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DiagnosisTitle" Type="String" />
                        <asp:Parameter Name="DiagnosisDescription" Type="String" />
                        <asp:Parameter Name="DangerRate" Type="String" />
                        <asp:Parameter Name="Original_DiagnosisNo" Type="Int64" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
               
				<table border="0" cellpadding="0" align="center" cellspacing="0" width="99%">
                <tr>
                <td colspan="2" align="center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="DiagnosisNo" DataSourceID="ObjectDataSource1" 
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                    Width="99%" onrowdatabound="GridView1_RowDataBound" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        onrowdeleted="GridView1_RowDeleted">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="DiagnosisNo" HeaderText="DiagnosisNo" 
                            InsertVisible="False" ReadOnly="True" SortExpression="DiagnosisNo" />
                        <asp:BoundField DataField="DiagnosisTitle" HeaderText="DiagnosisTitle" 
                            SortExpression="DiagnosisTitle" />
                        <asp:BoundField DataField="DiagnosisDescription" HeaderText="DiagnosisDescription" 
                            SortExpression="DiagnosisDescription" />
                        <asp:BoundField DataField="DangerRate" HeaderText="DangerRate" 
                            SortExpression="DangerRate" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                </asp:GridView>
                 <br />
                    </td>
                </tr>
                <tr>
                <td width="25%" class="style1">No :</td>
                <td width="75%" align="left">
                    <asp:TextBox ID="txtNo" runat="server" Width="77px" ReadOnly="True"></asp:TextBox>
                    <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                <td width="25%" class="style1">Title :</td>
                <td width="75%">
                    <asp:TextBox ID="txtTitle" runat="server" Width="380px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtTitle" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td width="25%" class="style1">Description :</td>
                <td width="75%">
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" 
                        Width="380px" Rows="6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtDescription" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td width="25%" class="style1">Danger Rate :</td>
                <td width="75%">
                    <asp:TextBox ID="txtDangerRate" runat="server" Width="380px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td colspan="2" align="center">
                    &nbsp;<asp:Button ID="btnAddNew" runat="server" 
                        Text="Add New" onclick="btnAddNew_Click" CausesValidation="False" />
                    &nbsp;
                    <asp:Button ID="btnSave" runat="server" 
                        Text="Save" ValidationGroup="register" onclick="btnSave_Click" />
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
