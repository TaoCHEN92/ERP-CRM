using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpCookie authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket("a", false, 1);
            try
            {
                ticket = FormsAuthentication.Decrypt(authCookie.Value);
            }
            catch (Exception) { }
            if (!string.IsNullOrWhiteSpace(ticket.UserData))
                Response.Redirect("Main.aspx");
            else
            {
                string MyAbsolutePath = this.Request.Url.AbsolutePath.ToString();
                if (!MyAbsolutePath.Contains("Default.aspx"))
                    Response.Redirect("Default.aspx");
            }
        }
    }
}
