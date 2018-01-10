using System;
using System.Web.UI;

public partial class EditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (! Page.IsPostBack)
        {
             MESDSTableAdapters.UsersTableAdapter tauser;
            tauser = new MESDSTableAdapters.UsersTableAdapter();
            MESDS.UsersDataTable dtUsers;
            MESDS.UsersRow ur;
             dtUsers = tauser.GetDataByUserName(Session["UserName"].ToString().ToLower());
             if (dtUsers.Rows.Count > 0)
                 {
                     ur = (MESDS.UsersRow)dtUsers.Rows[0];
                     txtEmail.Text = ur.UserEmail;
                     try { txtDOB.Text = ur.DateOfBirth.ToString("dd/MM/yyyy"); }
                     catch { }

                     try { txtNationality.Text = ur.Nationality; }
                     catch { }
                     try { DropDownList1.SelectedValue = (ur.Gender ? "1" : "0"); }
                     catch { }

                 }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
         MESDSTableAdapters.UsersTableAdapter tauser;
            tauser = new MESDSTableAdapters.UsersTableAdapter();
            MESDS.UsersDataTable dtUsers;
            MESDS.UsersRow ur;
             dtUsers = tauser.GetDataByUserName(Session["UserName"].ToString().ToLower());
             if (dtUsers.Rows.Count > 0)
             {
                 ur = (MESDS.UsersRow)dtUsers.Rows[0];
                 ur.UserEmail = txtEmail.Text;
                 ur.DateOfBirth = DateTime.Parse(txtDOB.Text);
                 ur.Nationality = txtNationality.Text;
                 ur.Gender = DropDownList1.SelectedValue.Equals("0") ? false : true;
                 tauser.Update(ur);
                 ur.AcceptChanges();
             }
    }
}