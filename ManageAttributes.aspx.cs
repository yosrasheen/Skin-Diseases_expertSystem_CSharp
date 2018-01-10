using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageAttributes : System.Web.UI.Page
{
    MESDSTableAdapters.SyptomsAttributesTableAdapter ta;
    MESDSTableAdapters.ExpertNodesTableAdapter tan;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsAdmin"] == null)
            Response.Redirect("Default.aspx");
        if (!Boolean.Parse(Session["IsAdmin"].ToString()))
            Response.Redirect("Default.aspx");
        if (!Page.IsPostBack)
        {
            GridView1.DataBind();
        }

    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        tan = new MESDSTableAdapters.ExpertNodesTableAdapter();
        tan.Delete(long.Parse(tan.GetDataByIdndType(long.Parse(e.Keys[0].ToString()), int.Parse(e.Values[1].ToString())).Rows[0]["ID"].ToString()));
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblId.Text = GridView1.SelectedRow.Cells[2].Text;
        txtNo.Text = GridView1.SelectedRow.Cells[2].Text;
        txtTitle.Text = GridView1.SelectedRow.Cells[3].Text;
        ddType.SelectedValue = GridView1.SelectedRow.Cells[4].Text;
     }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            foreach (DataControlField dcf in GridView1.Columns)
            {
                if (dcf.ToString() == "CommandField")
                {
                    if (((CommandField)dcf).ShowDeleteButton == true)
                    {
                        e.Row.Cells[GridView1.Columns.IndexOf(dcf)].Attributes.Add("onclick", "return confirm(\"Are you sure?\")");
                    }
                }
            }
        }
    }
    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        lblId.Text = "";
        txtNo.Text = "";
        txtTitle.Text = "";
        ddType.SelectedValue = "3";
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ta = new MESDSTableAdapters.SyptomsAttributesTableAdapter();
        MESDS meds = new MESDS();
        MESDS.SyptomsAttributesRow dr;
        if (lblId.Text.Equals(""))
        {
            tan = new MESDSTableAdapters.ExpertNodesTableAdapter();
            dr = meds.SyptomsAttributes.NewSyptomsAttributesRow();
            dr.AttributeTitle = txtTitle.Text;
            dr.AttributeType = int.Parse(ddType.SelectedValue);
            meds.SyptomsAttributes.AddSyptomsAttributesRow(dr);
            ta.Update(dr);
            dr.AcceptChanges();
            tan.Insert(dr.ID, int.Parse(ddType.SelectedValue));
        }
        else
        {
            ta.Update(txtTitle.Text, int.Parse(ddType.SelectedValue), long.Parse(lblId.Text));
        }
        GridView1.DataBind();
    }
}