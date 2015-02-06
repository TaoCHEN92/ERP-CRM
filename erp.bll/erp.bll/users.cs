using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Diagnostics;
using System.Security;
using System.Security.Principal;
using erp.dal;



namespace erp.bll
{
    public class users 
    {
        public static bool UserIsValid(string login, string password)
        {
            string un = (login ?? string.Empty).Trim();
            string pw = (password ?? string.Empty).Trim();

            if (!string.IsNullOrWhiteSpace(un) && !string.IsNullOrWhiteSpace(pw))
            {
                DataSet DS = new DataSet();
                DS = daousers.GetUserDetailByLogin(un);

                if (DS.Tables[0].Rows.Count != 0 && DS.Tables[0].Rows[0]["password"].ToString() == password)
                {
                    HttpContext context = HttpContext.Current;
                    DateTime expirationDate = DateTime.Now.Add(FormsAuthentication.Timeout);
                    bool rememberMe = false;
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                        1,
                        un,
                        DateTime.Now,
                        expirationDate,
                        rememberMe,
                        string.Format("{0}", DS.Tables[0].Rows[0]["class"].ToString()),
                        FormsAuthentication.FormsCookiePath
                    );

                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);

                    // setting a custom cookie name based on the current blog instance.
                    // if !rememberMe, set expires to DateTime.MinValue which makes the
                    // cookie a browser-session cookie expiring when the browser is closed.
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    cookie.Expires = rememberMe ? expirationDate : DateTime.MinValue;
                    cookie.HttpOnly = true;
                    context.Response.Cookies.Set(cookie);

                    return true;
                }
            }

            return false;
        }
    }
}
