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
        string date_done = "";
        string date_delivery = "";
        string remark = txaRemark.InnerText;

        // Get values of controls which are created for Material Info

        command.CommandInsert(id_command, id_command_last, id_cilent, name_product, date_pre_done,
                date_begin, format, quantity, price_unit, unit, status, date_done, date_delivery, remark);

        gvcommand.DataBind();
    }
}