using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using erp.bll;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginUser_OnAuthenticate(object sender, AuthenticateEventArgs e)
    {
        string errMsg = "";
        // always set to false
        e.Authenticated = false;
        if (users.UserIsValid(LoginUser.UserName, LoginUser.Password))
            Response.Redirect("main.aspx");
        else
            errMsg = "用户名或密码错误！";
    }
}