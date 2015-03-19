using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erp.bll;

public partial class CommandMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(gvcommand.SortExpression)) gvcommand.Sort("date_pre_done", SortDirection.Descending);
    }
    protected void btnNewCommand_click(object sender, EventArgs e)
    {
        
        // Get values of controls which are created for Command Info

        string id_command = tbIdCommand.Text;
        string id_command_last = tbIdCommand_last.Text;
        string id_cilent = ddlNameClient.SelectedValue;
        string name_product = tbNameProduct.Text;
        string date_pre_done = tbDatePreDone.Text;
        string date_begin = DateTime.Now.ToString();
        string format = tbFormat.Text;
        string quantity = tbQuantity.Text;
        string price_unit = tbPriceUnit.Text;
        string unit = ddlUnit.SelectedItem.ToString();
        string date_done = null;
        string date_pay = null;
        string remark = txaRemark.InnerText;
        string Is_Done = "0";
        string Is_Sent = "0";
        string Is_Paid = "0";

        // Get values of controls which are created for Material Info

        List<string> list_material = new List<string> ();
        list_material.Add(ddlMaterial_1.SelectedValue);
        list_material.Add(ddlMaterial_2.SelectedValue);
        list_material.Add(ddlMaterial_3.SelectedValue);
        list_material.Add(ddlMaterial_4.SelectedValue);

        List<string> list_material_quantity = new List<string> ();
        list_material_quantity.Add(tbQuantityMaterial_1.Text);
        list_material_quantity.Add(tbQuantityMaterial_2.Text);
        list_material_quantity.Add(tbQuantityMaterial_3.Text);
        list_material_quantity.Add(tbQuantityMaterial_4.Text);

        for (int i = 0; i < 4; i++)
        {
            if (!string.IsNullOrWhiteSpace(list_material_quantity[i]))
                material.Material_Used_Insert(id_command, list_material[i], list_material_quantity[i]);
        }

        command.CommandInsert(id_command, id_command_last, id_cilent, name_product, date_pre_done,
                date_begin, format, quantity, price_unit, unit, date_done, date_pay, remark, Is_Done, Is_Sent, Is_Paid);

        gvcommand.DataBind();
        ResetAll();
    }
    protected void btnAddNewMatrial_click(object sender, EventArgs e)
    {
        string id_command = lbl_id_command.Text;

        List<string> list_material = new List<string>();
        list_material.Add(ddlMaterialadd_1.SelectedValue);
        list_material.Add(ddlMaterialadd_2.SelectedValue);
        list_material.Add(ddlMaterialadd_3.SelectedValue);
        list_material.Add(ddlMaterialadd_4.SelectedValue);

        List<string> list_material_quantity = new List<string>();
        list_material_quantity.Add(tbQuantityMaterialadd_1.Text);
        list_material_quantity.Add(tbQuantityMaterialadd_2.Text);
        list_material_quantity.Add(tbQuantityMaterialadd_3.Text);
        list_material_quantity.Add(tbQuantityMaterialadd_4.Text);

        for (int i = 0; i < 4; i++)
        {
            if (!string.IsNullOrWhiteSpace(list_material_quantity[i]))
                material.Material_Used_Insert(id_command, list_material[i], list_material_quantity[i]);
        }
        odsMaterial.DataBind();
        GridView gvMaterialUsed = (GridView)fvcommand.FindControl("gvcommand_used");
        gvMaterialUsed.DataBind();
        
    }
    protected void gvcommand_SelectedIndexChanged(object sender, EventArgs e)
    {
        fvcommand.Visible = true;
        string id_command = gvcommand.SelectedDataKey.Value.ToString();

        odscommand_fv.SelectParameters["id_command"].DefaultValue = id_command;
        odsMaterialUsed.SelectParameters["id_command"].DefaultValue = id_command;
        odsDeliveryRecord.SelectParameters["id_command"].DefaultValue = id_command;
        lbl_id_command_delivery.Text = id_command;
        fvcommand.ChangeMode(FormViewMode.ReadOnly);
        odscommand_fv.DataBind();
        fvcommand.DataBind();

        GridView gvMaterialUsed = (GridView)fvcommand.FindControl("gvcommand_used");
        gvMaterialUsed.DataBind();
        GridView gvDeliveryRecord = (GridView)fvcommand.FindControl("gvDeliveryRecord");
        gvDeliveryRecord.DataBind();
    }
    protected void gvcommand_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[1].Text == "生产中")
            {
                e.Row.Cells[1].BackColor = System.Drawing.Color.FromArgb(255, 255, 168);
            }
            else if (e.Row.Cells[1].Text == "已付款")
            {
                e.Row.Cells[1].BackColor = System.Drawing.Color.FromArgb(140, 255, 181);
            }
        }
    }
    public void ResetAll() 
    {
        tbIdCommand.Text = "";
        tbIdCommand_last.Text = "";
        tbNameProduct.Text = "";
        tbFormat.Text = "";
        tbDatePreDone.Text = "";
        tbPriceUnit.Text = "";
        tbQuantity.Text = "";
        tbQuantityMaterial_1.Text = "";
        tbQuantityMaterial_2.Text = "";
        tbQuantityMaterial_3.Text = "";
        tbQuantityMaterial_4.Text = "";
        txaRemark.InnerText = "";

        tbQuantityMaterialadd_1.Text = "";
        tbQuantityMaterialadd_2.Text = "";
        tbQuantityMaterialadd_3.Text = "";
        tbQuantityMaterialadd_4.Text = "";
        lbl_id_command.Text = "";
        lbl_id_command_delivery.Text = "";
        tbQuantityDelivery.Text = "";
    }
    protected void gvcommand_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String id_command = e.CommandArgument.ToString();
        if (e.CommandName.ToString() == "Edit")
        {
            fvcommand.Visible = true;
            odscommand_fv.SelectParameters["id_command"].DefaultValue = id_command;
            odsMaterialUsed.SelectParameters["id_command"].DefaultValue = id_command;
            lbl_id_command.Text = id_command;
            fvcommand.ChangeMode(FormViewMode.Edit);
            odscommand_fv.DataBind();
            fvcommand.DataBind();
            GridView gvMaterialUsed = (GridView)fvcommand.FindControl("gvcommand_used");
            gvMaterialUsed.DataBind();
        }
        odscommand_gv.DataBind();
        gvcommand.DataBind();
    }
    public void odscommand_fv_Updated(Object source, ObjectDataSourceStatusEventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void gvDeliveryRecord_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int total = 0;

            Label lblDeliveryQuantity = (Label)e.Row.FindControl("lblDeliveryQuantity");
            int quantity = Int32.Parse(lblDeliveryQuantity.Text);
            total += quantity;

        lblsum.Text = total.ToString();
    }
}