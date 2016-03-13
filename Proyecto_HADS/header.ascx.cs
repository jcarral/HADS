using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_HADS
{
    public partial class header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNumUsers.Text = Application.Contents["numerosocios"].ToString();
            if (Session["correo"] != null)
            {
                lblTxt.Text = "Correo electrónico: ";
                lblNombre.Text = Session["correo"].ToString();
                Button1.Visible = true;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Inicio.aspx");
        }

       
    }
}