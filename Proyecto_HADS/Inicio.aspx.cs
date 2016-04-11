using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AccesoDatos;

namespace Proyecto_HADS
{
    public partial class Inicio : System.Web.UI.Page
    {
        AccesoDatos.accesoDatos acceso = new AccesoDatos.accesoDatos();

        private const int PROFESOR = 1, ALUMNO = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
            redireccionar();
            string result = acceso.conectar();
            

        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            acceso.cerrarconexion();
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            int tipo = acceso.validUser(tbLogInCorreo.Text, tbLogInPassword.Text);
            if (tipo == PROFESOR)
            {
                Session["correo"] = tbLogInCorreo.Text;
                Session["tipo"] = "P";
                Response.Redirect("profesor/Profesor.aspx");
            }
            else if (tipo == ALUMNO)
            {
                Session["correo"] = tbLogInCorreo.Text;
                Session["tipo"] = "A";
                Response.Redirect("alumno/Alumno.aspx");
            }
            else
            {
                lblError.Text = "Los datos no coinciden";
            }

        }

        private void redireccionar()
        {
            if (Session["tipo"]!= null && ((string)Session["tipo"]).Equals("P"))
                Response.Redirect("Profesor.aspx");
            else if (Session["tipo"]!= null && ((string)Session["tipo"]).Equals("A"))
                Response.Redirect("Alumno.aspx");

        }
    }
}