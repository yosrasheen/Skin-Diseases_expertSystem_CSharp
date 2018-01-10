using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        MESDSTableAdapters.UsersTableAdapter tauser;
        tauser = new MESDSTableAdapters.UsersTableAdapter();
        MESDS.UsersDataTable dtUsers;
        dtUsers = tauser.GetDataByUserInfo(((TextBox)(LoginView1.FindControl("txtUserName"))).Text.ToLower(), ((TextBox)(LoginView1.FindControl("txtPassword"))).Text);
        if (dtUsers.Rows.Count > 0)
        {
            Session["UserName"] = dtUsers[0].UserName;
            Session["IsAdmin"] = dtUsers[0].IsAdmin;
            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(((TextBox)(LoginView1.FindControl("txtUserName"))).Text.ToLower(), ((CheckBox)(LoginView1.FindControl("chkRememberMe"))).Checked);
            //Label1.Text = "";
        }
        else
        {
            ClientScriptManager csm = Page.ClientScript;
            if (!csm.IsClientScriptBlockRegistered(this.GetType(), "PopupScript"))
            {
                csm.RegisterStartupScript(this.GetType(), "PopupScript", "alert('Please Assure that user name and/or password are correct');", true);
            }
        }

    }
}
