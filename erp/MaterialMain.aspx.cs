using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erp.bll;

public partial class MaterialMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnNewMaterial_click(object sender, EventArgs e)
    {
        material.MaterialInsert(tbNewMaterial.Text, ddlTypeNewMaterial.SelectedItem.ToString(), ddlUnitNewMaterial.SelectedItem.ToString(), tbNewMaterialSupplier.Text, tbNewMaterilStock.Text);
        gvmaterial.DataBind();
        resetAllField();
    }
    protected void resetAllField()
    {
        tbNewMaterial.Text = "";
        tbNewMaterialSupplier.Text = "";
        tbNewMaterilStock.Text = "";
    }
    
}