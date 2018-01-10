using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        MESDSTableAdapters.UsersTableAdapter tauser;
        tauser = new MESDSTableAdapters.UsersTableAdapter();
        MESDS.UsersDataTable dtUsers;
        dtUsers = tauser.GetDataByUserName(txtUserName.Text.ToLower());
        if (dtUsers.Rows.Count > 0)
        {
            ClientScriptManager csm = Page.ClientScript;
            if (!csm.IsClientScriptBlockRegistered(this.GetType(), "PopupScript"))
            {
                csm.RegisterStartupScript(this.GetType(), "PopupScript", "alert('User Name Is already Exist');", true);
            }
            
        }
        else
        {
            tauser.Insert(txtUserName.Text.ToLower(), txtEmail.Text, txtPassword.Text, false, DateTime.Now,new DateTime(1990,1,1), true, "");
            ClientScriptManager csm = Page.ClientScript;
            if (!csm.IsClientScriptBlockRegistered(this.GetType(), "PopupScript"))
            {
                csm.RegisterStartupScript(this.GetType(), "PopupScript", "alert('New Account Added Successfully, Kindly go to login page');", true);
            }
        }
    }
}