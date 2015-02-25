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
        string status = "待生产";
        string date_done = null;
        string date_delivery = null;
        string remark = txaRemark.InnerText;

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
                    date_begin, format, quantity, price_unit, unit, status, date_done, date_delivery, remark);

        gvcommand.DataBind();
    }
}