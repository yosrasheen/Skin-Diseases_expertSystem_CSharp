using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageTraining : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!Boolean.Parse(Session["IsAdmin"].ToString()))
                Response.Redirect("Default.aspx");
            BindFlow();
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (lstFlow.SelectedIndex > 0)
        {
            MESDSTableAdapters.ExpertFlowTableAdapter ta = new MESDSTableAdapters.ExpertFlowTableAdapter();
            ta.Delete(int.Parse(lstFlow.SelectedValue));
            lstFlow.Items.Remove(lstFlow.SelectedItem);
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        MESDSTableAdapters.ExpertFlowTableAdapter ta = new MESDSTableAdapters.ExpertFlowTableAdapter();
        ta.Insert(long.Parse(ddFrom.SelectedValue), long.Parse(ddTo.SelectedValue), ddDecision.SelectedValue.Equals("1") ? true : false,chkRoot.Checked);
        BindFlow();
    }
    private void BindFlow()
    {
        lstFlow.Items.Clear();
        MESDSTableAdapters.VwFlowTableAdapter ta = new MESDSTableAdapters.VwFlowTableAdapter();
        MESDS.VwFlowRow dr;
        MESDS ds = new MESDS();
        ta.FillBy(ds.VwFlow);
        if (ds.VwFlow.Rows.Count > 0)
        {
            string line = "";
            for (int i = 0; i < ds.VwFlow.Rows.Count; i++)
            {
                line = "";
                dr = (MESDS.VwFlowRow)ds.VwFlow.Rows[i];
                line = dr.FromTitle + " TO " + dr.ToTitle + " BY " + (dr.Decision ? "Yes" : "No");
                if (dr.IsRoot)
                    line += " IS ROOT";
                lstFlow.Items.Add(new ListItem(line,dr.ID.ToString()));
            }
        }
    }
    protected void ddFrom_DataBound(object sender, EventArgs e)
    {
        ExpertTEST.SessionClass.BindTooltip(ddFrom);
    }
    protected void ddTo_DataBound(object sender, EventArgs e)
    {
        ExpertTEST.SessionClass.BindTooltip(ddTo);
    }
}