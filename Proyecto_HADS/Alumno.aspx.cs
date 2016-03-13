using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Proyecto_HADS
{
    public partial class Alumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            validConexion();
        }

        protected void validConexion()
        {
            
            if (Session["correo"] == null || !((string)Session["tipo"]).Equals("A"))
                Response.Redirect("Inicio.aspx");
        }

    }
}