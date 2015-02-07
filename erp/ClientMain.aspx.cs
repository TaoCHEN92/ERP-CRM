using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erp.bll;

public partial class ClientMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnNewEnterprise_click(object sender, EventArgs e)
    {
        client.ClientInsert(tbNewEnterprise.Text, tbNewPhoneNumber.Text,tbNewFaxNumber.Text, tbNewAddress.Text);
        gvclient.DataBind();
        resetAllField();

    }
    protected void resetAllField()
    {
        tbNewEnterprise.Text = "";
        tbNewPhoneNumber.Text = "";
        tbNewAddress.Text = "";
    }
}