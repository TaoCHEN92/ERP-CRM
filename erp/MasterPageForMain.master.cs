using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPageForMain : System.Web.UI.MasterPage
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
                lblUserName.Text = "欢迎您  : " + ticket.UserData.Substring(1);
            else
                Response.Redirect("Default.aspx");
        }
    }
    protected void imgbtnSignOut_Click(object sender, ImageClickEventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Abandon();

        // clear authentication cookie
        HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
        cookie1.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(cookie1);

        // clear session cookie (not necessary for your current problem but i would recommend you do it anyway)
        HttpCookie cookie2 = new HttpCookie("ASP.NET_SessionId", "");
        cookie2.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(cookie2);

        Response.Redirect("Default.aspx");
    }
}
