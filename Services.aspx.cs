using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExpertTEST;
public partial class Services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                applyWizardSteps();
                MESDSTableAdapters.VwFlowTableAdapter ta = new MESDSTableAdapters.VwFlowTableAdapter();
                MESDS ds = new MESDS();
                MESDS.VwFlowRow dr;
                ta.FillByRoot(ds.VwFlow);
                dr = (MESDS.VwFlowRow)ds.VwFlow.Rows[0];
                lblNodeId.Text = dr.NodeIdFrom.ToString();
                lblTitle.Text = dr.FromTitle;
                lblNodeType.Text = dr.NodeFromType.ToString();
                RadioButtonList1.SelectedIndex = 0;
                SessionClass.Step = 0;
            }
            catch { }
        }
    }
    private void applyWizardSteps()
    {
        if (SessionClass.Step <= 0)
        {
            //lnkBtnFinish.Enabled = false;
            lnkBtnFirst.Visible = false;
            lnkBtnPrevious.Visible = false;
            lnkBtnNext.Visible = true;
        }
        else
        {
            // lnkBtnFinish.Enabled = false;
            lnkBtnFirst.Visible = true;
            lnkBtnPrevious.Visible = true;
            lnkBtnNext.Visible = true;
        }
        if (lnkBtnFinish.Visible)
            lnkBtnNext.Visible = false;

    }
    private void LoadQuestion(string move)
    {
        MESDSTableAdapters.VwFlowTableAdapter ta = new MESDSTableAdapters.VwFlowTableAdapter();
        MESDS ds = new MESDS();
        MESDS.VwFlowRow dr;
        switch (move)
        {
            case "First":
                lblNodeId.Text = ((Node)SessionClass.Flow[0]).from.ToString();
                lblTitle.Text = ((Node)SessionClass.Flow[0]).fromTitle.ToString();
                lblNodeType.Text = ((Node)SessionClass.Flow[0]).type.ToString();
                RadioButtonList1.SelectedValue = ((Node)SessionClass.Flow[0]).decision.ToString();
                lnkBtnFinish.Visible = false;
                break;
            case "Next":
                SessionClass.AddNode(SessionClass.Step - 1, int.Parse(lblNodeId.Text), RadioButtonList1.SelectedValue, lblTitle.Text, int.Parse(lblNodeType.Text));
                ta.FillByIDndDec(ds.VwFlow, int.Parse(lblNodeId.Text), RadioButtonList1.SelectedValue.Equals("True"));
                if (ds.VwFlow.Rows.Count > 0)
                {
                    dr = (MESDS.VwFlowRow)ds.VwFlow.Rows[0];
                    lblNodeId.Text = dr.NodeIdTo.ToString();
                    lblTitle.Text = dr.ToTitle;
                    lblNodeType.Text = dr.NodeToType.ToString();
                    RadioButtonList1.SelectedIndex = 0;
                    if (dr.NodeToType == 2)
                    {
                        lblTitle.Text = "Diagnosis Is : " + lblTitle.Text;
                        lnkBtnFinish.Visible = true;
                        lblNodeType.Text = "2";
                        SessionClass.AddNode(SessionClass.Step, int.Parse(lblNodeId.Text), RadioButtonList1.SelectedValue, lblTitle.Text, int.Parse(lblNodeType.Text));
                    }
                    //if (dr.NodeToType == 3 || dr.NodeToType == 4)
                    //{
                    //    if (dr.NodeToType == 3)
                    //    {

                    //    }
                    //    else
                    //    {
                    //    }
                    //}
                }
                else
                {
                    lblNodeId.Text = "-1";
                    lblTitle.Text = "Please Contact your Doctor";
                    lnkBtnFinish.Visible = true;
                    lblNodeType.Text = "2";
                    SessionClass.AddNode(SessionClass.Step, int.Parse(lblNodeId.Text), RadioButtonList1.SelectedValue, lblTitle.Text, int.Parse(lblNodeType.Text));
                }
                break;
            case "Previous":
                lblNodeId.Text = ((Node)SessionClass.Flow[SessionClass.Step]).from.ToString();
                lblTitle.Text = ((Node)SessionClass.Flow[SessionClass.Step]).fromTitle;
                lblNodeType.Text = ((Node)SessionClass.Flow[0]).type.ToString();
                RadioButtonList1.SelectedValue = ((Node)SessionClass.Flow[SessionClass.Step]).decision.ToString();
                break;
        }
    }
    protected void lnkBtnFirst_Click(object sender, EventArgs e)
    {
        SessionClass.Step = 0;
        LoadQuestion("First");
        applyWizardSteps();
    }
    protected void lnkBtnNext_Click(object sender, EventArgs e)
    {
        SessionClass.Step += 1;
        LoadQuestion("Next");
        applyWizardSteps();
    }
    protected void lnkBtnPrevious_Click(object sender, EventArgs e)
    {
        SessionClass.Step -= 1;
        LoadQuestion("Previous");
        lnkBtnFinish.Visible = false;
        applyWizardSteps();
    }
    protected void lnkBtnFinish_Click(object sender, EventArgs e)
    {
        string fileName = SessionClass.getExpertImage();
        MESDSTableAdapters.UserCasesTableAdapter ta = new MESDSTableAdapters.UserCasesTableAdapter();
        ta.Insert(Session["UserName"].ToString(), fileName, DateTime.Now);
        Response.Redirect("MyCases.aspx");
    }
}