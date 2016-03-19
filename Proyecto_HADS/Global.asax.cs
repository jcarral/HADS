using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.SqlClient;

namespace Proyecto_HADS
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application.Contents["numerosocios"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=tcp:hads19.database.windows.net,1433;Initial Catalog=Users;User ID=hads19@hads19;Password=Serpiente19");
            Session["conexion"] = conn;
            Application.Lock();
            int ns = (int) Application.Contents["numerosocios"] + 1;
            Application.Contents["numerosocios"] = ns;
            Application.UnLock();
            

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            int ns = (int) Application.Contents["numerosocios"] -1;
            Application.Contents["numerosocios"] = ns;
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}